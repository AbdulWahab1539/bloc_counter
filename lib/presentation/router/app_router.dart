import 'dart:developer';

import 'package:bloc_counter/presentation/screen/home_screen.dart';
import 'package:bloc_counter/presentation/screen/second_screen.dart';
import 'package:bloc_counter/presentation/screen/thrid_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) =>
                const HomeScreen(title: 'HomeScreen', color: Colors.blue));

      case '/second':
        return MaterialPageRoute(
            builder: (_) =>
                const SecondScreen(title: 'SecondScreen', color: Colors.red));

      case '/third':
        return MaterialPageRoute(
            builder: (_) =>
                const ThirdScreen(title: 'ThirdScreen', color: Colors.yellow));
      default:
        return null;
    }
  }

  // void dispose() {
  //   _counterCubit.close();
  // }
}
