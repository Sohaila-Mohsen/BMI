import 'package:bmi/blocs/unit/cubit/cubit/unit_cubit.dart';
import 'package:bmi/blocs/value/cubit/value_cubit.dart';
import 'package:bmi/views/home_screen.dart';
import 'package:bmi/views/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ValueCubit(),
        ),
        BlocProvider(
          create: (context) => UnitCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        showSemanticsDebugger: false,
        home: HomeScreen(),
      ),
    );
  }
}
