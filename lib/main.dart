import 'package:bloc_counter/logic/cubit/counter_cubit.dart';
import 'package:bloc_counter/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'logic/cubit/internet_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

// ? Add Oberserver here
  runApp(MyApp(
    appRoute: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRoute;
  final Connectivity connectivity;

  const MyApp({required this.appRoute, required this.connectivity, super.key});

  // final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return
        // BlocProvider<CounterCubit>(
        //   create: (context) => CounterCubit(),
        //   child:
        MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
          // internetCubit: context.read<InternetCubit>()
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: appRoute.onGenerateRoute,
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
