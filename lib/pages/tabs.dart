import 'package:e_commerce_app/models/item_model.dart';
import 'package:e_commerce_app/pages/favorites_page.dart';
import 'package:e_commerce_app/pages/home_page.dart';
import 'package:e_commerce_app/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<ItemModel> items = [
    ItemModel(false, '1', name: 'shirt', price: 700, image: 'assets/shirt.png'),
    ItemModel(false, '2', name: 'shoe', price: 500, image: 'assets/khra.png'),
    ItemModel(false, '3', name: 'short', price: 200, image: 'assets/short.png'),
    ItemModel(false, '4',
        name: 'watch', price: 1000, image: 'assets/watch.png'),
  ];
  String username = '';
  int selectedPageIndex = 0;
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

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var activePageTitle = 'Home';
    Widget activePage = const HomePage();
    if (selectedPageIndex == 1) {
      activePage = const FavoritesPage();
      activePageTitle = 'Favorites';
    } else if (selectedPageIndex == 2) {
      activePage = const ProfilePage();
      activePageTitle = 'Profile';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedPageIndex == 0 ? 'Hello $username' : activePageTitle,
          style: const TextStyle(color: Colors.white),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.teal.shade400,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal.shade200,
        currentIndex: selectedPageIndex,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
