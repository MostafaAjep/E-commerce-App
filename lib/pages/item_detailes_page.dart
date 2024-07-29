import 'package:e_commerce_app/models/item_model.dart';
import 'package:e_commerce_app/widgets/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({super.key, required this.item});
  final ItemModel item;

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        title: Text(
          widget.item.name,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal.shade400,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                Provider.of<FavoriteProvider>(context, listen: false)
                    .addFavorite(widget.item);
                setState(() {
                  widget.item.isFavorite = !widget.item.isFavorite;
                });
              },
              icon: widget.item.isFavorite
                  ? const Icon(Icons.favorite, color: Colors.black)
                  : const Icon(Icons.favorite_border, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.asset(widget.item.image),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  ' ${widget.item.name} Price',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  '\$${widget.item.price}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
