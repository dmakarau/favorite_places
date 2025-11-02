import UIKit
import Flutter
import GoogleMaps

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // Load Google Maps API key from Keys.plist
    if let path = Bundle.main.path(forResource: "Keys", ofType: "plist"),
       let keys = NSDictionary(contentsOfFile: path),
       let apiKey = keys["GOOGLE_MAPS_API_KEY"] as? String {
        print("✅ Google Maps API key loaded successfully from Keys.plist")
        print("🔑 API Key: \(String(apiKey.prefix(10)))...")
        GMSServices.provideAPIKey(apiKey)
    } else {
        print("⚠️ Warning: Could not load Google Maps API key from Keys.plist")
        // Fallback to environment variable or default
        GMSServices.provideAPIKey("YOUR_API_KEY_HERE")
    }
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}