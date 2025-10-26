import 'package:flutter/material.dart';

class LocationActionButtons extends StatelessWidget {
  final VoidCallback? onGetCurrentLocation;
  final VoidCallback? onSelectOnMap;
  final bool isLoading;
  
  const LocationActionButtons({
    super.key,
    this.onGetCurrentLocation,
    this.onSelectOnMap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        TextButton.icon(
          onPressed: isLoading ? null : onGetCurrentLocation,
          icon: isLoading 
            ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : const Icon(Icons.location_on),
          label: const Text('Get Current Location'),
        ),
        TextButton.icon(
          onPressed: onSelectOnMap,
          icon: const Icon(Icons.map),
          label: const Text('Select on Map'),
        ),
      ],
    );
  }
}