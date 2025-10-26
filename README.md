# My Favorite Places 📍

![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-State%20Management-00D4AA?style=for-the-badge&logo=flutter&logoColor=white)
![Google Maps](https://img.shields.io/badge/Google%20Maps-API-4285F4?style=for-the-badge&logo=google-maps&logoColor=white)
![GPS](https://img.shields.io/badge/GPS-Location%20Services-FF6B6B?style=for-the-badge&logo=google-maps&logoColor=white)
![Camera](https://img.shields.io/badge/Camera-Image%20Capture-4CAF50?style=for-the-badge&logo=camera&logoColor=white)
![HTTP](https://img.shields.io/badge/HTTP-API%20Requests-FF9800?style=for-the-badge&logo=http&logoColor=white)
![Material Design 3](https://img.shields.io/badge/Material%20Design%203-757575?style=for-the-badge&logo=material-design&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-brightgreen?style=for-the-badge)

A Flutter application for managing and organizing your favorite places with photos and location data. Features camera integration, GPS location services, Google Maps integration, and modern state management with Riverpod.

## Features ✨

- ✅ **Add New Places**: Create places with custom titles, photos, and location data
- ✅ **Camera Integration**: Take photos directly within the app using device camera
- ✅ **GPS Location Services**: Automatically detect current location with permission handling
- ✅ **Address Geocoding**: Convert GPS coordinates to human-readable addresses
- ✅ **Google Maps Integration**: Static map previews showing exact place locations
- ✅ **Interactive List Display**: View all places with photo thumbnails, addresses, and tap navigation
- ✅ **Full-Screen Image Viewing**: Dedicated detail screen showing place photos and location info
- ✅ **State Management**: Powered by Riverpod for robust state management across the app
- ✅ **Modern UI**: Clean and intuitive Material Design 3 interface
- ✅ **Cross-Platform Location Support**: GPS functionality across iOS, Android, and other platforms
- ✅ **Responsive Design**: Beautiful empty state with helpful guidance when no places are added
- ✅ **Immutable State**: Proper state management with immutable updates

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

- `flutter_riverpod: ^3.0.3` - Modern state management solution for Flutter
- `image_picker: ^1.2.0` - Camera and gallery image selection functionality
- `location: ^8.0.1` - GPS location services and permissions handling
- `http: ^1.5.0` - HTTP client for Google Maps API geocoding requests
- `flutter_dotenv: ^6.0.0` - Environment variable management for secure API key storage
- `google_fonts: ^6.3.2` - Custom fonts for better typography
- `uuid: ^4.5.1` - Unique identifier generation for places
- `cupertino_icons: ^1.0.8` - iOS-style icons

## Project Structure 📁

```
lib/
├── main.dart                 # App entry point with Riverpod setup
├── model/
│   └── place.dart           # Place and PlaceLocation data models
├── providers/
│   └── user_places.dart     # Riverpod state management for places with location
├── screens/
│   ├── add_places.dart      # Add new place screen with camera and location (✅ Implemented)
│   ├── places_details.dart  # Place details with full-screen image and location (✅ Implemented)
│   └── places_screen.dart   # Main places list screen (✅ Implemented)
└── widgets/
    ├── image_input.dart     # Camera input widget (✅ Implemented)
    ├── location_input.dart  # GPS location and map input widget (✅ Implemented)
    └── place_list_widget.dart # Place list with image thumbnails and addresses (✅ Implemented)
```

## Current Implementation Status 🚀

### ✅ **Completed Features**
- **Core App Structure**: Material Design 3 theming with custom color schemes
- **Add Places Screen**: Fully functional form to add places with titles, camera, and location
- **Camera Functionality**: Take photos directly within the app using ImagePicker
- **GPS Location Services**: Real-time location detection with proper permission handling
- **Google Maps Integration**: Static map previews and geocoding for address resolution
- **Location Input Widget**: Comprehensive location capture with current GPS and map selection
- **Image Management**: Complete image flow from capture to storage to display
- **Places List Screen**: Dynamic list with image thumbnails, addresses, and tap navigation
- **Place Detail Screen**: Full-screen image viewing with place and location information
- **Address Display**: Human-readable addresses shown in list and detail views
- **Navigation System**: Seamless navigation between list, add, and detail screens
- **State Management**: Complete Riverpod integration with location and image data
- **Empty State**: Beautiful empty state with location icon and helpful messaging
- **Cross-Platform Setup**: Proper configuration for iOS, Android, macOS, Web, Windows, and Linux
- **Permission Handling**: Proper GPS and camera permission flows
- **Immutable Updates**: Proper state management with spread operator for list updates

### 🚧 **In Development**
- [ ] Interactive map view for place selection
- [ ] Enhanced place details with weather information
- [ ] Local data persistence (SQLite/Hive)
- [ ] Search and filtering functionality
- [ ] Categories and tags for organization
- [ ] Edit and delete place functionality
- [ ] Image gallery with multiple photos per place
- [ ] Offline map support

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
