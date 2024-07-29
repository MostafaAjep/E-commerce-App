import 'package:e_commerce_app/widgets/categories_listview.dart';
import 'package:e_commerce_app/widgets/items_listview.dart';
import 'package:e_commerce_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(1),
            Colors.black38.withOpacity(0.8),
          ],
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.all(12),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: SearchBar2(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 22),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Popular Categories',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CatListView(),
            ),
            SliverToBoxAdapter(
              child: SizedBox(height: 32),
            ),
            ItmListView(
              items: [],
            ),
            ItmListView(
              items: [],
            ),
          ],
        ),
      ),
    );
  }
}
