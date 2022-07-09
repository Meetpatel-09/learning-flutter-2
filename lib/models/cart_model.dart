import 'package:demo_fluuter/models/catalog_model.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  // Catalog fields
  late CatalogModel _catalogModel;

  // List of IDs - store id of each item
  final List<int> _itemIDs = [];

  // GET Catalog
  CatalogModel get catalog => _catalogModel;

  // SET Catalog
  set catalog(CatalogModel newCatalog) {
    _catalogModel = newCatalog;
  }

  // GET items in the cart
  List<Item> get items =>
      _itemIDs.map((id) => _catalogModel.getItemById(id)).toList();

  // get total prices
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIDs.add(item.id);
  }

  void remove(Item item) {
    _itemIDs.remove(item.id);
  }
}
