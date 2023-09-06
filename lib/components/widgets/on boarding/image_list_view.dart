import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/config/app_size.dart';
import 'package:flutter_mnmlmandi_e_commerce_app/data/products_data.dart';

class ImageListView extends StatefulWidget {
  const ImageListView({
    super.key,
    required this.startingIndex,
  });

  final int startingIndex;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        // implement scroll of list
        _autoScroll();
      }

      // adding to list
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _autoScroll();
      });
    });
  }

  void _autoScroll() {
    final currentScrollPosition = _scrollController.offset;
    final scrollEndPosition = _scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      _scrollController.animateTo(
        currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
        duration: Duration(seconds: 10),
        curve: Curves.linear,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        width: AppSize.screenWidth * 0.60,
        height: AppSize.screenHeight * 0.60,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: 5,
          itemBuilder: (context, index) {
            return CachedNetworkImage(
              imageUrl: products[widget.startingIndex + index].productImageUrl,
              imageBuilder: (context, imageProvider) {
                return Container(
                  margin: const EdgeInsets.only(right: 8, left: 8, top: 10),
                  height: AppSize.screenHeight * 0.40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
