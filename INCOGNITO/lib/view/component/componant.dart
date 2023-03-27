import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ElevatedButtonStyled extends StatelessWidget {
  final Function() onPressed;
  final String text;
  double? width;
  double? height;

  ElevatedButtonStyled(
      {super.key,
      required this.onPressed,
      required this.text,
      this.width,
      this.height});

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // <-- Radius
            ),
            backgroundColor: Color.fromRGBO(36, 37, 38, 100)),
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
