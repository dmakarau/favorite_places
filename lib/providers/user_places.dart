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
    final places = data.map((row) {
      final imagePath = row['image'] as String;
      final imageFile = File(imagePath);
      
      // Check if image file exists, if not, we might need to handle this case
      if (!imageFile.existsSync()) {
        print('Warning: Image file not found at $imagePath');
        // You could either skip this place or use a default image
        // For now, we'll still create the File object but it won't display
      }
      
      return Place(
        id: row['id'] as String,
        title: row['title'] as String,
        image: imageFile,
        location: PlaceLocation(
          latitude: row['lat'] as double,
          longitude: row['lng'] as double,
          address: row['address'] as String? ?? '',
        ),
      );
    }).toList();

    state = places;
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
}

final userPlacesProvider = NotifierProvider<UserPlacesNotifier, List<Place>>(
  () => UserPlacesNotifier(),
);
