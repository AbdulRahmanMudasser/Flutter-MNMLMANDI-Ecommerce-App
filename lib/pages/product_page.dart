import 'package:flutter/material.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/custom_app_bar.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/home/product/product_display_page.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/components/widgets/home/search_box.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/config/app_colors.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/config/app_size.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with TickerProviderStateMixin {
  late TabController tabController;

  int selectedValue = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Column(
          children: [
            // app bar
            const CustomAppBar(title: "MNMLMANDI"),

            // search box
            const SearchBox(title: "Search Product"),

            // tab bar and tab views
            TabBar(
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: AppColors.kBackgroundColor,
              splashBorderRadius: BorderRadius.circular(30),
              // padding: EdgeInsets.zero,
              dividerColor: Colors.transparent,
              labelPadding: const EdgeInsets.symmetric(horizontal: 5),
              // indicatorWeight: 3,
              onTap: (value) {
                setState(() {
                  selectedValue = value;
                });
                tabController.animateTo(value);
              },
              tabs: [
                Container(
                  width: double.infinity,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedValue == 0
                        ? AppColors.kBackgroundColor
                        : AppColors.kGreyColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: selectedValue == 0
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  child: const Text(
                    "Trending",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedValue == 1
                        ? AppColors.kBackgroundColor
                        : AppColors.kGreyColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: selectedValue == 1
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  child: const Text(
                    "Clothing",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            // tab view
            SizedBox(
              height: AppSize.screenHeight,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: const [
                  ProductDisplayList(),
                  ProductDisplayList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
