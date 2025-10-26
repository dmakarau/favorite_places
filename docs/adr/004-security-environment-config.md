# ADR-004: Security and Environment Configuration

**Date:** 2025-10-26  
**Status:** Accepted  
**Deciders:** Development Team  

## Context

The application was using hardcoded API keys directly in source code, creating:
- Security vulnerabilities
- Version control exposure
- Environment management issues
- Deployment complications

## Decision

We will implement **environment-based configuration** using:

- `flutter_dotenv` package for environment variables
- `.env` file for local development (gitignored)
- Environment-specific configuration
- Secure API key management

## Implementation

```dart
// Configuration class
class ApiKeys {
  static String get googleMapsApiKey {
    final key = dotenv.env['GOOGLE_MAPS_API_KEY'];
    if (key == null || key.isEmpty) {
      throw Exception('Google Maps API key not found in environment variables');
    }
    return key;
  }
}

// Usage in services
class LocationService {
  static String getStaticMapUrl(double lat, double lng) {
    return 'https://maps.googleapis.com/maps/api/staticmap'
           '?center=$lat,$lng&zoom=16&size=600x300'
           '&markers=color:red%7C$lat,$lng'
           '&key=${ApiKeys.googleMapsApiKey}';
  }
}
```

## File Structure

```
.env                 # Local environment (gitignored)
.env.example         # Example template
lib/config/
  └── api_keys.dart  # Configuration access
```

## Environment Setup

```bash
# .env file
GOOGLE_MAPS_API_KEY=your_actual_api_key_here
```

## Consequences

### Positive
- No API keys in source code
- Environment-specific configuration
- Better security practices
- CI/CD friendly
- Team development support

### Negative
- Additional setup complexity
- Environment file management
- Potential configuration errors

## Alternatives Considered

1. **Hardcoded keys**: Security risk
2. **Build-time injection**: Complex setup
3. **Remote configuration**: Overkill for current needs
4. **Platform-specific configs**: Platform lock-in

## Decision Drivers

- Security requirements
- Best practices compliance
- Team development needs
- CI/CD pipeline requirements
- API key rotation support