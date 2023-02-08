import UIKit
import Flutter
import GoogleMaps   // * Added this for Google Maps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyB46pq8xazP16JAqyOz1Jn7FebH1SbZ_o8") // * Added the Key Here
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
