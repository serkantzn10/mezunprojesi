import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled13/Pages/CartPage.dart';

import '../Pages/MainPage.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.indigo.shade400,
              ),
              accountName: Text(
                "GO DUTCH APP",
                style: TextStyle(
                  letterSpacing: 2.0,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "Flutter Team 67",
                style: TextStyle(
                  fontSize: 20,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.lightBlueAccent,
              ),
              title: Text(
                "Scan QR Code",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserInfoPage()),
              );
            },
            child: ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: Colors.lightBlueAccent,
              ),
              title: Text(
                "My Information",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );            },
            child: ListTile(
              leading: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.lightBlueAccent,
              ),
              title: Text(
                "My Order",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainPage()),
              );
            },
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.lightBlueAccent,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

