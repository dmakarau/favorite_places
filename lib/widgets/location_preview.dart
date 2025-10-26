import 'package:flutter/material.dart';

class LocationPreview extends StatelessWidget {
  final String? imageUrl;
  final bool isLoading;
  
  const LocationPreview({
    super.key,
    this.imageUrl,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget content;
    
    if (isLoading) {
      content = const CircularProgressIndicator();
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      content = Image.network(
        imageUrl!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.error,
            size: 48,
            color: Colors.red,
          );
        },
      );
    } else {
      content = Text(
        'No Location Chosen',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      );
    }

    return Container(
      height: 170,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
        ),
      ),
      child: content,
    );
  }
}