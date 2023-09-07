import 'package:flutter/material.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/home/product/single_item.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/data/products_data.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductDisplayList extends StatefulWidget {
  const ProductDisplayList({super.key});

  @override
  State<ProductDisplayList> createState() => _ProductDisplayListState();
}

class _ProductDisplayListState extends State<ProductDisplayList> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      itemCount: products.length,
      itemBuilder: (context, index) {
        return SingleItem(
          product: products[index],
          lastItem: index == products.length - 1 ? true : false,
        );
      },
    );
  }
}

