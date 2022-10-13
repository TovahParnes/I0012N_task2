import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/savedNamesProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final List<String> _suggestions = [];
  //final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    _suggestions.addAll(context.read<SavedNames2>().saved);
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs()
                .take(10)
                .toList()
                .map((wordPair) => wordPair.asPascalCase));
          }
          final alreadySaved = context
              .read<SavedNames2>()
              .checkAlreadySaved(_suggestions[index]);
          return ListTile(
              tileColor: Colors.grey,
              title: Text(
                _suggestions[index],
                style: _biggerFont,
              ),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ),
              onTap: () {
                setState(() {
                  if (alreadySaved) {
                    context
                        .read<SavedNames2>()
                        .removeSavedName(_suggestions[index]);
                  } else {
                    context
                        .read<SavedNames2>()
                        .addSavedName(_suggestions[index]);
                  }
                });
              });
        },
      ),
    );
  }
}
