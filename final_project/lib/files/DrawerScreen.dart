import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child : ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Muhamad Alfarisy"),
            currentAccountPicture: CircleAvatar(
              backgroundImage:  AssetImage("assets/img/profile.jpg")
              ),
              accountEmail: Text("muhamadalfarisy9d@yahoo.com"),
            ),
          DrawerListTile(
            key : null,
            iconData: Icons.group,
            title : "NewGroup",
            onTilePressed: (){},
          ),
          DrawerListTile(
            key : null,
            iconData: Icons.lock,
            title : "New Secret Group",
            onTilePressed: (){},
          ),
          DrawerListTile(
            key : null,
            iconData: Icons.notifications,
            title : "New Channel chat",
            onTilePressed: (){},
          ),
          DrawerListTile(
            key : null,
            iconData: Icons.contacts,
            title : "contacts",
            onTilePressed: (){},
          ),
          DrawerListTile(
            key : null,
            iconData: Icons.bookmark_border,
            title : "Saved Message",
            onTilePressed: (){},
          ),
          DrawerListTile(
            key : null,
            iconData: Icons.phone,
            title : "Calls",
            onTilePressed: (){},
          ),
        ],
      )
    );
  }
}


class DrawerListTile extends StatelessWidget {
  final IconData iconData; //alias
  final String title;
  final VoidCallback onTilePressed;

  const DrawerListTile({ Key key,  this.iconData,  this.title,  this.onTilePressed }) // Constructor
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(title, style: TextStyle(fontSize: 16),),
    );
  }
}