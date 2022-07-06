import 'package:demo_fluuter/models/catalog_model.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.backgroundColor,
        elevation: 0.0,
      ),
      backgroundColor: context.backgroundColor,
      body: Column(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(
              catalog.image,
            ),
          ).h32(context),
          Expanded(
            child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.canvasColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(context.cardColor).bold.make(),
                    catalog.desc.text
                        .textStyle(context.captionStyle)
                        .color(context.cardColor)
                        .lg
                        .make(),
                    const HeightBox(20),
                    "Kasd eos sed dolor ut tempor gubergren. Magna clita lorem sanctus erat aliquyam aliquyam tempor diam. Sed vero ipsum kasd stet invidunt aliquyam eos eos, clita lorem ipsum dolores est. Diam invidunt nonumy kasd lorem nonumy. Sit dolor ut invidunt voluptua sed et eirmod, voluptua consetetur vero sit et invidunt."
                        .text
                        .justify
                        .textStyle(context.captionStyle)
                        .lg
                        .color(context.cardColor)
                        .make()
                        .px32(),
                  ],
                ).py64(),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        color: context.canvasColor,
        height: 70.0,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.color(context.cardColor).bold.xl.make(),
            ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                backgroundColor:
                    MaterialStateProperty.all(context.primaryColor),
              ),
              onPressed: () {},
              child: "Add to cart".text.make(),
            )
          ],
        ).px20(),
      ),
    );
  }
}
