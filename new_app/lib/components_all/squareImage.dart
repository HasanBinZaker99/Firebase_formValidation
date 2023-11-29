import 'package:flutter/material.dart';

class squareImage extends StatelessWidget {
  const squareImage({super.key, required this.imagePath});
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200]),
      child: Image.asset(
        imagePath,
        height: 400,
        width: 390,
      ),
    );
  }
}
