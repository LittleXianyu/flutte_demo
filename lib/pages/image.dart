import 'package:flutter/material.dart';

void main() {
  runApp(const ImageNew());
}

class ImageNew extends StatelessWidget {
  const ImageNew({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Image.asset('lib/res/images/test.png'),
    );
  }
}