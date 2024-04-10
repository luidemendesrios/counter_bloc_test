import 'package:counter_bloc_test/feature/app/presentation/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'feature/app/presentation/pages/counter_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc test',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc()
        ..add(
          CounterStarted(),
        ),
        child: const CounterScreen(),
      ),
    );
  }
}
/*Obs: 
BlocProvider que fornece uma instância do CounterBloc para a aplicação.
 Ele é inicializado com o evento CounterStarted.
O BlocProvider envolve a tela CounterScreen.
 */ 