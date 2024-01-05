import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:poynt_hackathon/feature/Products/presentation/pages/home_screen.dart';
import 'package:poynt_hackathon/feature/checkout/cart/cart_screen.dart';

final appRouter = GoRouter(
  debugLogDiagnostics: kDebugMode,
  routes: [
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: CartScreen.routeName,
      builder: (context, state) => CartScreen(),
    )
  ],
);
