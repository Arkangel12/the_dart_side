import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_dart_side/src/firestore/authentication/auth_service.dart';
import 'package:the_dart_side/src/firestore/authentication/login_screen.dart';
import 'package:the_dart_side/src/firestore/authentication/register_screen.dart';
import 'package:the_dart_side/src/firestore/authentication/welcome_screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: _authService.user,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Firebase Auth'),
              actions: <Widget>[
                if (snapshot.data != null)
                  IconButton(
                    icon: Icon(Icons.exit_to_app),
                    onPressed: () => _authService.signOut(), //TODO add logout function
                  )
              ],
            ),
            body: snapshot.data != null
                ? WelcomeScreen()
                : PageView(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: RaisedButton(
                          color: Colors.red[400],
                          onPressed: () async {
                            await _authService.signInAnon();
                          },
                          child: Text('Anonymous'),
                        ),
                      ),
                      RegisterScreen(),
                      LoginScreen(),
                    ],
                  ),
          );
        });
  }
}
