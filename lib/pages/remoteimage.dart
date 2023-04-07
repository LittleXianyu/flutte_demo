import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RemoteImage extends StatefulWidget {
  final String imageUrl;

  const RemoteImage({required this.imageUrl});

  @override
  _RemoteImageState createState() => _RemoteImageState();
}

class _RemoteImageState extends State<RemoteImage> {
  late Future<http.Response> _imageResponse;

  @override
  void initState() {
    super.initState();
    _imageResponse = http.get(Uri.parse(widget.imageUrl));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: _imageResponse,
      builder: (BuildContext context, AsyncSnapshot<http.Response> snapshot) {
        if (snapshot.hasError) {
          return const Text('无法加载图片');
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Image.memory(snapshot.data!.bodyBytes);
          } else {
            return const Text('找不到图片');
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
