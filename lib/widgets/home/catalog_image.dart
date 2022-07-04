import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:demo_fluuter/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final Item catalogItem;
  const CatalogImage({Key? key, required this.catalogItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(child: Image.network(catalogItem.image).p4())
        .size(100.0, 100.0)
        .rounded
        .color(MyTheme.creamColor)
        .make()
        .p12();
  }
}
