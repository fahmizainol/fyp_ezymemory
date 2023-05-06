import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:getwidget/getwidget.dart';

class EMDrawer extends StatelessWidget {
  final Function()? onTapItem1;
  const EMDrawer({super.key, this.onTapItem1});

  @override
  Widget build(BuildContext context) {
    return GFDrawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          GFDrawerHeader(
            currentAccountPicture: const GFAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(
                  "https://cdn.pixabay.com/photo/2017/12/03/18/04/christmas-balls-2995437_960_720.jpg"),
            ),
            otherAccountsPictures: const <Widget>[
              Image(
                image: NetworkImage(
                    "https://cdn.pixabay.com/photo/2019/12/20/00/03/road-4707345_960_720.jpg"),
                fit: BoxFit.cover,
              ),
              GFAvatar(
                child: Text("ab"),
              )
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text('user name'),
                Text('user@userid.com'),
              ],
            ),
          ),
          ListTile(
            title: Text('Logout'),
            onTap: onTapItem1,
          ),
          const ListTile(
            title: Text('Item 2'),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
