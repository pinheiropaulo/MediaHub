import 'package:flutter/material.dart';
import 'package:media_hub/core/features/auth/presentation/login_mobile_layout.dart';
import 'package:media_hub/core/features/auth/presentation/login_web_layout.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 800) {
            return const LoginWebLayout();
          }

          return const LoginMobileLayout();
        },
      ),
    );
  }
}
