import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // final CounterCubit _counterCubit = CounterCubit();
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider<CounterCubit>(
        //   create: (context) => CounterCubit(),
        //   child:
        BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: _appRouter.onGenerateRoute,
        // home: BlocProvider(
        //   create: (context) => CounterCubit(),
        //   child: const HomeScreen(title: 'Page 1', color: Colors.pink),
        // ),
        // routes: {
        //   '/': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const HomeScreen(title: 'Home Screen', color: Colors.red),
        //       ),
        //   '/second': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const SecondScreen(
        //             title: 'Second Screen', color: Colors.yellow),
        //       ),
        //   '/third': (context) => BlocProvider.value(
        //         value: _counterCubit,
        //         child: const ThirdScreen(
        //             title: 'Third Screen', color: Colors.orange),
        //       ),
        // },
        // ),
      ),
    );
  }
}
