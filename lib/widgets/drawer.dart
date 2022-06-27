import 'package:demo_fluuter/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.cyan,
      child: ListView(
        children: [
          const DrawerHeader(
            margin: EdgeInsets.all(0.0),
            padding: EdgeInsets.all(0.0),
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Meet Patel",
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: Text("meetpatel@gmail.com",
                  style: TextStyle(color: Colors.white)),
              currentAccountPicture: CircleAvatar(
                radius: 10.0,
                backgroundImage: AssetImage(
                  "assets/images/img.jpg",
                ),
              ),
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.home, color: Colors.black),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const ListTile(
            leading: Icon(CupertinoIcons.mail, color: Colors.black),
            title: Text(
              "Contact",
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          ListTile(
            leading: const Icon(CupertinoIcons.lock, color: Colors.black),
            title: GestureDetector(
              onTap: () => Navigator.pushNamed(context, MyRoute.loginRoute),
              child: const Text(
                "Log In",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
