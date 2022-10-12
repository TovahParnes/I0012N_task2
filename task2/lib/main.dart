import 'package:flutter/material.dart';
import 'homePage.dart';
import 'images.dart';
import 'rightPage.dart';

void main() {
  runApp(const MyApp());
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
  List<Widget> pages = [
    LeftPage(),
    const HomePage(),
    const RightPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Hello World!"),
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
