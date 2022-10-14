import 'package:flutter/material.dart';
import 'package:task2/providers/savedCardProvider.dart';
import 'screens/names.dart';
import 'screens/images.dart';
import 'screens/liked.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'providers/savedNamesProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedNames()),
        ChangeNotifierProvider(create: (_) => SavedCards()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      const NamePage(),
      ImagePage(),
      const SavedPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Painting Name Generator"),
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.list),
              label: 'Names',
            ),
            NavigationDestination(icon: Icon(Icons.image), label: 'Images'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Saved'),
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
