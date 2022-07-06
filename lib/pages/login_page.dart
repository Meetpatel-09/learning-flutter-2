import 'package:demo_fluuter/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";

  bool isPressed = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isPressed = true;
      });

      await Future.delayed(const Duration(seconds: 1));

      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, MyRoute.homeRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                  "https://img.freepik.com/free-vector/computer-login-concept-illustration_114360-7862.jpg?t=st=1655874553~exp=1655875153~hmac=e3e8b3a6b36b1f61e7b1186be9e38bfbbcef0ed86b4e328e3bf02e506046088b&w=1060"),
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "Welcome!! $name",
              style: const TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                validator: (value) {
                  if (value == "") {
                    return "Username cannot be empty";
                  }

                  return null;
                },
                style: TextStyle(color: context.cardColor),
                decoration: const InputDecoration(
                  hintText: "Enter Username",
                  label: Text("Name"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                validator: (value) {
                  if (value == "") {
                    return "Password cannot be empty";
                  } else if (value!.length < 6) {
                    return "Password must have atleast 6 charactors";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                style: TextStyle(color: context.cardColor),
                decoration: const InputDecoration(
                  hintText: "Enter Password",
                  label: Text("Password"),
                ),
              ),
            ),
            Material(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(isPressed ? 40.0 : 8.0),
              child: InkWell(
                // splashColor: Colors.red,
                borderRadius: BorderRadius.circular(isPressed ? 40.0 : 8.0),
                onTap: () => moveToHome(context),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 40.0,
                  width: isPressed ? 40.0 : 120.0,
                  alignment: Alignment.center,
                  child: isPressed
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : const Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
