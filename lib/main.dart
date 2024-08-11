import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/counter_bloc/bloc/counter_bloc.dart';
import 'package:myapp/counter_bloc/view/counter_bloc_screen.dart';
import 'package:myapp/counter_cubit/cubit/counter_cubit.dart';
import 'package:myapp/counter_cubit/view/counter_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const CounterBothViews(),
      ),
    );
  }
}

class CounterBothViews extends StatefulWidget {
  const CounterBothViews({super.key});

  @override
  State<CounterBothViews> createState() => _CounterBothViewsState();
}

class _CounterBothViewsState extends State<CounterBothViews> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: const SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 300,
                  child: CounterScreen(title: "Counter Cubit View")),
              SizedBox(
                  height: 300,
                  child: CounterBlocScreen(title: "Counter Bloc View"))
            ],
          ),
        ),
      ),
    );
  }
}
