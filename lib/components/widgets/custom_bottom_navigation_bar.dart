import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../config/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  // tab bar icons
  List tabBarIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 70,
      decoration: BoxDecoration(
        color: AppColors.kBackgroundColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...tabBarIcons.map(
            (icon) => IconButton(
              onPressed: () {
                icon == FontAwesomeIcons.house
                    ? pageController.jumpToPage(0)
                    : pageController.jumpToPage(1);
              },
              icon: Icon(icon),
              color: Colors.white60,
              iconSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
