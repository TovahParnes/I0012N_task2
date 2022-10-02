import 'package:flutter/material.dart';
import 'listItem.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.red,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.fromLTRB(45, 150, 100, 30),
          child: const Text(
            "HOME.",
            style: TextStyle(fontSize: 40),
          ),
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
