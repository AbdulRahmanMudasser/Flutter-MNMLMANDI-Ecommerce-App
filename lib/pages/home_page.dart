import 'package:flutter/material.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/pages/category_page.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/pages/product_display_page.dart';

import '../components/widgets/custom_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                ProductsPage(),
                CategoriesPage(),
              ],
            ),

            // bottom navigation bar
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: CustomBottomNavigationBar(
                pageController: pageController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

