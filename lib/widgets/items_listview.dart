// ignore_for_file: sized_box_for_whitespace

import 'package:e_commerce_app/models/item_model.dart';
import 'package:e_commerce_app/pages/item_detailes_page.dart';
import 'package:e_commerce_app/widgets/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItmListView extends StatefulWidget {
  const ItmListView({super.key, required this.items});
  final List<ItemModel> items;

  @override
  State<ItmListView> createState() => _ItmListViewState();
}

class _ItmListViewState extends State<ItmListView> {
  final List<ItemModel> items = [
    ItemModel(false, '1', name: 'shirt', price: 700, image: 'assets/shirt.png'),
    ItemModel(false, '2', name: 'shoe', price: 500, image: 'assets/khra.png'),
    ItemModel(false, '3', name: 'short', price: 200, image: 'assets/short.png'),
    ItemModel(false, '4',
        name: 'watch', price: 1000, image: 'assets/watch.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          // Calculate the actual index for each item in the row
          int itemIndex1 = index * 2;
          int itemIndex2 = itemIndex1 + 1;

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (itemIndex1 < items.length) buildItemContainer(itemIndex1),
              if (itemIndex2 < items.length) buildItemContainer(itemIndex2),
            ],
          );
        },
        childCount: (items.length / 2).ceil(),
      ),
    );
  }

  Widget buildItemContainer(int index) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ItemDetailsPage(item: items[index]);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: 180,
        height: 230,
        child: Column(
          children: [
            Image.asset(
              items[index].image,
              fit: BoxFit.cover,
              width: 140,
              height: 140,
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  items[index].name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Provider.of<FavoriteProvider>(context, listen: false)
                        .addFavorite(items[index]);
                    setState(() {
                      items[index].isFavorite = !items[index].isFavorite;
                    });
                  },
                  icon: items[index].isFavorite
                      ? const Icon(Icons.favorite, color: Colors.black)
                      : const Icon(Icons.favorite_border, color: Colors.black),
                ),
                Text(
                  '\$ ${items[index].price.toString()}',
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
