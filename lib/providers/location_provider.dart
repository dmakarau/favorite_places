import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_favorite_places/model/place.dart';
import 'package:my_favorite_places/services/gps_service.dart';

/// Provider for current location state
final currentLocationProvider = NotifierProvider<CurrentLocationNotifier, AsyncValue<PlaceLocation?>>(() {
  return CurrentLocationNotifier();
});

class CurrentLocationNotifier extends Notifier<AsyncValue<PlaceLocation?>> {
  @override
  AsyncValue<PlaceLocation?> build() {
    return const AsyncValue.data(null);
  }

  /// Get current user location
  Future<void> getCurrentLocation() async {
    state = const AsyncValue.loading();
    
    try {
      final location = await GpsService.getCurrentLocation();
      state = AsyncValue.data(location);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
  
  /// Clear current location
  void clearLocation() {
    state = const AsyncValue.data(null);
  }
}