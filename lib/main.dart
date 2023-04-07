import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wanandroid_flutter/pages/animate.dart';
import 'package:wanandroid_flutter/pages/image.dart';
import 'package:wanandroid_flutter/pages/remoteimage.dart';

import 'pages/list.dart';

void main() {
  runApp(const SampleApp());
}

class SampleApp extends StatelessWidget {
  const SampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  const SampleAppPage({super.key});

  @override
  State<SampleAppPage> createState() => _SampleAppPageState();
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.index,
    required this.onPress,
  });

  final String index;
  final void Function() onPress;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: Card(
              child: Column(
                children: <Widget>[
                  Text('Card $index'),
                  TextButton(
                    onPressed: onPress,
                    child: const Text('Press'),
                  ),
                ],
              ))
        ),
      ],
    );
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample App1'),
      ),
      body: Column(
        children: <Widget>[
          CustomCard(
              index: "列表",
              onPress: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ListNew(),
                      ),
                    )
                  }),
          CustomCard(
              index: "本地图片",
              onPress: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImageNew(),
                      ),
                    )
                  }),
          CustomCard(
              index: "远程图片",
              onPress: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RemoteImage(imageUrl: "https://flutter.cn/assets/images/docs/assets-and-images/launch-screen.png"),
                  ),
                )
              }),
          CustomCard(
              index: "动画",
              onPress: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AnimateApp(),
                  ),
                )
              }),
        ],
      ),
    );
  }
}
