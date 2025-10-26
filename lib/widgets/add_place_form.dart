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

class _AddPlaceFormState extends State<AddPlaceForm> with TickerProviderStateMixin {
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  File? _selectedImage;
  PlaceLocation? _selectedLocation;
  
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    
    _animationController.forward();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  bool get _isFormValid {
    return _titleController.text.trim().isNotEmpty &&
           _selectedImage != null &&
           _selectedLocation != null;
  }

  void _handleSave() {
    if (_formKey.currentState!.validate() && _isFormValid) {
      widget.onSave(
        title: _titleController.text.trim(),
        image: _selectedImage!,
        location: _selectedLocation!,
      );
    } else {
      // Show validation errors with haptic feedback
      if (_selectedImage == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.camera_alt_outlined, color: Colors.white),
                SizedBox(width: 12),
                Text('Please take a photo of your place'),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      } else if (_selectedLocation == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Row(
              children: [
                Icon(Icons.location_on_outlined, color: Colors.white),
                SizedBox(width: 12),
                Text('Please add location information'),
              ],
            ),
            backgroundColor: Theme.of(context).colorScheme.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Section
              Text(
                "Place Details",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Give your place a memorable name",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              
              // Title Input
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Place Name',
                  hintText: 'e.g., Sunset Beach, Coffee Corner...',
                  prefixIcon: const Icon(Icons.edit_outlined),
                  suffixIcon: _titleController.text.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.clear),
                          onPressed: () {
                            setState(() {
                              _titleController.clear();
                            });
                          },
                        )
                      : null,
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a name for your place';
                  }
                  return null;
                },
                onChanged: (value) => setState(() {}),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 32),
              
              // Photo Section
              Text(
                "Photo",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Capture the essence of this place",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              ImageInput(
                onPickImage: (image) {
                  setState(() {
                    _selectedImage = image;
                  });
                },
              ),
              const SizedBox(height: 32),
              
              // Location Section
              Text(
                "Location",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Let us know where this place is",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              LocationInput(
                onSelectLocation: (location) {
                  setState(() {
                    _selectedLocation = location;
                  });
                },
              ),
              const SizedBox(height: 40),
              
              // Save Button
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  onPressed: _isFormValid ? _handleSave : null,
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Save Place'),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // Progress Indicator
              if (_isFormValid) ...[
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle_outline,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Ready to save!",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}