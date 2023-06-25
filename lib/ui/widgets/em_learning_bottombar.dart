import 'package:flutter/material.dart';

class EMLearningBottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemTapped;
  const EMLearningBottomBar(
      {super.key, required this.selectedIndex, this.onItemTapped});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Easy',
          backgroundColor: Colors.blue,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Good',
          backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'Hard',
          backgroundColor: Colors.red,
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: Colors.black,
      onTap: onItemTapped,
    );
  }
}
