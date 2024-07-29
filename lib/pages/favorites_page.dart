import 'package:e_commerce_app/widgets/favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text(
        '\toh no! nothing here! \ntry adding something',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.black45,
        ),
      ),
    );
    if (Provider.of<FavoriteProvider>(context).favorites.isNotEmpty) {
      setState(() {
        content = Consumer<FavoriteProvider>(
          builder: (context, favoriteProvider, child) {
            var totalPrice = favoriteProvider
                .calculateTotalPrice(favoriteProvider.favorites);
            return Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: favoriteProvider.favorites.length + 1,
                  itemBuilder: (context, index) {
                    if (index == favoriteProvider.favorites.length) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: double.infinity,
                            height: 60,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total price:',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\$${totalPrice.truncate()}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    final item = favoriteProvider.favorites[index];
                    return Dismissible(
                      key: Key(item.id),
                      direction: DismissDirection.horizontal,
                      onDismissed: (direction) {
                        favoriteProvider.removeFavorite(item);
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('${item.name} is removed from favorites'),
                          ),
                        );
                      },
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            item.image,
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
                                item.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '\$ ${item.price.toString()}',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          )
                        ],
                      ),
                    );
                  }),
            );
          },
        );
      });
    }
    return Scaffold(
      body: content,
    );
  }
}
