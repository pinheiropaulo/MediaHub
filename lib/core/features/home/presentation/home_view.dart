import 'package:flutter/material.dart';
import 'package:media_hub/core/features/home/presentation/home_mobile_layout.dart';
import 'package:media_hub/core/features/home/presentation/home_web_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 800) {
          return const HomeWebLayout();
        }

        return const HomeMobileLayout();
      },
    );
  }
}
