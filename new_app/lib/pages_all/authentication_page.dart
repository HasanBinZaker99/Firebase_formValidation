import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app/pages_all/home_page.dart';
import 'package:new_app/pages_all/log_app.dart';

class authenticationPage extends StatefulWidget {
  const authenticationPage({super.key});

  @override
  State<authenticationPage> createState() => _authenticationPageState();
}

class _authenticationPageState extends State<authenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return LogApp();
          }
        },
      ),
    );
  }
}
