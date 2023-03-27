import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incognito/view/component/componant.dart';
import 'dart:io';

class ElevatedButtonDownload extends StatefulWidget {
  File? imageFile;
  File? file;
  final Function() pickFile;

  ElevatedButtonDownload(
      {super.key,
      required this.file,
      required this.imageFile,
      required this.pickFile});

  @override
  State<ElevatedButtonDownload> createState() => _ElevatedButtonDownloadState();
}

class _ElevatedButtonDownloadState extends State<ElevatedButtonDownload> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ElevatedButtonStyled(
            height: 150,
            width: 150,
            onPressed: widget.pickFile,
            text: 'Choisir ur',
          ),
        ],
      ),
    );
  }
}
