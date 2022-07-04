import 'package:app/model/shoes.dart';
import 'package:app/routers/routers.dart';
import 'package:app/ui/pages/cart_page.dart';
import 'package:app/ui/pages/home_page.dart';
import 'package:app/ui/pages/product_page.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case XRoutes.home:
      return MaterialPageRoute(
          settings: settings, builder: (_) => const HomePage());
    case XRoutes.product:
      final Shoes item = settings.arguments as Shoes;
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => ProductPage(item),
      );
    case XRoutes.cart:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const CartPage(),
      );
    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const Scaffold(body: Center(child: Text('404'))),
      );
  }
}
