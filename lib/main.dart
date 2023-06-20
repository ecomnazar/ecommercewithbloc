import 'package:finalapp/api/get_api.dart';
import 'package:finalapp/bloc/api/bloc/get_api_bloc.dart';
import 'package:finalapp/bloc/bottom_nav_bar_bloc/bloc/bottom_nav_bar_bloc.dart';
import 'package:finalapp/bloc/cart_bloc/bloc/cart_bloc_bloc.dart';
import 'package:finalapp/pages/bottom_nav_bar.dart';
import 'package:finalapp/pages/bottom_nav_bar_pages/shop_screen.dart';
import 'package:finalapp/pages/intro_screen.dart';
import 'package:finalapp/pages/one_product_screen.dart';
import 'package:finalapp/pages/splash_screen.dart';
import 'package:finalapp/static/static_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarBloc(),
        ),
        BlocProvider(
          create: (context) => GetApiBloc()..add(GetAllProducts()),
        ),
        BlocProvider(
          create: (context) => CartBlocBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Pallete.mainColor),
            useMaterial3: true,
          ),
          home: SplashScreen()),
    );
  }
}
