import 'package:flutter/material.dart';
import 'homePage.dart';

class LeftPage extends StatelessWidget {
  //const LeftPage({Key? key}) : super(key: key);
  LeftPage({Key? key}) : super(key: key);

  final List<String> images = [
    "assets/wallpaper-1.jpeg",
    "assets/wallpaper-2.jpeg",
    "assets/wallpaper-3.jpeg",
    "assets/wallpaper-4.jpeg",
    "assets/wallpaper-5.jpeg",
    "assets/wallpaper-6.jpeg",
    "assets/wallpaper-7.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox.fromSize(
        size: Size.fromHeight(550.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return new Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 8.0,
              ),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(8.0),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                    /*
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: FractionalOffset.bottomCenter,
                          end: FractionalOffset.topCenter,
                          colors: [
                            Color(0x00000000).withOpacity(0.9),
                            Color(0xff000000).withOpacity(0.01),
                          ],
                        ),
                      ),
                    )
                    */
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
