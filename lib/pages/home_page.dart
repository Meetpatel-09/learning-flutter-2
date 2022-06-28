import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:demo_fluuter/widgets/drawer.dart';
import 'package:demo_fluuter/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dl = List.generate(10, (index) => CatalogModel.Items[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catalog App",
        ),
      ),
      body: ListView.builder(
          itemCount: dl.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(4.0),
              margin: EdgeInsets.all(8.0),
              color: Colors.blue,
              child: ItemWidget(
                item: dl.first,
              ),
            );
          }),
      drawer: const MyDrawer(),
    );
  }
}
