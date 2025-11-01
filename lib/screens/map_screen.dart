import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_favorite_places/model/place.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.location, this.isSelecting = true});

  final PlaceLocation? location;
  final bool isSelecting;

  // Default location getter
  PlaceLocation get defaultLocation =>
      PlaceLocation(latitude: 37.422, longitude: -122.084, address: "");

  // Get the location to use (provided location or default)
  PlaceLocation get locationToUse => location ?? defaultLocation;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    final currentLocation = widget.locationToUse;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isSelecting ? "Pick a Location" : "Map"),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: _pickedLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(
                        PlaceLocation(
                          latitude: _pickedLocation!.latitude,
                          longitude: _pickedLocation!.longitude,
                          address: "", // Address will be resolved in location_input
                        ),
                      );
                    },
            ),
        ],
      ),
      body: GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          // Map created successfully
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 16,
        ),
        onTap: widget.isSelecting
            ? (LatLng position) {
                setState(() {
                  _pickedLocation = position;
                });
              }
            : null,
        markers: {
          Marker(
            markerId: const MarkerId('picked_location'),
            position: _pickedLocation ??
                LatLng(currentLocation.latitude, currentLocation.longitude),
          ),
        },
      ),
    );
  }
}
