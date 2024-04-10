import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Bloc e Test'),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if(state.status == CounterStatus.initial ||
             state.status == CounterStatus.loading) {
              return const CircularProgressIndicator();
            }
            if(state.status == CounterStatus.success) {
              return Text("The counter value is: ${state.counter.value}");
            }else{
              return const Text('Something went wrong');
            }
            
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'counter_add',
            onPressed: (){
              context.read<CounterBloc>().add(
                CounterIncrementPressed(),
              );
          },
          child: const Icon(Icons.add),
          ),

          const SizedBox(height: 10,),

          FloatingActionButton(
            heroTag: 'counter_remove',
            onPressed: (){
              context.read<CounterBloc>().add(
                CounterDecrementPressed(),
              );
          },
          child: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
/**Obs:
 * 
 * Este arquivo contém a tela principal da aplicação.
CounterScreen é um StatefulWidget que exibe o contador e os botões para incrementar e decrementar.
No método build(), o CounterScreen usa BlocBuilder para reconstruir automaticamente a interface 
sempre que o estado do CounterBloc muda.
O estado atual do CounterBloc é passado para o BlocBuilder, que renderiza a interface de acordo com o estado.
Se o estado for initial ou loading, exibe um CircularProgressIndicator.
Se o estado for success, exibe o valor atual do contador.
Se o estado for diferente desses, exibe uma mensagem de erro.
Os botões de incrementar e decrementar disparam eventos para o CounterBloc quando pressionados.
Este é um exemplo simples de como usar o Bloc para gerenciar o estado em uma aplicação Flutter. 
O Bloc fornece uma maneira organizada e reativa de gerenciar o estado da aplicação, 
facilitando a separação de preocupações e tornando o código mais fácil de entender e manter.


Este arquivo contém a tela principal da aplicação.
CounterScreen é um StatefulWidget que exibe o contador e os botões para incrementar e decrementar.
No método build(), o CounterScreen usa BlocBuilder para reconstruir automaticamente a interface 
sempre que o estado do CounterBloc muda.
O estado atual do CounterBloc é passado para o BlocBuilder, que renderiza a interface de acordo com o estado.
Se o estado for initial ou loading, exibe um CircularProgressIndicator.
Se o estado for success, exibe o valor atual do contador.
Se o estado for diferente desses, exibe uma mensagem de erro.
Os botões de incrementar e decrementar disparam eventos para o CounterBloc quando pressionados.
Este é um exemplo simples de como usar o Bloc para gerenciar o estado em uma aplicação Flutter. 
O Bloc fornece uma maneira organizada e reativa de gerenciar o estado da aplicação,
 facilitando a separação de preocupações e tornando o código mais fácil de entender e manter.

 */