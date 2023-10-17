import 'package:flutter/material.dart';
import 'package:shramikaya/utils/colors.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Wish List",
            style: TextStyle(color: primaryColor),
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
