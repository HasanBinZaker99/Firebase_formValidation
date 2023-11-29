import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_app/components_all/my_btn.dart';
import 'package:new_app/components_all/squareTile.dart';
import 'package:new_app/components_all/textfield.dart';

class LogApp extends StatefulWidget {
  LogApp({super.key});

  @override
  State<LogApp> createState() => _LogAppState();
}

class _LogAppState extends State<LogApp> {
  final emailController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  final passwordController = TextEditingController();
  void signUser() async {
    // show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      Navigator.pop(context);
      if (e.message == 'Error') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        print("Wrong password");
        wrongPasswordMessage();
      }
      // Wrong email message popup
    }

    // pop the loading circle
  }

  void wrongEmailMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                "Incorrect Email or Password",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  // Wrong password message popup
  void wrongPasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.deepPurple,
            title: Center(
              child: Text(
                "Incorrect Password",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Icon(
                Icons.lock,
                size: 100,
              ),
              Text(
                "Welcome back to Hasan's World!",
                style: TextStyle(color: Colors.grey[700], fontSize: 17),
              ),
              const SizedBox(
                height: 50,
              ),
              myTextField(
                controller: emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              const SizedBox(
                height: 10,
              ),
              myTextField(
                controller: passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              // sign in button
              const SizedBox(
                height: 50.0,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signUser,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                          child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )),
                    ),
                  )),
              // myBtn(
              //   onTap: signUser,
              // ),

              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: .9,
                      color: Colors.grey[400],
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Or continue with",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: .9,
                      color: Colors.grey[400],
                    )),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  squareTile(imagePath: "lib/images/google.png"),
                  const SizedBox(
                    width: 20.0,
                  ),
                  squareTile(imagePath: "lib/images/apple.png"),
                ],
              ),
              const SizedBox(
                height: 5.0,
              ),
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Register Now",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
