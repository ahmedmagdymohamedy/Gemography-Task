import 'package:flutter/material.dart';
import 'package:gemography_task/screens/home%20page%20screen/setting/Setting.dart';
import 'package:gemography_task/screens/home%20page%20screen/trending/Trending.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('jjjjjjjjj'),
      ),
      body: getBody(index: _currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Trending'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }

  Widget getBody({required int index}) {
    switch (index) {
      case 0:
        return Trending();
      case 1:
        return Setting();
    }
    return Container();
  }
}
