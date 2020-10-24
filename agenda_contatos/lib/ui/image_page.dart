import 'package:flutter/material.dart';

class ImagePage extends StatelessWidget {
  final _imageFile;

  ImagePage(this._imageFile);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imagem"),
        backgroundColor: Colors.red,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Image.file(_imageFile),
      ),
    );
  }
}
