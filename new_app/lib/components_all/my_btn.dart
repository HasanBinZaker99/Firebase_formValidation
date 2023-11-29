import 'package:flutter/material.dart';

class myBtn extends StatefulWidget {
  final Function()? onTap;
  myBtn({super.key, required this.onTap});

  @override
  State<myBtn> createState() => _myBtnState();
}

class _myBtnState extends State<myBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(25),
        margin: EdgeInsets.symmetric(horizontal: 25.0),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
            child: Text(
          "Sign In",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )),
      ),
    );
  }
}
