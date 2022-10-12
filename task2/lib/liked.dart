import 'package:flutter/material.dart';
import 'main.dart';

class Liked extends StatelessWidget {
  const Liked({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.fromLTRB(45, 150, 100, 30),
          transform: Matrix4.rotationZ(-0.2),
          child: Text(
            MyApp.title,
          ),
        ),
      ],
    );
  }
}
