import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:demo_fluuter/widgets/home/catalog_item.dart';
import 'package:demo_fluuter/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // await Future.delayed(const Duration(seconds: 2));

    final String catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    final decodedJson = jsonDecode(catalogJson);

    final productsData = decodedJson["products"];

    final List<Item> list =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();

    CatalogModel.Items = list;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              // ignore: unnecessary_null_comparison
              if (CatalogModel.Items != null && CatalogModel.Items.isNotEmpty)
                const Expanded(child: CatalogList())
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl4.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl.make(),
      ],
    );
  }
}

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
          return CatalogItem(
            catalogItem: catalog,
          ).p(10);
        });
  }
}
