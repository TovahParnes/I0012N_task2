import 'package:flutter/material.dart';
import 'homePage.dart';

class LeftPage extends StatelessWidget {
  const LeftPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.fromLTRB(45, 150, 100, 30),
          transform: Matrix4.rotationZ(-0.2),
          child: const Text(
            "LEFT.",
            style: TextStyle(fontSize: 40),
          ),
        ),
        Row(
          children: [
            ElevatedButton(onPressed: () {}, child: const Text("A button")),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                    size: 60,
                  )),
            ),
          ],
        ),
        const Spacer(
          flex: 3,
        ),
        FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
