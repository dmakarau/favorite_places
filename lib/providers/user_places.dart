import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_favorite_places/model/place.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> _getDatabase() async  {
  final dbPath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(
      path.join(dbPath, 'places.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)',
        );
      },
      version: 1,
    );
    return db;
}

class UserPlacesNotifier extends Notifier<List<Place>> {
  @override
  List<Place> build() {
    return const [];
  }

  Future<void> loadPlaces() async {
    final db = await _getDatabase();
    final data = await db.query('user_places');
    final validPlaces = <Place>[];
    
    // Clean up old cache files from previous versions
    await _cleanupCacheFiles();
    
    for (final row in data) {
      final imagePath = row['image'] as String;
      final imageFile = File(imagePath);
      
      // Check if image file exists and is not empty
      if (await imageFile.exists()) {
        try {
          final fileSize = await imageFile.length();
          if (fileSize > 0) {
            // File exists and has content, create place
            final place = Place(
              id: row['id'] as String,
              title: row['title'] as String,
              image: imageFile,
              location: PlaceLocation(
                latitude: row['lat'] as double,
                longitude: row['lng'] as double,
                address: row['address'] as String? ?? '',
              ),
            );
            validPlaces.add(place);
          } else {
            // File is empty, remove from database
            print('Removing place with empty image file: $imagePath');
            await db.delete('user_places', where: 'id = ?', whereArgs: [row['id']]);
          }
        } catch (e) {
          // Error reading file, remove from database
          print('Error reading image file $imagePath: $e');
          await db.delete('user_places', where: 'id = ?', whereArgs: [row['id']]);
        }
      } else {
        // File doesn't exist, remove from database
        print('Removing place with missing image file: $imagePath');
        await db.delete('user_places', where: 'id = ?', whereArgs: [row['id']]);
      }
    }

    state = validPlaces;
  }

  /// Clean up orphaned cache files that might still exist from older versions
  Future<void> _cleanupCacheFiles() async {
    try {
      final cacheDir = await syspaths.getApplicationCacheDirectory();
      final cacheFiles = await cacheDir.list().toList();
      
      for (final file in cacheFiles) {
        if (file is File && file.path.contains('scaled_')) {
          // This looks like an old image file from cache directory
          try {
            await file.delete();
            print('Cleaned up old cache file: ${file.path}');
          } catch (e) {
            print('Could not delete cache file ${file.path}: $e');
          }
        }
      }
    } catch (e) {
      print('Error during cache cleanup: $e');
    }
  }

  void addPlace(String title, File image, PlaceLocation? location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final uniqueFileName = '${timestamp}_$fileName';
    final copiedImage = await image.copy('${appDir.path}/$uniqueFileName');
    final newPlace = Place(
      title: title,
      image: copiedImage,
      location: location,
    );

    final db = await _getDatabase();

    db.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'lat': newPlace.location?.latitude,
      'lng': newPlace.location?.longitude,
      'address': newPlace.location?.address,
    });

    state = [newPlace, ...state];
  }

  Future<void> deletePlace(String placeId) async {
    // Find the place to get its image path
    final placeToDelete = state.firstWhere((place) => place.id == placeId);
    
    // Delete from database
    final db = await _getDatabase();
    await db.delete(
      'user_places',
      where: 'id = ?',
      whereArgs: [placeId],
    );

    // Delete the image file if it exists
    try {
      if (await placeToDelete.image.exists()) {
        await placeToDelete.image.delete();
      }
    } catch (e) {
      print('Warning: Could not delete image file: $e');
      // Continue anyway - database record is more important
    }

    // Update state to remove the place
    state = state.where((place) => place.id != placeId).toList();
  }
}

final userPlacesProvider = NotifierProvider<UserPlacesNotifier, List<Place>>(
  () => UserPlacesNotifier(),
);
