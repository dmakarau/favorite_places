import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_favorite_places/model/place.dart';
import 'package:my_favorite_places/widgets/image_input.dart';
import 'package:my_favorite_places/widgets/location_input.dart';

class AddPlaceForm extends StatefulWidget {
  final void Function({
    required String title,
    required File image,
    required PlaceLocation location,
  }) onSave;
  
  const AddPlaceForm({super.key, required this.onSave});

  @override
  State<AddPlaceForm> createState() => _AddPlaceFormState();
}

class _AddPlaceFormState extends State<AddPlaceForm> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _titleController.text.trim().isNotEmpty &&
           _selectedImage != null &&
           _selectedLocation != null;
  }

  void _handleSave() {
    if (_isFormValid) {
      widget.onSave(
        title: _titleController.text.trim(),
        image: _selectedImage!,
        location: _selectedLocation!,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _titleController,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onChanged: (value) => setState(() {}), // Trigger rebuild for button state
          ),
          const SizedBox(height: 10),
          ImageInput(
            onPickImage: (image) {
              setState(() {
                _selectedImage = image;
              });
            },
          ),
          const SizedBox(height: 10),
          LocationInput(
            onSelectLocation: (location) {
              setState(() {
                _selectedLocation = location;
              });
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton.icon(
            onPressed: _isFormValid ? _handleSave : null,
            label: const Text('Add Place'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}