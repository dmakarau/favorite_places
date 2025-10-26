# System Architecture

This document describes the current architecture of the My Favorite Places Flutter application.

## 🏗️ Architecture Overview

The application follows **Clean Architecture** principles with clear separation of concerns:

```
📱 Presentation Layer (UI)
    ↓
🎯 Provider Layer (State Management) 
    ↓
🔧 Service Layer (Business Logic)
    ↓
🌐 External Layer (APIs, Hardware)
```

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── config/
│   └── api_keys.dart           # Environment configuration
├── model/
│   └── place.dart              # Data models
├── services/                   # Business logic layer
│   ├── location_service.dart   # Google Maps API integration
│   └── gps_service.dart       # GPS hardware abstraction
├── providers/                  # State management layer
│   ├── user_places.dart       # Places state management
│   └── location_provider.dart  # Location state management
├── screens/                    # UI screens
│   ├── places_screen.dart      # Main places list
│   ├── add_places.dart         # Add place form
│   └── places_details.dart     # Place details view
└── widgets/                    # Reusable UI components
    ├── add_place_form.dart     # Form component
    ├── location_input.dart     # Location input widget
    ├── location_preview.dart   # Map preview component
    ├── location_action_buttons.dart # Action buttons
    ├── image_input.dart        # Image picker
    └── place_list_widget.dart  # Places list
```

## 🔧 Service Layer

### LocationService
- **Purpose**: Google Maps API integration
- **Responsibilities**: 
  - Address geocoding
  - Static map URL generation
  - API key management
- **Type**: Static class (stateless)

### GpsService  
- **Purpose**: Device GPS functionality
- **Responsibilities**:
  - Current location detection
  - Permission handling
  - Error management
- **Type**: Static class (stateless)

## 🎯 Provider Layer

### CurrentLocationNotifier
- **Purpose**: Location state management
- **Pattern**: AsyncNotifier with AsyncValue
- **States**: Loading, Data, Error
- **Integration**: Uses GpsService and LocationService

### UserPlacesNotifier
- **Purpose**: Places collection management
- **Pattern**: Notifier with List state
- **Operations**: Add, remove, list places
- **Persistence**: In-memory (future: database)

## 📱 UI Layer

### Screens
- **Composition-based**: Use components instead of implementing logic
- **Consumer widgets**: Access providers for state
- **Minimal logic**: Focus on UI and navigation

### Components
- **Single responsibility**: Each widget has one clear purpose
- **Reusable**: Can be used across different screens
- **Callback patterns**: Communication with parent widgets

## 🔄 Data Flow

```
1. User Action (UI)
   ↓
2. Provider Method Call
   ↓
3. Service Layer Operation
   ↓
4. External API/Hardware
   ↓
5. Service Response
   ↓
6. Provider State Update
   ↓
7. UI Rebuild
```

## 🔒 Security Architecture

- **Environment Variables**: API keys stored in `.env` file
- **Configuration Layer**: Centralized access through `ApiKeys` class
- **Permission Management**: GPS and camera permissions handled properly
- **Error Boundaries**: Comprehensive error handling at each layer

## 📊 State Management Patterns

### AsyncValue Pattern
```dart
// Loading state
state = const AsyncLoading();

// Success state  
state = AsyncData(result);

// Error state
state = AsyncError(error, stackTrace);
```

### Consumer Pattern
```dart
class MyWidget extends ConsumerWidget {
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(someProvider);
    return asyncValue.when(
      data: (data) => DataWidget(data),
      loading: () => LoadingWidget(),
      error: (error, stack) => ErrorWidget(error),
    );
  }
}
```

## 🧪 Testing Strategy

### Unit Tests
- **Service Layer**: Test business logic in isolation
- **Providers**: Test state management logic
- **Models**: Test data validation and serialization

### Widget Tests
- **Components**: Test UI components with mock data
- **Screens**: Test screen composition and navigation

### Integration Tests
- **User Flows**: Test complete user journeys
- **API Integration**: Test service layer with real APIs

## 🚀 Performance Considerations

- **Provider Scope**: Minimal providers to reduce unnecessary rebuilds
- **AsyncValue**: Efficient async state management
- **Component Architecture**: Smaller widgets for better performance
- **Static Services**: No unnecessary object creation

## 🔮 Scalability Considerations

### Future Enhancements
- **Repository Pattern**: For data persistence layer
- **Use Cases**: For complex business operations
- **Dependency Injection**: Framework like GetIt for larger scale
- **Feature Modules**: Modular architecture for team development

### Extension Points
- **New Services**: Add services following existing patterns
- **Additional Providers**: State management for new features
- **Component Library**: Reusable UI component system
- **Plugin Architecture**: For third-party integrations

---

This architecture provides a solid foundation for a maintainable, testable, and scalable Flutter application following industry best practices.