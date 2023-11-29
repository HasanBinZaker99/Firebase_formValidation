import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: "AIzaSyBoIQhAx0yWyCO64Z7LhUBAkbmMf6VbFaY  ",
    appId: "XXX",
    messagingSenderId: "XXX",
    projectId: "XXX",
  ));
  runApp(AuthApp());
}

class AuthApp extends StatefulWidget {
  const AuthApp({super.key});

  @override
  State<AuthApp> createState() => _AuthAppState();
}

class _AuthAppState extends State<AuthApp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  String errorMessage = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:
              Text('Auth User (Logged ' + (user == null ? 'out' : 'in') + ')'),
        ),
        body: Form(
          key: _key,
          child: Center(
              child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: validateEmail,
              ),
              TextFormField(
                controller: passwordController,
                validator: validatePassword,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text("Sign Up"),
                      onPressed: user != null
                          ? null
                          : () async {
                              setState(() {
                                isLoading = true;
                                errorMessage = '';
                              });
                              if (_key.currentState!.validate()) {
                                try {
                                  await FirebaseAuth.instance
                                      .createUserWithEmailAndPassword(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                                setState(() => isLoading = false);
                              }
                            }),
                  ElevatedButton(
                      onPressed: user != null
                          ? null
                          : () async {
                              setState(() => isLoading = true);
                              if (_key.currentState!.validate()) {
                                try {
                                  await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text);
                                  errorMessage = '';
                                } on FirebaseAuthException catch (error) {
                                  errorMessage = error.message!;
                                }
                                setState(() => isLoading = false);
                              }
                            },
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text("Sign In")),
                  ElevatedButton(
                      onPressed: user == null
                          ? null
                          : () async {
                              setState(() => isLoading = true);
                              try {
                                await FirebaseAuth.instance.signOut();
                                errorMessage = '';
                              } on FirebaseAuthException catch (error) {
                                errorMessage = error.message!;
                              }
                              setState(() => isLoading = false);
                            },
                      child: Text("Log Out")),
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}

String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty)
    return "E-mail address is required";
  String pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';
  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty)
    return 'Password is required';
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';
  return null;
}
