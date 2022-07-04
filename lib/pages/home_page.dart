import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:demo_fluuter/widgets/home/catalog_header.dart';
import 'package:demo_fluuter/widgets/home/catalog_list.dart';
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
    await Future.delayed(const Duration(seconds: 1));

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
                const CircularProgressIndicator().centered().expand()
            ],
          ),
        ),
      ),
    );
  }
}

