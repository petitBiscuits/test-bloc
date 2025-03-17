import 'package:bloc_pattern_example/features/children/presentation/children_page.dart';
import 'package:bloc_pattern_example/features/web_page/presentation/web_page.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // On définit ici les pages : chacune aura son titre et son contenu
  final List<Widget> _pages = const [
    WebPage(),
    ChildrenPage(),
  ];

  // Pour chaque page, on associe un titre différent
  final List<String> _titles = const [
    'Accueil',
    'Liste',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarms'),
        ],
      ),
    );
  }
}
