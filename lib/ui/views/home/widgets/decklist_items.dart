import 'package:flutter/material.dart';

class DeckListItems extends StatelessWidget {
  const DeckListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: ListView(
        padding: const EdgeInsets.all(5),
        children: const [
          Divider(),
          SizedBox(
            height: 20,
            // color: Colors.amber[200],
            child: Center(child: Text('Entry B')),
          ),
          Divider(),
          SizedBox(
            height: 20,
            // color: Colors.amber[300],
            child: Center(child: Text('Entry C')),
          ),
          Divider(),
          SizedBox(
            height: 20,
            // color: Colors.amber[300],
            child: Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}
