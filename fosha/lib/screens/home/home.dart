import 'package:flutter/material.dart';
import 'package:fosha/screens/home/widgets/feed_tab.dart';
import 'package:fosha/screens/logout/logout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const FeedPage(),
    const Text('Search'),
    const Text('Reels'),
    const Text('Shopping'),
    const LogoutScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (selectedIndex == _widgetOptions.length - 1)
          ? null
          : AppBar(
              // leading: null,
              automaticallyImplyLeading: false,
              title: const Text('Fosha',
                  style: TextStyle(fontFamily: 'Ceremonials', fontSize: 50)),
              actions: [
                IconButton(
                    icon: const Icon(Icons.add_box_outlined), onPressed: () {}),
                IconButton(
                    icon: const Icon(Icons.favorite_border), onPressed: () {}),
                IconButton(
                    icon: const Icon(Icons.message_outlined), onPressed: () {}),
              ],
            ),
      body: Center(
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_collection), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),
    );
  }
}
