import 'package:flutter/material.dart';
import 'package:my_api_app/products/product_list_view.dart';
import 'package:my_api_app/albums/album_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter API Demo'),
        ),
        body: PageView(
          controller: _pageController,
          children: const [
            ProductList(),
            AlbumList(),
          ],
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Products',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              label: 'Albums',
            ),
          ],
        ),
      ),
    );
  }
}
