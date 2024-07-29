class ItemModel {
  final num price;
  final String name;
  final String id;
  final String image;
  bool isFavorite;

  ItemModel(this.isFavorite, this.id,
      {required this.price, required this.name, required this.image});
}
