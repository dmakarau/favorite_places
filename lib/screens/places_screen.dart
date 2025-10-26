import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_favorite_places/providers/user_places.dart';
import 'package:my_favorite_places/screens/add_places.dart';
import 'package:my_favorite_places/widgets/place_list_widget.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(
              "My Places",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            backgroundColor: Theme.of(context).colorScheme.surface,
            surfaceTintColor: Theme.of(context).colorScheme.surfaceContainerLow,
            actions: [
              IconButton(
                icon: const Icon(Icons.search_rounded),
                onPressed: () {
                  // TODO: Implement search functionality
                },
                tooltip: 'Search places',
              ),
              PopupMenuButton<String>(
                icon: const Icon(Icons.more_vert_rounded),
                onSelected: (value) {
                  switch (value) {
                    case 'sort':
                      // TODO: Implement sorting
                      break;
                    case 'settings':
                      // TODO: Open settings
                      break;
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 'sort',
                    child: Row(
                      children: [
                        Icon(Icons.sort_rounded),
                        SizedBox(width: 12),
                        Text('Sort places'),
                      ],
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'settings',
                    child: Row(
                      children: [
                        Icon(Icons.settings_rounded),
                        SizedBox(width: 12),
                        Text('Settings'),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: userPlaces.isEmpty 
              ? const SizedBox(height: 100) // Space for empty state
              : Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_rounded,
                        size: 16,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "${userPlaces.length} ${userPlaces.length == 1 ? 'place' : 'places'}",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
          ),
          SliverFillRemaining(
            child: PlaceList(places: userPlaces),
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const AddPlacesScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.easeInOutCubic;

                  var tween = Tween(begin: begin, end: end).chain(
                    CurveTween(curve: curve),
                  );

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 300),
              ),
            );
          },
          icon: const Icon(Icons.add_location_rounded),
          label: const Text("Add Place"),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}
