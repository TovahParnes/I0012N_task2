import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task2/providers/savedCardProvider.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

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
  final List<List<String>> _cards = [];

  @override
  Widget build(BuildContext context) {
    _cards.addAll(context.read<SavedCards>().saved);
    return Scaffold(
      body: Center(
          child: SizedBox.fromSize(
        size: const Size.fromHeight(550.0),
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8),
          itemCount: _cards.length,
          itemBuilder: (BuildContext context, int index) {
            bool alreadySaved =
                context.read<SavedCards>().checkAlreadySaved(_cards[index]);

            return Card(
                child: Stack(fit: StackFit.expand, children: [
              const Material(
                elevation: 20.0,
                shadowColor: Colors.black,
              ),
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
          },
        ),
      )),
    );
  }
}
