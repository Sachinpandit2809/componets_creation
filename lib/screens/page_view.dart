import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page View'),
      ),
      body: PageView(
          scrollDirection: Axis.vertical,
          allowImplicitScrolling: true,
          // reverse: true,
          children: [
            Column(
              children: [Text("PAGE 1")],
            ),
            Column(
              children: [Text("PAGE 2")],
            ),
            Column(
              children: [Text("PAGE 2")],
            ),
          ]),
    );
  }
}
