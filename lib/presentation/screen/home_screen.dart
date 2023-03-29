import 'package:bloc_counter/constants/enums.dart';
import 'package:bloc_counter/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/counter_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.title,
    required this.color,
  });

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          context.read<CounterCubit>().increment();
          // return const Text('Wifi');
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobileData) {
          context.read<CounterCubit>().decrement();
          // return const Text('Mobile Data');
        } else if (state is InternetDisonnected) {
          // return const Text('Disconnected');
        }
        // return const CircularProgressIndicator();
      },
      child: Scaffold(
        appBar: AppBar(
          // foregroundColor: widget.color,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return const Text('Wifi');
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.mobileData) {
                  return const Text('Mobile Data');
                } else if (state is InternetDisonnected) {
                  return const Text('Disconnected');
                }
                return const CircularProgressIndicator();
              }),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.isIncremented) {
                    const snackbar = SnackBar(
                      content: Text('Hurrayyy'),
                      duration: Duration(milliseconds: 300),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }
                },
                builder: (context, state) {
                  print(state.counterValue);
                  return Text(
                    // '$_counter',
                    '${state.counterValue}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                },
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     FloatingActionButton(
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).increment();
              //         // context.bloc<CounterCubit>().increment();
              //       },
              //       tooltip: 'Increment',
              //       child: const Icon(Icons.add),
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     FloatingActionButton(
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //       },
              //       tooltip: 'Decrement',
              //       child: const Icon(Icons.remove),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                  // MaterialPageRoute(
                  //     builder: (_) => BlocProvider.value(
                  //           value: BlocProvider.of<CounterCubit>(context),
                  //           child: const SecondScreen(
                  //               title: 'Seond Screen', color: Colors.purple),
                  //         ));
                },
                color: Colors.yellow,
                child: const Text('Go to Second Screen'),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                  // MaterialPageRoute(
                  //     builder: (_) => BlocProvider.value(
                  //           value: BlocProvider.of<CounterCubit>(context),
                  //           child: const SecondScreen(
                  //               title: 'Seond Screen', color: Colors.purple),
                  //         ));
                },
                color: Colors.orange,
                child: const Text('Go to Third Screen'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
