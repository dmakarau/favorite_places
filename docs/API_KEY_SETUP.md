# Google Maps API Key Configuration

This document explains how to configure Google Maps API keys for the Flutter Favorite Places application across Android, iOS, and Flutter platforms.

## Prerequisites

You'll need a valid Google Maps API key with the following APIs enabled:
- Maps Static API (for location previews)
- Geocoding API (for address lookup)

## Initial Setup

1. Copy the example environment file:
   ```bash
   cp .env.example .env
   ```

2. Edit the `.env` file and add your Google Maps API key:
   ```
   GOOGLE_MAPS_API_KEY=your_actual_google_maps_api_key_here
   ```

## Platform Configuration

### Android Configuration

The Android build system automatically handles API key injection:

- The `android/app/build.gradle.kts` file contains a function that reads the API key from the `.env` file
- During build time, the key is injected into the Android manifest using `manifestPlaceholders`
- The `AndroidManifest.xml` references the key using the `${googleMapsApiKey}` placeholder

No additional steps are required for Android builds.

### iOS Configuration

iOS requires generating a configuration file before building:

1. Navigate to the scripts directory and run the key generation script:
   ```bash
   cd ios/scripts && ./generate_keys.sh
   ```

2. This script will:
   - Read your API key from the `.env` file
   - Generate a `Keys.plist` file in the `ios/Runner` directory
   - Handle fallbacks if the environment file is missing

The `AppDelegate.swift` file loads the API key from this generated plist file at application startup.

### Flutter/Dart Configuration

The Flutter application uses the `flutter_dotenv` package to access environment variables:

- API keys are loaded from the `.env` file using `dotenv.env['GOOGLE_MAPS_API_KEY']`
- The main application initializes dotenv during startup
- Location services and map components access the key through the dotenv interface

## Build Process

### Building for Android
```bash
flutter build apk
# or
flutter build appbundle
```
The API key is automatically injected during the build process.

### Building for iOS
```bash
# First, generate the keys file
cd ios/scripts && ./generate_keys.sh

# Then build normally
flutter build ios
```

## Security Considerations

- The `.env` file containing your actual API key is excluded from version control via `.gitignore`
- The generated `ios/Runner/Keys.plist` file is also gitignored
- Only the `.env.example` file (without real keys) is tracked in version control
- API keys are never hardcoded in source files

## Troubleshooting

**Problem**: Location services show "Could not fetch location" error
**Solution**: Verify your API key has the Geocoding API enabled and check your usage quotas

**Problem**: iOS build fails to load API key
**Solution**: Ensure you've run the `generate_keys.sh` script before building

**Problem**: Static map images don't load
**Solution**: Verify your API key has the Maps Static API enabled

## Development vs Production

For development, you can use a single API key with appropriate restrictions. For production deployments, consider:

- Using separate API keys for different environments
- Implementing proper key rotation procedures
- Setting up usage monitoring and alerts
- Applying appropriate API restrictions based on your app's bundle ID or package name