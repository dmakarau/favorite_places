import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_favorite_places/config/api_keys.dart';

class LocationService {
  static const String _baseUrl = 'https://maps.googleapis.com/maps/api';
  
  /// Convert coordinates to human-readable address
  static Future<String> getAddressFromCoordinates(
    double latitude, 
    double longitude,
  ) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/geocode/json?latlng=$latitude,$longitude&key=${ApiKeys.googleMapsApiKey}',
      );
      
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        
        if (responseData['results'] != null && 
            responseData['results'].isNotEmpty) {
          return responseData['results'][0]['formatted_address'] as String;
        }
      }
      
      throw Exception('Failed to get address');
    } catch (e) {
      throw Exception('Error getting address: $e');
    }
  }
  
  /// Generate static map URL for location preview
  static String getStaticMapUrl(double latitude, double longitude) {
    return '$_baseUrl/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=${ApiKeys.googleMapsApiKey}';
  }
}