import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_favorite_places/providers/user_places.dart';
import 'package:my_favorite_places/widgets/add_place_form.dart';

class AddPlacesScreen extends ConsumerWidget {
  const AddPlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a New Place")),
      body: AddPlaceForm(
        onSave: ({required title, required image, required location}) {
          ref.read(userPlacesProvider.notifier).addPlace(title, image, location);
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
