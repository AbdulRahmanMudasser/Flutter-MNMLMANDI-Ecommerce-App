import 'package:flutter/material.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/home/product/single_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductDisplayList extends StatelessWidget {
  const ProductDisplayList({
    super.key,
    required this.product,
  });

  final List product;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 10,
      itemCount: product.length,
      itemBuilder: (context, index) {
        return SingleItem(
          product: product[index],
          lastItem: index == product.length - 1 ? true : false,
        );
      },
    );
  }
}
