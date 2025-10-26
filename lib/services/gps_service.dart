import 'package:location/location.dart';
import 'package:my_favorite_places/model/place.dart';
import 'package:my_favorite_places/services/location_service.dart';

class GpsService {
  static final Location _location = Location();
  
  /// Check and request location permissions
  static Future<bool> _checkPermissions() async {
    bool serviceEnabled = await _location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    PermissionStatus permissionGranted = await _location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await _location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return false;
      }
    }
    
    return true;
  }
  
  /// Get current user location with address
  static Future<PlaceLocation> getCurrentLocation() async {
    final hasPermission = await _checkPermissions();
    if (!hasPermission) {
      throw Exception('Location permissions not granted');
    }
    
    try {
      final locationData = await _location.getLocation();
      final lat = locationData.latitude;
      final lng = locationData.longitude;
      
      if (lat == null || lng == null) {
        throw Exception('Unable to get location coordinates');
      }
      
      // Get address from coordinates
      final address = await LocationService.getAddressFromCoordinates(lat, lng);
      
      return PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: address,
      );
    } catch (e) {
      throw Exception('Error getting current location: $e');
    }
  }
}