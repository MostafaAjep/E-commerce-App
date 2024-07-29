import 'package:flutter/material.dart';

class SearchBar2 extends StatelessWidget {
  const SearchBar2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: 60,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(width: 12),
          Icon(
            Icons.search,
            size: 28,
          ),
          SizedBox(width: 12),
          Text(
            'Search in store',
            style: TextStyle(fontSize: 18, color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
