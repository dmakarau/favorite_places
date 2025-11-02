# My Favorite Places

![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-3.0.3-00D4AA?style=for-the-badge&logo=flutter&logoColor=white)
![Google Maps](https://img.shields.io/badge/Google%20Maps-API-4285F4?style=for-the-badge&logo=google-maps&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-Database-003B57?style=for-the-badge&logo=sqlite&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-brightgreen?style=for-the-badge)

A Flutter app where you can save your favorite places with photos and locations. Built with Material Design 3, it lets you capture moments with the camera, grab GPS coordinates, and explore everything on interactive Google Maps. All your data persists locally using SQLite, and you can easily manage your places with swipe-to-delete functionality.

## Features

The app combines camera functionality with location services and mapping. You can take photos directly in the app or select from your gallery, automatically detect your current location via GPS, or manually pick spots by tapping on Google Maps. Each place gets stored with its photo, coordinates, and a human-readable address that we resolve using Google's geocoding API.

The UI follows Material Design 3 principles with a professional indigo and teal color scheme. I've implemented proper state management using Riverpod and structured everything with clean architecture patterns. All your places are saved to a local SQLite database with robust error handling and automatic cleanup of corrupted data.

**Key functionality:**
- Camera integration with image_picker
- GPS location detection with proper permission handling  
- Interactive Google Maps for location selection
- Automatic address resolution from coordinates
- Static map previews for each saved place
- Full-screen detail views with expandable maps
- Swipe-to-delete functionality with confirmation dialogs
- Persistent local storage with SQLite and data validation
- Automatic cleanup of missing or corrupted image files
- Cross-platform support with iOS 14.0+ and Android API 21+
- Modern Material Design 3 interface with error handling

## Getting Started

You'll need Flutter 3.9.2+ and a Google Maps API key to get everything working. The setup is pretty straightforward, but make sure you meet the platform requirements: iOS 14.0+ or Android API 21+.

1. **Clone and install dependencies**
   ```bash
   git clone <your-repo-url>
   cd my_favorite_places
   flutter pub get
   ```

2. **Set up Google Maps API**
   
   Copy the environment template:
   ```bash
   cp .env.template .env
   ```
   
   Then grab an API key from [Google Cloud Console](https://console.cloud.google.com/). You'll need to enable these APIs:
   - Maps SDK for Android
   - Maps SDK for iOS  
   - Maps JavaScript API
   - Geocoding API
   
   Add your key to the `.env` file:
   ```
   GOOGLE_MAPS_API_KEY=your_actual_key_here
   ```

3. **Run it**
   ```bash
   flutter run
   ```

The app handles API key injection for both Android and iOS automatically, so once you've got the key set up, everything should just work.

## Tech Stack

I built this with Flutter and Riverpod for state management. The database layer uses SQLite for local persistence, and Google Maps handles all the location stuff. Here's what's under the hood:

```yaml
# Core dependencies
flutter_riverpod: ^3.0.3        # State management
sqflite: ^2.4.2                 # Local database
google_maps_flutter: ^2.13.1    # Interactive maps
location: ^8.0.1                 # GPS access
image_picker: ^1.2.0             # Camera integration
google_fonts: ^6.3.2            # Typography
flutter_dotenv: ^6.0.0          # Environment config
```

## Architecture

The app follows a clean architecture pattern with clear separation between UI, business logic, and data layers:

```
lib/
├── main.dart                    # App entry point with Material 3 theming
├── model/
│   └── place.dart              # Place and PlaceLocation data models
├── providers/
│   └── user_places.dart        # Riverpod notifier with SQLite operations
├── screens/
│   ├── places_screen.dart      # Main list (ConsumerStatefulWidget)
│   ├── add_places.dart         # Add new place form
│   ├── places_details.dart     # Place details with map
│   └── map_screen.dart         # Interactive location picker
└── widgets/
    ├── location_input.dart     # GPS + map selection widget
    ├── image_input.dart        # Camera widget
    └── place_list_widget.dart  # Places list display
```

**Database schema:**
```sql
CREATE TABLE user_places(
  id TEXT PRIMARY KEY,      -- UUID v4
  title TEXT,              -- User-defined place name
  image TEXT,              -- File path to stored image
  lat REAL,                -- Latitude coordinate
  lng REAL,                -- Longitude coordinate  
  address TEXT             -- Resolved address from geocoding
);
```

The `UserPlacesNotifier` handles all database operations and exposes a reactive state that the UI can watch. Images get stored in the app's documents directory with timestamp-based naming to avoid conflicts. The app includes comprehensive error handling for missing or corrupted files, and automatically validates data integrity when loading places.

**Key features implemented:**
- Swipe-to-delete with confirmation dialogs for safe place removal
- Automatic cleanup of orphaned image files and database entries
- Image error handling with fallback UI for missing files
- Cross-platform compatibility with proper iOS deployment targets

## Contributing

Feel free to fork this and make it better! The codebase is pretty clean and well-documented. If you want to contribute:

1. Fork the repo
2. Create a feature branch (`git checkout -b feature/cool-new-thing`)
3. Make your changes (test the map integration especially - it's the trickiest part)
4. Submit a pull request

## Known Issues

The app handles most common issues automatically, but there are a few things to be aware of:

- Map previews can be slow to load on first launch (Google Maps SDK initialization)
- You need to grant location permissions for GPS features to work
- Static maps need internet connection - no offline caching yet
- iOS requires deployment target 14.0+ (automatically configured in the project)

**Recent fixes:**

*Image persistence* - Images are now stored in the documents directory and persist between app restarts. The app automatically cleans up any orphaned cache files from previous versions.

*Data integrity* - Database validation ensures only valid places with existing images are loaded. Corrupted entries are automatically removed.

*iOS compatibility* - Updated deployment target to iOS 14.0+ to support Google Maps plugin requirements.

**Common troubleshooting:**

*Maps not loading?* - Check your API key in `.env` and make sure the required Google APIs are enabled.

*Database issues?* - Run `flutter clean && flutter pub get` and try again.

*iOS build errors?* - Make sure you're targeting iOS 14.0+. The project is already configured for this.

## Platform Support

- Android (API 21+) - tested and working
- iOS (iOS 14.0+) - tested and working  
- Web - maps work, camera needs testing
- Desktop - basic functionality works

Built with Flutter 3.9.2+ and proper error handling throughout.

## Documentation

Check the `docs/` folder for more detailed setup guides:
- [API Key Setup](docs/API_KEY_SETUP.md) - Detailed Google Maps configuration
- Additional troubleshooting guides as needed
