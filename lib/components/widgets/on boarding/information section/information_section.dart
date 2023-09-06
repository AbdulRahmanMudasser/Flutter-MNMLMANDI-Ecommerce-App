import 'package:flutter/material.dart';

import '../../../../config/app_size.dart';
import '../../../../config/app_text_styles.dart';
import '../../../methods/build_indicators.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth,
      height: AppSize.screenHeight * 0.60,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.white54,
            Colors.white,
            Colors.white,
          ],
          begin: Alignment.topCenter,
          end: Alignment.center,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),

          // description
          Text(
            "Your Appearance \nShows Your Quality",
            style: AppTextStyles.kNormalStyle.copyWith(
              fontSize: 30,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: 25,
          ),

          // sub description
          Text(
            "Change the Quality of Your \nAppearance with MNMLMANDI Now!",
            style: AppTextStyles.kNormalStyle.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(
            height: 25,
          ),

          // indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildIndicators(),
          ),
        ],
      ),
    );
  }
}
