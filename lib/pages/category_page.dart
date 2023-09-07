import 'package:flutter/material.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/custom_app_bar.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/home/search_box.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          CustomAppBar(title: "Category"),
          SearchBox(title: "Search Category"),
        ],
      ),
    );
  }
}
