import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:demo_fluuter/widgets/drawer.dart';
import 'package:demo_fluuter/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
        title: const Text(
          "Catalog App",
        ),
      ),
      body: ListView.builder(
          itemCount: CatalogModel.Items.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: CatalogModel.Items[index],
            );
          }),
      drawer: const MyDrawer(),
    );
  }
}
