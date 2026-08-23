import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:media_hub/app/theme/app_theme.dart';
import 'package:media_hub/core/features/home/presentation/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MediaHubApp()));
}

class MediaHubApp extends StatelessWidget {
  const MediaHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MediaHub',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      // home: const LoginView(),
      home: const HomeView(),
    );
  }
}
