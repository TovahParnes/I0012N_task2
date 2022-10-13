import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/savedNamesProvider.dart';

class ImagePage extends StatelessWidget {
  //const LeftPage({Key? key}) : super(key: key);
  ImagePage({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/wallpaper-1.jpeg",
    "assets/wallpaper-2.jpeg",
    "assets/wallpaper-3.jpeg",
    "assets/wallpaper-4.jpeg",
    "assets/wallpaper-5.jpeg",
    "assets/wallpaper-6.jpeg",
  ];

  final List<String> imageTexts = [];

  //late Random random;

  @override
  Widget build(BuildContext context) {
    imageTexts.addAll(context.read<SavedNames2>().saved);
    return Scaffold(
      body: Center(
          child: SizedBox.fromSize(
        size: const Size.fromHeight(550.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(8, 10, 8, 50),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(5.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      images[Random().nextInt(images.length)],
                      fit: BoxFit.cover,
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.center,
                          colors: [
                            const Color(0x00000000).withOpacity(0.7),
                            const Color(0xff000000).withOpacity(0.001),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 405),
                      child: Text(
                        imageTexts[Random().nextInt(imageTexts.length)],
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}
