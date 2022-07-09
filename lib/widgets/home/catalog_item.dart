import 'package:demo_fluuter/models/cart_model.dart';
import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:demo_fluuter/widgets/home/catalog_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  final Item catalogItem;
  const CatalogItem({Key? key, required this.catalogItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalogItem.id.toString()),
            child: CatalogImage(catalogItem: catalogItem),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalogItem.name.text.lg.semiBold
                    .color(context.cardColor)
                    .make(),
                catalogItem.desc.text.color(context.cardColor).make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalogItem.price}"
                        .text
                        .color(context.cardColor)
                        .bold
                        .make(),
                    _AddToCart(
                      catalogItem: catalogItem,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ).color(context.canvasColor).rounded.make();
  }
}

class _AddToCart extends StatefulWidget {
  final Item catalogItem;
  const _AddToCart({
    Key? key,
    required this.catalogItem,
  }) : super(key: key);

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
   final _cartModel = CartModel();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cartModel.items.contains(widget.catalogItem);

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(const StadiumBorder()),
        backgroundColor: MaterialStateProperty.all(context.primaryColor),
      ),
      onPressed: () {
        
          if(!isInCart) {
            isInCart = isInCart.toggle();
            final _catalogModel = CatalogModel();
          
            _cartModel.catalog = _catalogModel;
            _cartModel.add(widget.catalogItem);
            setState(() {});
          }

      },
      child: isInCart ? const Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
