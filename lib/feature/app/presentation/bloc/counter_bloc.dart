import 'package:bloc/bloc.dart';
import 'package:counter_bloc_test/feature/app/data/models/counter_model.dart';
import 'package:equatable/equatable.dart';

import 'counter_state.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> { //1
  CounterBloc() : super(const CounterState()){ //2
    on<CounterStarted>(_onStarted); //4
    on<CounterIncrementPressed>(_onIncrementPressed); //4
    on<CounterDecrementPressed>(_onDecrementPressed); //4
  }

  void _onStarted( //3
    CounterStarted event,
    Emitter<CounterState> emit,
  ){
    if (state.status == CounterStatus.success) return;
    Counter counter = const Counter();
    emit(
      CounterState(counter: counter,
      status: CounterStatus.success
      ),
    );
  }

  void _onIncrementPressed( //3
    CounterIncrementPressed event,
    Emitter<CounterState> emit,
  ){
    int value = state.counter.value + 1;
    Counter counter = state.counter.copyWith(value: value);
    emit(
      CounterState(
        counter: counter,
        status: CounterStatus.success,
      ),
    );
  }

  void _onDecrementPressed( //3
    CounterDecrementPressed event,
    Emitter<CounterState> emit,
  ){
    int value = state.counter.value - 1;
    Counter counter = state.counter.copyWith(value: value);
    emit(
      CounterState(
        counter: counter,
        status: CounterStatus.success,
      ),
    );
  }
}

/**
 * Obs:
 * 1-Esta é a definição da classe CounterBloc, que estende a classe Bloc.
 *  Ela é parametrizada pelos tipos CounterEvent (os eventos que podem ser despachados para o bloc)
 *  e CounterState (os estados que o bloc pode emitir).
 * 
 * 2-Este é o construtor da classe CounterBloc.
 *  Ele chama o construtor da classe pai (Bloc) e inicializa o estado inicial com CounterState().
 * 
 * 3-Estes são métodos privados que são chamados quando os eventos correspondentes são despachados para o bloc.
 *  Eles são responsáveis por atualizar o estado do bloc de acordo com a lógica de negócios da aplicação.
 * 
 * 4-Este método é usado para associar um evento a um manipulador de eventos (função).
 *  Ele é usado para definir qual função será chamada quando um evento específico for despachado para o bloc.
    No geral, a classe CounterBloc é responsável por gerenciar o estado do contador e responder a
    eventos relacionados ao aumento e diminuição do contador.
    Ela usa o padrão de design Bloc para garantir uma separação clara entre a lógica de negócios
   e a interface do usuário.
 */