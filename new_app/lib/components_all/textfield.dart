import 'package:flutter/material.dart';

class myTextField extends StatefulWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  const myTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  State<myTextField> createState() => _myTextFieldState();
}

class _myTextFieldState extends State<myTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepPurpleAccent)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400)),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
