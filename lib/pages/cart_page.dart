import 'package:demo_fluuter/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      appBar: AppBar(
        title: "Cart".text.make(),
        backgroundColor: context.backgroundColor,
        elevation: 0.0,
      ),
    );
  }
}
