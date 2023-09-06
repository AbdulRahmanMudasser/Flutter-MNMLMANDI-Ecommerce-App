import 'package:flutter/material.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/config/app_colors.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/config/app_text_styles.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/pages/home_page.dart';

import '../components/widgets/on boarding/image_list_view.dart';
import '../components/widgets/on boarding/information section/information_section.dart';
import '../components/widgets/reusable_button.dart';
import '../config/app_size.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize().init(context);

    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // image transition
          const Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: [
                ImageListView(
                  startingIndex: 0,
                ),
                ImageListView(
                  startingIndex: 1,
                ),
                ImageListView(
                  startingIndex: 2,
                ),
              ],
            ),
          ),

          // title
          Positioned(
            top: AppSize.screenHeight * 0.08,
            child: Text(
              "MNMLMANDI",
              style: AppTextStyles.kTitleStyle,
            ),
          ),

          // information section
          const Positioned(
            bottom: 0,
            child: InformationSection(),
          ),

          // sign up with email button
          Positioned(
            left: 20,
            right: 20,
            bottom: 30,
            child: ReusableButton(
              text: "Sign Up with Email",
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
