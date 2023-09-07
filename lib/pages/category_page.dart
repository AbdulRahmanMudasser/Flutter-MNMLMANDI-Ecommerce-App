import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/custom_app_bar.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/home/search_box.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/config/app_size.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/data/categories_data.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          const CustomAppBar(title: "Category"),
          const SearchBox(title: "Search Category"),
          ListView.builder(
            shrinkWrap: true,
            itemCount: categories.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return SingleCategoryCard(
                index: index,
              );
            },
          ),

          SizedBox(
            height: AppSize.screenHeight * 0.13,
          ),
        ],
      ),
    );
  }
}

class SingleCategoryCard extends StatelessWidget {
  const SingleCategoryCard({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth * 0.80,
      height: 170,
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: CachedNetworkImageProvider(categories[index].thumbnailImage),
          fit: BoxFit.cover,
        ),
      ),
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.2),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 10,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categories[index].categoryName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${categories[index].productCount} Products",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
