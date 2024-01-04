import 'package:flutter/material.dart';
import 'package:poynt_hackathon/feature/Products/presentation/pages/home_screen.dart';
import 'package:poynt_hackathon/feature/checkout/cart/cart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CartScreen(),
    );
  }
}
