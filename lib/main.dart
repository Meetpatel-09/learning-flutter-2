import 'package:demo_fluuter/pages/home_page.dart';
import 'package:demo_fluuter/pages/login_page.dart';
import 'package:demo_fluuter/utils/routes.dart';
import 'package:demo_fluuter/widgets/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, // currently light theme
      darkTheme: MyTheme.darkTheme(context),
      theme: MyTheme.lightTheme(context),
      initialRoute: MyRoute.loginRoute,
      routes: {
        "/": (context) => const LoginPage(),
        MyRoute.loginRoute: (context) => const LoginPage(),
        MyRoute.homeRoute: (context) => const HomePage(),
      },
    );
  }
}
