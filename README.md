# My Favorite Places

![Flutter](https://img.shields.io/badge/Flutter-3.9.2+-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.9.2+-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-3.0.3-00D4AA?style=for-the-badge&logo=flutter&logoColor=white)
![Google Maps](https://img.shields.io/badge/Google%20Maps-API-4285F4?style=for-the-badge&logo=google-maps&logoColor=white)
![License](https://img.shields.io/badge/License-Educational-brightgreen?style=for-the-badge)

A Flutter app for saving your favorite places with photos and locations. Take pictures, get GPS coordinates, view on Google Maps, and organize your memories with a clean, modern interface.

## 📱 Features

### Core Functionality
- **Add Places**: Create entries with custom titles and photos
- **Camera Integration**: Take photos directly in the app
- **Location Services**: Automatic GPS detection with permission handling
- **Interactive Maps**: Select locations by tapping on Google Maps
- **Address Resolution**: Converts GPS coordinates to readable addresses  
- **Map Previews**: Static map thumbnails for each place
- **Detail Views**: Full-screen place information with expandable maps
- **Modern UI**: Material Design 3 with professional color scheme

### Technical Highlights  
- **Clean Architecture**: Proper separation of concerns
- **Riverpod State Management**: Modern reactive state handling
- **Secure API Management**: Environment-based configuration
- **Cross-Platform**: Android, iOS, and more
- **Null Safety**: Full Dart null safety compliance

## 🚀 Quick Start

### What You'll Need
- Flutter SDK (3.9.2+)
- A Google Maps API key (free to get!)
- Android Studio or VS Code
- About 10 minutes to set up

### Setup Steps

1. **Get the code**
   ```bash
   git clone <your-repo-url>
   cd my_favorite_places
   flutter pub get
   ```

2. **Set up Google Maps** (Required for location features)
   ```bash
   # Copy the template
   cp .env.template .env
   ```
   
   Then get your API key:
   - Go to [Google Cloud Console](https://console.cloud.google.com/)
   - Create a project (or use existing)
   - Enable these APIs:
     - Maps SDK for Android
     - Maps SDK for iOS  
     - Maps JavaScript API
     - Geocoding API
   - Create an API Key
   - Add it to your `.env` file:
     ```
     GOOGLE_MAPS_API_KEY=your_actual_key_here
     ```

3. **Run the app**
   ```bash
   flutter run
   ```

That's it! The app will automatically configure API keys for both Android and iOS.

## 🛠️ Technical Stack

### Dependencies
```yaml
# State Management & Architecture
flutter_riverpod: ^3.0.3        # Modern state management
flutter_dotenv: ^6.0.0          # Secure environment config

# Maps & Location  
google_maps_flutter: ^2.13.1    # Interactive Google Maps
location: ^8.0.1                 # GPS and permissions
http: ^1.5.0                     # API calls for geocoding

# UI & Media
image_picker: ^1.2.0             # Camera integration
google_fonts: ^6.3.2            # Professional typography
uuid: ^4.5.1                     # Unique IDs
```

### Architecture Overview
```
📁 lib/
├── 🎯 main.dart                 # App entry with themes
├── 📊 model/
│   └── place.dart              # Data models
├── 🖥️ screens/
│   ├── places_screen.dart      # Main list view
│   ├── add_places.dart         # Add new place
│   ├── places_details.dart     # Place details with maps
│   └── map_screen.dart         # Interactive map picker
├── 🧩 widgets/
│   ├── location_input.dart     # Location picker component
│   ├── image_input.dart        # Camera component
│   └── place_list_widget.dart  # List display
└── 🔧 services/
    └── location_service.dart   # Google Maps API integration
```

## 🤝 Contributing

Contributions are welcome! If you'd like to contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Test thoroughly (especially the map integration!)
5. Submit a pull request

## 📚 Documentation

Check out the [`docs/`](docs/) folder for detailed setup guides:

- **[API Key Setup Guide](docs/API_KEY_SETUP.md)** - Step-by-step Google Maps configuration
- **[Architecture Overview](docs/architecture.md)** - How the app is structured
- **[Troubleshooting](docs/troubleshooting.md)** - Common issues and solutions

## 🐛 Known Issues

- Map previews may take a moment to load on first app start
- Location permissions need to be granted for GPS features
- Static maps require internet connection (no offline caching yet)

## 📱 Platform Support

- ✅ Android (API 21+)
- ✅ iOS (iOS 11+) 
- 🔄 Web (maps work, camera needs testing)
- 🔄 Desktop (basic functionality)

## 🙏 Thanks To

- Flutter team for the amazing framework
- Google Maps team for the location APIs
- Riverpod team for excellent state management
- The Flutter community for helpful packages and advice

## 📄 License

Educational use - feel free to learn from, modify, and build upon this code!

---

*Built with ❤️ using Flutter*
