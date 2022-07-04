import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:demo_fluuter/pages/home_details_page.dart';
import 'package:demo_fluuter/widgets/home/catalog_item.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatefulWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  State<CatalogList> createState() => _CatalogListState();
}

class _CatalogListState extends State<CatalogList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.Items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.Items[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeDetailsPage(catalog: catalog),
                ),
              );
            },
            child: CatalogItem(
              catalogItem: catalog,
            ).p(10),
          );
        });
  }
}
