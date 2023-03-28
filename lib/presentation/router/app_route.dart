import 'dart:developer';

import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/screen/home_screen.dart';
import 'package:bloc_counter/presentation/screen/second_screen.dart';
import 'package:bloc_counter/presentation/screen/thrid_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  final CounterCubit _counterCubit = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child:
                      const HomeScreen(title: 'HomeScreen', color: Colors.blue),
                ));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const SecondScreen(
                      title: 'SecondScreen', color: Colors.red),
                ));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: const ThirdScreen(
                      title: 'ThirdScreen', color: Colors.yellow),
                ));
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
