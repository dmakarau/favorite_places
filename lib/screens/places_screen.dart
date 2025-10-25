import 'package:flutter/material.dart';
import 'package:my_favorite_places/screens/add_places.dart';
import 'package:my_favorite_places/widgets/place_list_widget.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigate to add places screen
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const AddPlacesScreen()),
              );
            },
          ),
        ],
      ),
      body: PlaceList(places: []),
    );
  }
}
