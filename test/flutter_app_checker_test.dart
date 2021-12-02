import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app_checker/flutter_app_checker.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_app_checker');
  const appName = "appName";

  TestWidgetsFlutterBinding.ensureInitialized();

  group("isAppInstalled", () {
    group("when app is installed on device", () {
      setUp(() {
        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          return true;
        });
      });

      tearDown(() {
        channel.setMockMethodCallHandler(null);
      });

      test('then returns true', () async {
        expect(await FlutterAppChecker.isAppInstalled(appName: appName), isTrue);
      });
    });

    group("when app is not installed on device", () {
      setUp(() {
        channel.setMockMethodCallHandler((MethodCall methodCall) async {
          return false;
        });
      });

      tearDown(() {
        channel.setMockMethodCallHandler(null);
      });

      test('then returns false', () async {
        expect(await FlutterAppChecker.isAppInstalled(appName: appName), isFalse);
      });
    });
  });
}
