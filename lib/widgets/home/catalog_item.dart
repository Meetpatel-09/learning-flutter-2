import 'package:demo_fluuter/models/catalog_model.dart';
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
          VxBox(child: Image.network(catalogItem.image).p(14))
              .size(100.0, 100.0)
              .rounded
              .color(Colors.white)
              .make(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                catalogItem.name.text.lg.semiBold.make(),
                catalogItem.desc.text.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalogItem.price}".text.bold.make(),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBluishColor),
                      ),
                      onPressed: () {},
                      child: "Buy".text.make(),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    ).color(Colors.white).rounded.make();
  }
}
