import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_favorite_places/model/place.dart';
import 'package:my_favorite_places/providers/location_provider.dart';
import 'package:my_favorite_places/services/location_service.dart';
import 'package:my_favorite_places/widgets/location_preview.dart';
import 'package:my_favorite_places/widgets/location_action_buttons.dart';

class LocationInput extends ConsumerWidget {
  const LocationInput({super.key, required this.onSelectLocation});

  final void Function(PlaceLocation location)? onSelectLocation;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationState = ref.watch(currentLocationProvider);
    
    return Column(
      children: [
        locationState.when(
          data: (location) => LocationPreview(
            imageUrl: location != null 
              ? LocationService.getStaticMapUrl(location.latitude, location.longitude)
              : null,
          ),
          loading: () => const LocationPreview(isLoading: true),
          error: (error, stack) => LocationPreview(
            imageUrl: null,
          ),
        ),
        LocationActionButtons(
          isLoading: locationState.isLoading,
          onGetCurrentLocation: () async {
            await ref.read(currentLocationProvider.notifier).getCurrentLocation();
            
            final currentLocation = ref.read(currentLocationProvider).value;
            if (currentLocation != null && onSelectLocation != null) {
              onSelectLocation!(currentLocation);
            }
          },
          onSelectOnMap: () {
            // TODO: Implement map selection
          },
        ),
      ],
    );
  }
}
