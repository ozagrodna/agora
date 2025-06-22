import 'package:flutter/material.dart';
import '../../styles/colors.dart';

class PageContainer extends StatelessWidget {
  final Widget child;

  const PageContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkModeBackground,
      child: Column(
        mainAxisSize: MainAxisSize.max, // makes it flex: 1
        children: [
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}