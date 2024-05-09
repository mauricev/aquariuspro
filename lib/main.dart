import 'package:aquariuspro/backend/authenticator.dart';
import 'package:aquariuspro/utility.dart';
import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// 5 of 6 remove for real-world web
import 'package:window_manager/window_manager.dart';

import 'backend/local_storage.dart';
import 'backend/database.dart';
import 'theme.dart';
import 'consts.dart';
import 'package:aquariuspro/views/authenticator_view.dart';
import 'package:aquariuspro/views/home_view.dart';

void main() async {
  final LocalStorage cLocalStorage = LocalStorage();
  final Database cDatabase = Database();

  WidgetsFlutterBinding.ensureInitialized();

  // real-world 5 of 5, comment out for web
  if (defaultTargetPlatform == TargetPlatform.windows ||
      defaultTargetPlatform == TargetPlatform.macOS) {
    await windowManager.ensureInitialized();

    // block below gets disabled for web
    WindowOptions windowOptions = const WindowOptions(
      size: Size(810, 1080), // 10.2 inch iPad portrait size
      minimumSize: Size(810, 1080),
      maximumSize: Size(810, 1080),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle
          .normal, // had been TitleBarStyle.hidden, but this hides the draggable part of the window under Windows
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(AquariusProApp(cLocalStorage: cLocalStorage, cDatabase: cDatabase));
  });
}

class AquariusProApp extends StatelessWidget {
  final LocalStorage cLocalStorage;
  final Database cDatabase;

  const AquariusProApp(
      {super.key, required this.cDatabase, required this.cLocalStorage});

  @override
  Widget build(BuildContext context) {
    myDebugPrint("in AquariusProApp build");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Authenticator>(
            create: (context) => Authenticator(
                cDatabase: cDatabase, cLocalStorage: cLocalStorage)),
      ],
      child: MaterialApp(
        title: kProgramName,
        theme: aquariumManagerTheme,
        home: Consumer<Authenticator>(builder: (context, authenticator, child) {
          myDebugPrint("in consumer");
          if (authenticator.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (authenticator.hasToken) {
            return HomeView(cAuthenticator: authenticator);
          } else {
            return AuthenticatorView(cAuthenticator: authenticator);
          }
        }),
      ),
    );
  }
}
