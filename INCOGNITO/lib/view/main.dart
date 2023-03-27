import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incognito/view/component/componant.dart';
import 'package:incognito/view/component/download.dart';
import 'package:file_picker/file_picker.dart';
import 'package:incognito/view/component/upload.dart';
import 'dart:io';

void main() {
  runApp(
    const MaterialApp(
      home: mainPage(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class mainPage extends StatefulWidget {
  const mainPage({super.key});

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  File? _imageFile;
  final ImagePicker _pickerImage = ImagePicker();

  File? _file;
  final _pickerFile = FilePicker.platform;

  Future<void> _pickFile() async {
    final result = await _pickerFile.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if (result != null) {
      setState(() {
        //_file = File(result.files.single.path!);
        _file = File(result.files.single.name);
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await _pickerImage.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  _pickImageNull() {
    setState(() {
      _imageFile = null;
    });
  }

  _pickFileNull() {
    setState(() {
      _file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(24, 25, 26, 100),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(left: 20),
              child: const Text(
                "Send \nOr Recived !",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Column(
                children: [
                  ElevatedButtonUpload(
                    data: "Choisir une image",
                    imageFile: _imageFile,
                    pickimage: _pickImage,
                    pickimageNull: _pickImageNull,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  ElevatedButtonDownload(
                    file: _file,
                    imageFile: _imageFile,
                    pickFile: _pickFile,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
