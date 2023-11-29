import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_app/components_all/squareImage.dart';
import 'package:new_app/components_all/squareTile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
      body: Center(
        child: Text("Logged In As: " + user.email!,
            style: TextStyle(fontSize: 20)),
        // child: SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       // Padding(padding: EdgeInsets.all(5)),
        //       squareImage(imagePath: "lib/images/mine.png"),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
