import 'package:flutter/material.dart';
import 'names.dart';
import 'images.dart';
import 'liked.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  static const String title = "testnasm";
  final SavedNames _savedNames = SavedNames();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          foregroundColor: Colors.black,
        ),
      ),
      home: MainPage(_savedNames),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage(SavedNames savedNames, {super.key});

  late SavedNames _savedNames;

  @override
  State<MainPage> createState() => _MainPageState(_savedNames);
}

class _MainPageState extends State<MainPage> {
  late SavedNames _savedNames;

  _MainPageState(SavedNames savedNames) {
    _savedNames = savedNames;
  }

  int currentPage = 1;
  List<Widget> pages = [
    LeftPage(),
    HomePage(_savedNames),
    const Liked(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Name Generator"),
          actions: [
            IconButton(onPressed: _settings, icon: const Icon(Icons.settings)),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(icon: Icon(Icons.image), label: 'Images'),
            NavigationDestination(icon: Icon(Icons.list), label: 'Names'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Liked'),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ),
        body: pages[currentPage]);
  }

  void _settings() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Settings'),
            ),
            body: ListView(),
          );
        },
      ),
    );
  }
}

class SavedNames {
  final _saved = <WordPair>{};

  get saved {
    return _saved;
  }

  saveWordPair(WordPair wordPair) {
    _saved.add(wordPair);
  }
}
