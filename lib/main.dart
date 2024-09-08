import 'package:flutter/material.dart';
import 'package:store_app/views/edit_product_view.dart';
import 'package:store_app/views/home_view.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeView.id: (context) => const HomeView(),
        EditProductView.id: (context) => const EditProductView(),
      },
      initialRoute: HomeView.id,
    );
  }
}
