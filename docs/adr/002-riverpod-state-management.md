# ADR-002: State Management with Riverpod

**Date:** 2025-10-26  
**Status:** Accepted  
**Deciders:** Development Team  

## Context

The application needed a robust state management solution that supports:
- Async operations with loading/error states
- Dependency injection
- Testability
- Performance optimization

## Decision

We will use **Riverpod 3.0+** with the following patterns:

- `AsyncNotifier` for complex state management
- `AsyncValue` for handling loading/error states
- Provider-based dependency injection
- Consumer widgets for state consumption

## Implementation Details

```dart
// Provider definition
final currentLocationProvider = AsyncNotifierProvider<CurrentLocationNotifier, PlaceLocation?>(
  () => CurrentLocationNotifier(),
);

// State management
class CurrentLocationNotifier extends AsyncNotifier<PlaceLocation?> {
  @override
  FutureOr<PlaceLocation?> build() => null;
  
  Future<void> getCurrentLocation() async {
    state = const AsyncLoading();
    try {
      final location = await GpsService.getCurrentLocation();
      state = AsyncData(location);
    } catch (error) {
      state = AsyncError(error, StackTrace.current);
    }
  }
}
```

## Consequences

### Positive
- Excellent async state handling
- Built-in loading/error states
- Great developer experience
- Performance optimizations
- Easy testing

### Negative
- Learning curve for team members
- Additional dependency

## Alternatives Considered

1. **Provider Package**: Limited async handling
2. **BLoC**: More complex than needed
3. **setState**: Not scalable
4. **Redux**: Too much boilerplate

## Decision Drivers

- Async-first design
- Error handling requirements
- Performance considerations
- Developer experience
- Community adoption