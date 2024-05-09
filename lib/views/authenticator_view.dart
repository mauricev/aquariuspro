import 'package:aquariuspro/consts.dart';
import 'package:aquariuspro/utility.dart';
import 'package:flutter/material.dart';
import 'package:aquariuspro/views/home_view.dart';
import 'package:aquariuspro/backend/authenticator.dart';

class AuthenticatorView extends StatefulWidget {
  final Authenticator cAuthenticator;

  const AuthenticatorView({super.key, required this.cAuthenticator});

  @override
  State<AuthenticatorView> createState() => _AuthenticatorViewState();
}

class _AuthenticatorViewState extends State<AuthenticatorView> {
  final TextEditingController controllerForLoginUserName = TextEditingController();
  final TextEditingController controllerForPassword = TextEditingController();

  void _updateLoginButtonState() {
    setState(() {});
  }

  @override
  void initState() {
    controllerForLoginUserName.addListener(_updateLoginButtonState);
    controllerForPassword.addListener(_updateLoginButtonState);
    super.initState();
  }

  @override
  void dispose() {
    controllerForLoginUserName.removeListener(_updateLoginButtonState);
    controllerForPassword.removeListener(_updateLoginButtonState);
    controllerForLoginUserName.dispose();
    controllerForPassword.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
              'This is the authenticator page:',
            ),
            TextField(
              decoration:  const InputDecoration(
                hintText: kUserName,
              ),
              controller: controllerForLoginUserName,
            ),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(
                hintText: kPassword,
              ),
              controller: controllerForPassword,
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: (controllerForLoginUserName.text.isEmpty || controllerForPassword.text.isEmpty) ? null : () {
                widget.cAuthenticator
                    .loginWithUserName(controllerForLoginUserName.text,
                    controllerForPassword.text)
                    .then((_) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeView(cAuthenticator: widget.cAuthenticator), // homeview will have a logout button, so it will need the authenticator
                    ),
                  );
                }).catchError((error) {
                  myDebugPrint(kBadLogin); // should we alter the user to see what happens?
                });
              },
              child: const Text(kLoginBtn),
            ),
            widget.cAuthenticator.isPassWordBad
                ? const Text(kBadLogin)
                : Container(),
          ],
        ),
      ),
    );
  }
}