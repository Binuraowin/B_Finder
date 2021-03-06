import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:b_finder/models/brew.dart';
import 'package:b_finder/models/product.dart';
import 'package:b_finder/Screens/widgets/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final products = Provider.of<List<Product>>(context) ?? [];
        return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return BrewTile(product: products[index]);
      },
    );
  }
}