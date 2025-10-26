# My Favorite Places 📍

![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-3.0.3-00D4AA?style=for-the-badge&logo=flutter&logoColor=white)
![Google Maps](https://img.shields.io/badge/Google%20Maps-API-4285F4?style=for-the-badge&logo=google-maps&logoColor=white)
![GPS](https://img.shields.io/badge/GPS-Location%20Services-FF6B6B?style=for-the-badge&logo=google-maps&logoColor=white)
![Camera](https://img.shields.io/badge/Camera-Image%20Capture-4CAF50?style=for-the-badge&logo=camera&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean%20Architecture-SOLID-9C27B0?style=for-the-badge&logo=architecture&logoColor=white)
![Material Design 3](https://img.shields.io/badge/Material%20Design%203-757575?style=for-the-badge&logo=material-design&logoColor=white)
![Security](https://img.shields.io/badge/Security-API%20Keys%20Protected-F44336?style=for-the-badge&logo=security&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-brightgreen?style=for-the-badge)

A production-ready Flutter application implementing **Clean Architecture** for managing and organizing your favorite places with photos and location data. Features enterprise-level architecture, secure API management, camera integration, GPS location services, Google Maps integration, and modern state management with Riverpod.

## Features ✨

### 🏗️ **Architecture & Code Quality**
- ✅ **Clean Architecture**: Separation of concerns with services, providers, and UI components
- ✅ **SOLID Principles**: Single responsibility, dependency injection, and modular design
- ✅ **Service Layer**: Dedicated services for location, GPS, and API management
- ✅ **Component Architecture**: Reusable, focused UI components
- ✅ **Security First**: API keys protected with environment variables
- ✅ **Modern State Management**: Riverpod 3.0+ with AsyncValue patterns

### 📱 **User Features**
- ✅ **Add New Places**: Create places with custom titles, photos, and location data
- ✅ **Camera Integration**: Take photos directly within the app using device camera
- ✅ **GPS Location Services**: Automatically detect current location with permission handling
- ✅ **Address Geocoding**: Convert GPS coordinates to human-readable addresses
- ✅ **Google Maps Integration**: Static map previews showing exact place locations
- ✅ **Interactive List Display**: View all places with photo thumbnails, addresses, and tap navigation
- ✅ **Full-Screen Image Viewing**: Dedicated detail screen showing place photos and location info
- ✅ **Modern UI**: Clean and intuitive Material Design 3 interface
- ✅ **Cross-Platform Location Support**: GPS functionality across iOS, Android, and other platforms
- ✅ **Responsive Design**: Beautiful empty state with helpful guidance when no places are added

### 🔧 **Technical Features**
- ✅ **HTTP Service Layer**: Centralized API management with proper error handling
- ✅ **Async State Management**: Loading states and error handling with AsyncValue
- ✅ **Component Separation**: Form components, location widgets, and action buttons
- ✅ **Type Safety**: Full null safety compliance with proper error handling
- ✅ **Environment Configuration**: Secure API key management
- ✅ **Modern Flutter APIs**: Updated to latest Flutter/Dart patterns

## Screenshots 📱

*Coming soon - screenshots will be added as the app develops*

## Getting Started 🚀

### Prerequisites

- Flutter SDK (version 3.9.2 or higher)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)
- Android Studio/Xcode for device testing
- **Google Maps API Key** (required for location features)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd my_favorite_places
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up API Keys**
   ```bash
   # Copy the example environment file
   cp .env.example .env
   
   # Edit .env and add your Google Maps API key
   # GOOGLE_MAPS_API_KEY=your_actual_api_key_here
   ```

4. **Get Google Maps API Key**
   - Go to [Google Cloud Console](https://console.cloud.google.com/)
   - Create a new project or select existing one
   - Enable Google Maps Static API and Geocoding API
   - Create credentials (API Key)
   - Add the key to your `.env` file

5. **Run the application**
   ```bash
   flutter run
   ```

## Dependencies 📦

This project uses the following key packages:

### **State Management & Architecture**
- `flutter_riverpod: ^3.0.3` - Modern state management solution with AsyncValue patterns
- `flutter_dotenv: ^6.0.0` - Environment variable management for secure API key storage

### **Location & Maps**
- `location: ^8.0.1` - GPS location services and permissions handling
- `http: ^1.5.0` - HTTP client for Google Maps API geocoding requests

### **Media & UI**
- `image_picker: ^1.2.0` - Camera and gallery image selection functionality
- `google_fonts: ^6.3.2` - Custom fonts for better typography
- `cupertino_icons: ^1.0.8` - iOS-style icons

### **Utilities**
- `uuid: ^4.5.1` - Unique identifier generation for places

## Project Structure 📁

The project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── main.dart                    # App entry point with ProviderScope and environment setup
├── config/
│   └── api_keys.dart           # API key configuration (secure environment access)
├── model/
│   └── place.dart              # Place and PlaceLocation data models with immutable structure
├── providers/
│   ├── user_places.dart        # Riverpod state management for places with location
│   └── location_provider.dart  # Location state management with AsyncValue patterns
├── services/                   # 🏗️ Service layer for business logic
│   ├── location_service.dart   # HTTP API service for geocoding and static maps
│   └── gps_service.dart        # GPS location detection and permission handling
├── screens/                    # UI screens with minimal business logic
│   ├── add_places.dart         # Simplified add place screen using form component
│   ├── places_details.dart     # Place details using LocationService
│   └── places_screen.dart      # Main places list screen
└── widgets/                    # Reusable UI components
    ├── image_input.dart        # Camera input widget
    ├── location_input.dart     # Refactored location widget using providers
    ├── place_list_widget.dart  # Place list with image thumbnails and addresses
    ├── add_place_form.dart     # 🆕 Extracted form component with validation
    ├── location_preview.dart   # 🆕 Map preview component with loading states
    └── location_action_buttons.dart # 🆕 GPS and map action buttons component
```

### **🏗️ Architecture Highlights:**
- **Services Layer**: Business logic separated from UI components
- **Component Separation**: Large screens broken into focused, reusable widgets
- **Provider Pattern**: Clean state management with Riverpod 3.0+ patterns
- **Dependency Injection**: Services injected through providers
- **Single Responsibility**: Each file has a clear, focused purpose

## Implementation Status 🚀

### ✅ **Production-Ready Features**
- **🏗️ Clean Architecture**: Complete service layer implementation with separation of concerns
- **🔐 Security**: API keys secured with environment variables and proper configuration
- **📱 Core App Structure**: Material Design 3 theming with modern Flutter patterns
- **📸 Camera Integration**: Full image capture, validation, and storage workflow
- **🌍 Location Services**: Comprehensive GPS detection with permission handling and error states
- **🗺️ Google Maps Integration**: Static maps, geocoding, and address resolution via service layer
- **🎯 State Management**: Complete Riverpod 3.0+ implementation with AsyncValue patterns
- **🧩 Component Architecture**: Modular UI components with single responsibility
- **📋 Form Management**: Extracted form component with proper validation and state handling
- **🔄 Navigation System**: Seamless navigation with proper state preservation
- **⚡ Performance**: Optimized with proper loading states and error handling
- **📊 Empty States**: Beautiful UI for when no data is available
- **✅ Type Safety**: Full null safety compliance with proper error boundaries

### 🏗️ **Architecture Achievements**
- **Service Layer**: HTTP logic completely separated from UI components
- **Provider Pattern**: Clean state management with dependency injection
- **Component Separation**: Large widgets broken into focused, reusable components
- **Error Handling**: Comprehensive error states with user-friendly messages
- **Loading States**: Proper async handling with loading indicators
- **Security**: No hardcoded API keys, all secrets properly managed

### ✅ **Quality Assurance**
- **Zero Compilation Errors**: All deprecated APIs updated to modern patterns
- **SOLID Principles**: Single responsibility, dependency injection, modular design
- **Modern Flutter**: Latest API patterns and null safety compliance
- **Performance Optimized**: Efficient state updates and component rendering

### 🚧 **Future Enhancements**
- [ ] **Data Persistence**: SQLite/Hive integration for offline storage
- [ ] **Interactive Maps**: Full map integration for place selection and viewing
- [ ] **Search & Filter**: Advanced search functionality with category filtering
- [ ] **Place Management**: Edit and delete place functionality
- [ ] **Enhanced Details**: Weather information and additional place metadata
- [ ] **Multi-Photo Support**: Gallery with multiple photos per place
- [ ] **Offline Support**: Offline map caching and sync capabilities
- [ ] **Categories & Tags**: Organization system for places
- [ ] **Export/Import**: Backup and restore functionality
- [ ] **Social Features**: Share places with other users

## Clean Architecture Benefits 🏗️

This app demonstrates enterprise-level architecture patterns:

### **Separation of Concerns**
```dart
// Services handle business logic
class LocationService {
  static Future<String> getAddressFromCoordinates(double lat, double lng) async {
    // HTTP API logic isolated from UI
  }
}

// Providers manage state
class CurrentLocationNotifier extends AsyncNotifier<PlaceLocation?> {
  // State management with proper error handling
}

// Components focus on UI
class LocationPreview extends ConsumerWidget {
  // Pure UI component using providers
}
```

### **Key Architectural Patterns**
- **🎯 Single Responsibility**: Each class has one clear purpose
- **🔌 Dependency Injection**: Services injected through providers
- **🏛️ Layer Separation**: UI → Providers → Services → APIs
- **⚡ Async Patterns**: Proper AsyncValue handling with loading/error states
- **🛡️ Error Boundaries**: Comprehensive error handling at each layer
- **🔒 Security**: Environment-based configuration management

## Location Services & Maps Integration �

The app uses comprehensive location services:

### **GPS Location Detection:**
```dart
// Automatic location detection with permissions
final location = Location();
final locationData = await location.getLocation();
```

### **Address Geocoding:**
```dart
// Convert coordinates to readable addresses using Google Maps API
final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=API_KEY';
final address = responseData['results'][0]['formatted_address'];
```

### **Static Map Previews:**
```dart
// Display location preview using Google Static Maps API
final mapUrl = 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&markers=color:red%7C$lat,$lng&key=API_KEY';
```

### **Key Location Features:**
- **🎯 GPS Permission Handling**: Proper request flow for location services
- **📍 Current Location**: Get user's current GPS coordinates
- **🗺️ Map Previews**: Static map images showing exact location
- **🏠 Address Resolution**: Human-readable addresses from coordinates
- **📱 Cross-Platform**: Works on iOS, Android, and other platforms

## Contributing 🤝

This is a learning project, but contributions and suggestions are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Documentation 📚

Comprehensive technical documentation is available in the [`docs/`](docs/) directory:

- **[Architecture Overview](docs/architecture.md)** - Current system architecture and patterns
- **[Refactoring Summary](docs/refactoring-summary.md)** - Detailed refactoring journey documentation
- **[Architecture Decision Records](docs/adr/)** - Key architectural decisions and rationale

### Architecture Decision Records (ADRs)
- [ADR-001: Clean Architecture Implementation](docs/adr/001-clean-architecture.md)
- [ADR-002: State Management with Riverpod](docs/adr/002-riverpod-state-management.md)
- [ADR-003: Service Layer Pattern](docs/adr/003-service-layer-pattern.md)
- [ADR-004: Security and Environment Configuration](docs/adr/004-security-environment-config.md)

## Development Notes 📝

### **🏗️ Architecture & Patterns**
- **Clean Architecture**: Complete separation of concerns with service, provider, and UI layers
- **State Management**: Modern Riverpod 3.0+ with `AsyncNotifier` and `AsyncValue` patterns
- **Component Architecture**: Reusable UI components with single responsibility
- **Dependency Injection**: Services accessed through providers, not direct instantiation

### **🔒 Security & Configuration**
- **Environment Variables**: API keys secured with flutter_dotenv
- **Type Safety**: Full null safety compliance with comprehensive error handling
- **Permission Management**: Proper GPS and camera permission flows

### **⚡ Performance & Quality**
- **Modern Flutter**: Latest API patterns, no deprecated methods
- **Async Patterns**: Proper loading states and error boundaries
- **Immutable State**: All state updates follow immutable patterns
- **Cross-Platform**: Single codebase supporting all major platforms

### **🎯 SOLID Principles Implementation**
- **Single Responsibility**: Each class/component has one clear purpose
- **Open/Closed**: Services can be extended without modification
- **Liskov Substitution**: Proper abstraction layers
- **Interface Segregation**: Focused interfaces for different concerns
- **Dependency Inversion**: UI depends on abstractions, not implementations

## Platform Support 🎯

- ✅ Android
- ✅ iOS
- ✅ Web
- ✅ macOS
- ✅ Linux
- ✅ Windows

## License 📄

This project is for educational purposes. Feel free to use and modify as needed.

## Acknowledgments 🙏

- Flutter team for the amazing framework and continuous improvements
- Material Design team for comprehensive design guidelines
- The Flutter community for excellent packages and support
- Riverpod team for the powerful state management solution
- Google Maps team for robust location and mapping services

---

**Happy coding!** 🎉
