import 'package:flutter/material.dart';
import 'package:foodpanda/Constants/MyColors.dart';
import 'package:foodpanda/Screens/MyHomePage.dart';
class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: MyColors.secondaryTextColor,
            ),
            child: Text(
              'Food Panda Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute(builder: (BuildContext context) => const MyHomePage()),
                ModalRoute.withName('/'),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}