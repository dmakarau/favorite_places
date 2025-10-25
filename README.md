# My Favorite Places 📍

![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-State%20Management-00D4AA?style=for-the-badge&logo=flutter&logoColor=white)
![Material Design 3](https://img.shields.io/badge/Material%20Design%203-757575?style=for-the-badge&logo=material-design&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-brightgreen?style=for-the-badge)

A Flutter application for managing and organizing your favorite places. Keep track of special locations with titles, images, and location data.

## Features ✨

- ✅ **Add New Places**: Create places with custom titles and photos through a dedicated add screen
- ✅ **Camera Integration**: Take photos directly within the app using device camera
- ✅ **Interactive List Display**: View all added places with photo thumbnails and tap-to-view functionality
- ✅ **Full-Screen Image Viewing**: Dedicated detail screen showing place photos in full-screen
- ✅ **State Management**: Powered by Riverpod for robust state management across the app
- ✅ **Modern UI**: Clean and intuitive Material Design 3 interface
- ✅ **Navigation**: Smooth navigation flow between all screens
- ✅ **Responsive Design**: Beautiful empty state with helpful guidance when no places are added
- ✅ **Cross-Platform Image Support**: Properly configured for iOS, Android, macOS, Web, Windows, and Linux
- ✅ **Immutable State**: Proper state management with immutable updates

## Screenshots 📱

*Coming soon - screenshots will be added as the app develops*

## Getting Started 🚀

### Prerequisites

- Flutter SDK (version 3.9.2 or higher)
- Dart SDK
- An IDE (VS Code, Android Studio, or IntelliJ)
- Android Studio/Xcode for device testing

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

3. **Run the application**
   ```bash
   flutter run
   ```

## Dependencies 📦

This project uses the following key packages:

- `flutter_riverpod: ^2.4.9` - Modern state management solution for Flutter
- `image_picker: ^1.2.0` - Camera and gallery image selection functionality
- `google_fonts: ^6.3.2` - Custom fonts for better typography
- `uuid: ^4.5.1` - Unique identifier generation for places
- `cupertino_icons: ^1.0.8` - iOS-style icons

## Project Structure 📁

```
lib/
├── main.dart                 # App entry point with Riverpod setup
├── model/
│   └── place.dart           # Place data model with image support
├── providers/
│   └── user_places.dart     # Riverpod state management for places
├── screens/
│   ├── add_places.dart      # Add new place screen with camera integration (✅ Implemented)
│   ├── places_details.dart  # Place details with full-screen image view (✅ Implemented)
│   └── places_screen.dart   # Main places list screen (✅ Implemented)
└── widgets/
    ├── image_input.dart     # Camera input widget (✅ Implemented)
    └── place_list_widget.dart # Place list with image thumbnails (✅ Implemented)
```

## Current Implementation Status 🚀

### ✅ **Completed Features**
- **Core App Structure**: Material Design 3 theming with custom color schemes
- **Add Places Screen**: Fully functional form to add new places with titles and camera integration
- **Camera Functionality**: Take photos directly within the app using ImagePicker
- **Image Management**: Complete image flow from capture to storage to display
- **Places List Screen**: Dynamic list display with image thumbnails and tap navigation
- **Place Detail Screen**: Full-screen image viewing with place information
- **Navigation System**: Seamless navigation between list, add, and detail screens
- **State Management**: Complete Riverpod integration with `NotifierProvider`
- **Empty State**: Beautiful empty state with location icon and helpful messaging
- **Cross-Platform Setup**: Proper configuration for iOS, Android, macOS, Web, Windows, and Linux
- **Immutable Updates**: Proper state management with spread operator for list updates

### 🚧 **In Development**
- [ ] GPS location integration and mapping
- [ ] Enhanced place details with location information
- [ ] Local data persistence (SQLite/Hive)
- [ ] Search and filtering functionality
- [ ] Categories and tags for organization
- [ ] Edit and delete place functionality
- [ ] Image gallery with multiple photos per place

## State Management Architecture 🏗️

The app uses **Riverpod** for state management with the following pattern:

```dart
// Provider Definition
final userPlacesProvider = NotifierProvider<UserPlacesNotifier, List<Place>>(
  () => UserPlacesNotifier(),
);

// Usage in Widgets
final places = ref.watch(userPlacesProvider);  // Read state
ref.read(userPlacesProvider.notifier).addPlace(title);  // Update state
```

### Key Benefits:
- **🔄 Reactive UI**: Automatic widget rebuilds when state changes
- **🌍 Global State**: Accessible from any widget in the app
- **🛡️ Type Safety**: Full compile-time type checking
- **🧪 Testability**: Easy to unit test business logic

## Contributing 🤝

This is a learning project, but contributions and suggestions are welcome!

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Development Notes 📝

- **State Management**: Uses modern Riverpod v2.0+ with `Notifier` pattern
- **Architecture**: Clean separation of concerns with providers, models, and UI
- **Material Design 3**: Full compliance with latest design system
- **Immutable State**: All state updates use immutable patterns for predictability
- **Cross-Platform**: Single codebase running on all major platforms
- **Modern Dart**: Leverages latest Dart language features and null safety

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

- Flutter team for the amazing framework
- Material Design team for design guidelines
- The Flutter community for continuous support and resources

---

**Happy coding!** 🎉
