class CatalogModel {
  // ignore: non_constant_identifier_names
  static final Items = [
    Item(
        id: 2,
        name: "Meet",
        color: "#ddddd",
        desc: "sdfdfgf",
        image:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Indian_Rupee_symbol_link_blue.svg/1392px-Indian_Rupee_symbol_link_blue.svg.png",
        price: 000),
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
