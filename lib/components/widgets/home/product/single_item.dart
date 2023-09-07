import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../config/app_colors.dart';
import '../../../../config/app_size.dart';
import '../../../../config/app_text_styles.dart';
import '../../../../models/product_model.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({
    super.key,
    required this.product,
    required this.lastItem,
  });

  final ProductModel product;
  final bool lastItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28),
                    child: CachedNetworkImage(
                      imageUrl: product.productImageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // product name
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 15),
                    child: Text(
                      product.productName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                      )
                    ),
                  ),

                  // product price
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8, top: 4),
                    child: Row(
                      children: [
                        Text(
                          "\$${product.currentPrice}",
                          style: AppTextStyles.kNormalStyle.copyWith(
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "\$${product.oldPrice}",
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.kRedColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // favourite icon
            Positioned(
              right: 5,
              top: 10,
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: AppColors.kBackgroundColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  product.isLiked == true ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                  size: 15,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: lastItem ? AppSize.screenHeight * 0.5 : 0,
        ),
      ],
    );
  }
}
