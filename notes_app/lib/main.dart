import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:recipe_app/screens/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(RecipeApp());
}


class RecipeApp extends StatelessWidget {
  RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
