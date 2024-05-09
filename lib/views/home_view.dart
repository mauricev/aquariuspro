import 'package:aquariuspro/consts.dart';
import 'package:aquariuspro/utility.dart';
import 'package:flutter/material.dart';
import 'package:aquariuspro/backend/authenticator.dart';

class HomeView extends StatelessWidget {
final Authenticator cAuthenticator;
  const HomeView({super.key, required this.cAuthenticator});

  @override
  Widget build(BuildContext context) {
    myDebugPrint("HomeView build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(kProgramName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'This is the home page:',
            ),
            ElevatedButton(
              onPressed: () {
                cAuthenticator.resetAuthentication();
              },
              child: const Text(kLogoutBtn),
            ),
          ],
        ),
      ),
    );
  }
}