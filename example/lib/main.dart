import 'package:flutter/material.dart';
import 'dart:async';

import 'package:persian_push/persian_push.dart';


void main() {
  runApp(MyApp());
  setup();
}

void setup() async {
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.init(
      "YOUR_ONESIGNAL_APP_ID",
      iOSSettings: {
        OSiOSSettings.autoPrompt: false,
        OSiOSSettings.inAppLaunchUrl: false
      }
  );
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);

// The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  await OneSignal.shared.promptUserForPushNotificationPermission(fallbackToSettings: true);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }
}
