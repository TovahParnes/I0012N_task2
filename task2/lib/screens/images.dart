import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/providers/savedCardProvider.dart';
import '../providers/savedNamesProvider.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Cards(),
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  final List<String> images = [
    "assets/wallpaper-1.jpeg",
    "assets/wallpaper-2.jpeg",
    "assets/wallpaper-3.jpeg",
    "assets/wallpaper-4.jpeg",
    "assets/wallpaper-5.jpeg",
    "assets/wallpaper-6.jpeg",
  ];

  final List<String> _imageTexts = [];

  final List<List<String>> _cards = [];

  @override
  Widget build(BuildContext context) {
    _cards.addAll(context.read<SavedCards>().saved);
    _imageTexts.addAll(context.read<SavedNames>().saved);
    _imageTexts.length == 0 ? _imageTexts.add("NoSavedText") : null;
    return Scaffold(
      body: Center(
          child: SizedBox.fromSize(
        size: const Size.fromHeight(550.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            _cards.add([
              images[Random().nextInt(images.length)],
              _imageTexts[Random().nextInt(_imageTexts.length)]
            ]);

            bool alreadySaved =
                context.read<SavedCards>().checkAlreadySaved(_cards[index]);

            return Card(
                child: Stack(fit: StackFit.expand, children: [
              Image.asset(
                _cards[index][0],
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
              ListTile(
                  title: Text(_cards[index][1],
                      style:
                          const TextStyle(fontSize: 40, color: Colors.white)),
                  trailing: Icon(
                    alreadySaved ? Icons.favorite : Icons.favorite_border,
                    color: alreadySaved ? Colors.red : Colors.white,
                    semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
                  ),
                  onTap: () {
                    setState(() {
                      if (alreadySaved) {
                        context
                            .read<SavedCards>()
                            .removeSavedCard(_cards[index]);
                      } else {
                        context.read<SavedCards>().addSavedCard(_cards[index]);
                      }
                    });
                  })
            ]));

            // return Padding(
            //   padding: const EdgeInsets.fromLTRB(8, 10, 8, 50),
            //   child: Material(
            //     elevation: 5.0,
            //     borderRadius: BorderRadius.circular(5.0),
            //     child: Stack(
            //       fit: StackFit.expand,
            //       children: [
            //         Image.asset(
            //           cards[index][0],
            //           fit: BoxFit.cover,
            //         ),
            //         DecoratedBox(
            //           decoration: BoxDecoration(
            //             gradient: LinearGradient(
            //               begin: FractionalOffset.topCenter,
            //               end: FractionalOffset.center,
            //               colors: [
            //                 const Color(0x00000000).withOpacity(0.7),
            //                 const Color(0xff000000).withOpacity(0.001),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Container(
            //           padding: const EdgeInsets.all(15),
            //           margin: const EdgeInsets.only(bottom: 405),
            //           child: Text(
            //             cards[index][1],
            //             style:
            //                 const TextStyle(fontSize: 50, color: Colors.white),
            //           ),
            //         ),
            //         IconButton(
            //           icon: Icon(
            //             alreadySaved ? Icons.favorite : Icons.favorite_border,
            //             color: alreadySaved ? Colors.red : null,
            //             semanticLabel:
            //                 alreadySaved ? 'Remove from saved' : 'Save',
            //           ),
            //           tooltip: 'Save Card',
            //           onPressed: () {
            //             if (alreadySaved) {
            //               context
            //                   .read<SavedCards>()
            //                   .removeSavedCard(cards[index]);
            //               alreadySaved = false;
            //             } else {
            //               context.read<SavedCards>().addSavedCard(cards[index]);
            //               alreadySaved = true;
            //             }
            //           },
            //         ),
            //       ],
            //     ),
            //   ),
            // );
          },
        ),
      )),
    );
  }
}
