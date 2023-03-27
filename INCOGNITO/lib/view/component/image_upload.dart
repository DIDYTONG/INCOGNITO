import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incognito/view/component/componant.dart';
import 'dart:io';

class ElevatedButtonUpload extends StatefulWidget {
  File? imageFile;
  String data;
  final Function() pickimage;
  final Function() pickimageNull;

  ElevatedButtonUpload(
      {super.key,
      required this.data,
      required this.imageFile,
      required this.pickimage,
      required this.pickimageNull});

  @override
  State<ElevatedButtonUpload> createState() => _ElevatedButtonUploadState();
}

class _ElevatedButtonUploadState extends State<ElevatedButtonUpload> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.imageFile == null
          ? ElevatedButtonStyled(
              text: widget.data,
              onPressed: widget.pickimage,
              height: 150,
              width: 150,
            )
          : Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.width / 1000),
                  child: Image.file(widget.imageFile!),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                ElevatedButtonStyled(
                  text: "Retour en arrière",
                  onPressed: widget.pickimageNull,
                ),
              ],
            ),
    );
  }
}
