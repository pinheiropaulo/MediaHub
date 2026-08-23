import 'package:flutter/material.dart';

import 'app/theme/app_theme.dart';

void main() {
  runApp(const MyShowsHubApp());
}

class MyShowsHubApp extends StatelessWidget {
  const MyShowsHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyShows Hub',
      theme: AppTheme.dark(),
      home: const Scaffold(body: Center(child: Text('MyShows Hub'))),
    );
  }
}
