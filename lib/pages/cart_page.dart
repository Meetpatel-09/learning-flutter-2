import 'package:demo_fluuter/models/cart_model.dart';
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
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cartItems = CartModel();
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cartItems.totalPrice}"
              .text
              .xl3
              .bold
              .color(context.primaryColor)
              .make(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: context.primaryColor,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet.".text.make()));
            },
            child: "Place Order".text.make(),
          ).w32(context)
        ],
      ),
    ).pSymmetric(v: 15.0, h: 25.0);
  }
}

class _CartList extends StatefulWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cartItems = CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cartItems.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        title: _cartItems.items[index].name.text.make(),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove_circle_outline),
        ),
      ),
    );
  }
}
