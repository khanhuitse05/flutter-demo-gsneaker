import 'package:app/cubit/cart/cart_cubit.dart';
import 'package:app/cubit/products/product_cubit.dart';
import 'package:app/repositories/user_prefs.dart';
import 'package:app/routers/router.dart';
import 'package:flutter/material.dart';
import 'package:app/ui/pages/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await UserPrefs.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ProductCubit()),
        BlocProvider(create: (_) => CartCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: onGenerateRoute,
        home: const HomePage(),
      ),
    );
  }
}
