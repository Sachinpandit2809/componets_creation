import 'package:flutter/material.dart';

class PagebuilderScreen extends StatefulWidget {
  const PagebuilderScreen({super.key});

  @override
  State<PagebuilderScreen> createState() => _PagebuilderScreenState();
}

class _PagebuilderScreenState extends State<PagebuilderScreen> {
  List<Color> _color = [
    Colors.deepOrangeAccent,
    Colors.amber,
    Colors.green,
    Colors.blueAccent,
    Colors.tealAccent,
    Colors.indigo
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        // pageSnapping: true,
        physics: const BouncingScrollPhysics(),
        allowImplicitScrolling: true,
        itemCount: _color.length,
        itemBuilder: (context, index) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: _color[index],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("PAGE ${index + 1}"),
              ],
            ),
          );
        },
      ),
    );
  }
}
