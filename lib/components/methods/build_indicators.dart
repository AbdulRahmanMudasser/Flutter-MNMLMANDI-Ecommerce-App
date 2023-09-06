import 'package:flutter/material.dart';

import '../widgets/on boarding/indicator.dart';

List<Widget> buildIndicators() {
  List<Widget> list = [];

  for (int i = 0; i < 4; i++) {
    list.add(
      i == 1 ? const Indicator(isActive: true) : const Indicator(isActive: false),
    );
  }

  return list;
}
