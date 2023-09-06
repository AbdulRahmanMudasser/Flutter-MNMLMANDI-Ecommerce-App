import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 7,
      width: isActive ? 30 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.orange.shade700 : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
