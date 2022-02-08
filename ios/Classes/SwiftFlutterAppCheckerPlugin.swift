import Flutter
import UIKit

public class SwiftFlutterAppCheckerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_app_checker", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterAppCheckerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "isAppInstalled":
                let arguments = call.arguments as? [String: String]
                let appName = arguments?["appName"]
                let isInstalled = isAppInstalled(appName: appName)
                result(isInstalled)
            default:
                result(FlutterMethodNotImplemented)
        }
  }

  private func isAppInstalled(appName: String?) -> Bool{
    let appScheme = "\(appName ?? "")://"
    let appUrl = URL(string: appScheme)

    if UIApplication.shared.canOpenURL(appUrl! as URL) {
        return true
    } else {
        return false
    }
  }
}
