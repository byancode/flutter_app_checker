# flutter_app_checker

A flutter plugin to check whether an app is installed on a device or not.

# Android

Android needs package name, example:

```
String appName = "com.instagram.android";

bool isInstalled = await FlutterAppChecker.isAppInstalled(appName: appName);

if(isInstalled){
    // app is installed
} else{
    // app is not installed
}

```

# IOS

Apps for iOS 9 and later must have a list of requested URL schemes in the Info.plist before being allowed to use `canOpenURL`.

Add app name to `Info.plist` under `LSApplicationQueriesSchemes` key:

```
<key>LSApplicationQueriesSchemes</key>
<array>
	<string>instagram</string>
</array>
```

then check:

```
String appName = "instagram";

bool isInstalled = await FlutterAppChecker.isAppInstalled(appName: appName);

if(isInstalled){
    // app is installed
} else{
    // app is not installed
}

```
