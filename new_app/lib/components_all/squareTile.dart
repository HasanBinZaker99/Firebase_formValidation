import 'package:flutter/material.dart';

class squareTile extends StatefulWidget {
  final String imagePath;
  const squareTile({super.key, required this.imagePath});

  @override
  State<squareTile> createState() => _squareTileState();
}

class _squareTileState extends State<squareTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200]),
      child: Image.asset(
        widget.imagePath,
        height: 40,
      ),
    );
  }
}
