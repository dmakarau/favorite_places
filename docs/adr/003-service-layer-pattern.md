# ADR-003: Service Layer Pattern

**Date:** 2025-10-26  
**Status:** Accepted  
**Deciders:** Development Team  

## Context

HTTP requests and business logic were scattered throughout UI components, making the code:
- Difficult to test
- Hard to maintain
- Impossible to reuse
- Security-vulnerable (exposed API keys)

## Decision

We will implement a **Service Layer Pattern** with:

- Static service classes for stateless operations
- Centralized API management
- Environment-based configuration
- Clear service responsibilities

## Implementation

```dart
// LocationService for API integration
class LocationService {
  static Future<String> getAddressFromCoordinates(double lat, double lng) async {
    // HTTP API logic
  }
  
  static String getStaticMapUrl(double lat, double lng) {
    // URL generation logic
  }
}

// GpsService for hardware abstraction
class GpsService {
  static Future<PlaceLocation> getCurrentLocation() async {
    // GPS logic with permission handling
  }
}
```

## Service Responsibilities

- **LocationService**: Google Maps API integration
- **GpsService**: Device GPS functionality
- **Future services**: Database, Analytics, etc.

## Consequences

### Positive
- Complete separation of business logic
- Easy unit testing
- Reusable across the application
- Centralized configuration
- Better security

### Negative
- Additional abstraction layer
- More files to manage

## Alternatives Considered

1. **Repository Pattern**: Overkill for current needs
2. **Direct API calls in widgets**: Poor separation
3. **Singleton services**: Memory concerns
4. **Instance-based services**: Unnecessary state

## Decision Drivers

- Testability requirements
- Security best practices
- Code reusability
- Separation of concerns
- Maintenance efficiency