import 'package:demo_fluuter/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: context.backgroundColor,
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: context.canvasColor),
            margin: const EdgeInsets.all(0.0),
            padding: const EdgeInsets.all(0.0),
            child: UserAccountsDrawerHeader(
              accountName: Text(
                "Meet Patel",
                style: TextStyle(color: context.cardColor),
              ),
              accountEmail: Text("meetpatel@gmail.com",
                  style: TextStyle(color: context.cardColor)),
              currentAccountPicture: const CircleAvatar(
                radius: 10.0,
                backgroundImage: AssetImage(
                  "assets/images/img.jpg",
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home, color: context.cardColor),
            title: Text(
              "Home",
              style: TextStyle(fontSize: 18.0, color: context.cardColor),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.mail, color: context.cardColor),
            title: Text(
              "Contact",
              style: TextStyle(fontSize: 18.0, color: context.cardColor),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.lock, color: context.cardColor),
            title: GestureDetector(
              onTap: () => Navigator.pushNamed(context, MyRoute.loginRoute),
              child: Text(
                "Log In",
                style: TextStyle(fontSize: 18.0, color: context.cardColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
