import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:demo_fluuter/widgets/home/catalog_image.dart';
import 'package:demo_fluuter/widgets/theme.dart';
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
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                        backgroundColor:
                            MaterialStateProperty.all(context.primaryColor),
                      ),
                      onPressed: () {},
                      child: "Add to cart".text.make(),
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
