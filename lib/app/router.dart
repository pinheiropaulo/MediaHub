import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:media_hub/core/features/auth/presentation/login_view.dart';
import 'package:media_hub/core/features/home/presentation/home_view.dart';

class AuthController extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }

  void login() => state = true;
  void logout() => state = false;
}

final authStateProvider = NotifierProvider<AuthController, bool>(() {
  return AuthController();
});

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final isAuthenticated = ref.watch(authStateProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/login',

    redirect: (context, state) {
      final isGoingToLogin = state.matchedLocation == '/login';

      if (!isAuthenticated && !isGoingToLogin) {
        return '/login';
      }

      if (isAuthenticated && isGoingToLogin) {
        return '/';
      }

      return null;
    },

    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginView()),
      GoRoute(path: '/', builder: (context, state) => const HomeView()),
    ],
  );
});
