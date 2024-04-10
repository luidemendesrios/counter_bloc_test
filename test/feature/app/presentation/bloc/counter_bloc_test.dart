import 'package:bloc_test/bloc_test.dart';//Uma biblioteca que fornece recursos para testar BLoC (Business Logic Components) no Flutter.
import 'package:counter_bloc_test/feature/app/data/models/counter_model.dart';//O modelo de dados do contador que não é mostrado no código.
import 'package:counter_bloc_test/feature/app/presentation/bloc/counter_bloc.dart';//O BLoC do contador que está sendo testado.
import 'package:counter_bloc_test/feature/app/presentation/bloc/counter_state.dart';//O estado do contador que está sendo testado.
import 'package:flutter_test/flutter_test.dart';//A biblioteca de testes do Flutter.

void main() {
  group('CounterBloc', () { //1
    const mockCounter = Counter();

    setUp(() {});

    CounterBloc buildBloc(){ //2
      return CounterBloc();
    }

    group('Constructor', () { //3
      test('works properls', () {
        expect(buildBloc, returnsNormally);
      });
      test('has correct initial state', () {
        expect(buildBloc().state, 
        equals(const CounterState(),
        ),
        );
      });
    });

    group('CounterStarted', () { //4
      blocTest(
        'emits [success] when is loaded for the successfully for the first time ',
       build: ()=> CounterBloc(),
       act: (bloc) => bloc.add(CounterStarted()),
       expect: () => [const CounterState(
        counter: mockCounter,
        status: CounterStatus.success,
       ),
       ],
      );
      blocTest(
        'emits [] when counter is loaded again ',
       build: () => CounterBloc(),
       seed: () => const CounterState(
        counter: mockCounter,
        status: CounterStatus.success,
       ),
       act: (bloc) => bloc.add(CounterStarted()),
       expect: () => [],
      );
    });

    group('CounterIncrementPressed', () { //5
      blocTest('emits [CounterState] when the user taps the increment button', 
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(CounterIncrementPressed()),
      expect: () => [
        const CounterState(
          counter: Counter(value: 1),
          status: CounterStatus.success,
        ),
      ],
      );
      blocTest(
        'emits [CounterState] when the user taps the increment button twice, emits new states, increases the the value by 2', 
      build: () => CounterBloc(),
      act: (bloc) => bloc
      ..add(CounterIncrementPressed())
      ..add(CounterIncrementPressed()),
      expect: () => [
        const CounterState(
          counter: Counter(value: 1),
          status: CounterStatus.success,
        ),
        const CounterState(
          counter: Counter(value: 2),
          status: CounterStatus.success,
        ),
      ],
      );
     blocTest(
        'emits [CounterState] when the user taps the increment button twice, increases the the value by 2', 
      build: () => CounterBloc(),
      act: (bloc) => bloc
      ..add(CounterIncrementPressed())
      ..add(CounterIncrementPressed()),
      skip: 1,
      expect: () => [
        
        const CounterState(
          counter: Counter(value: 2),
          status: CounterStatus.success,
        ),
      ],
      );
    }); 

    group('CounterDecrementPressed', () { //6
       blocTest('emits [CounterState] when the user taps the decrement button', 
      build: () => CounterBloc(),
      act: (bloc) => bloc.add(CounterDecrementPressed()),
      expect: () => [
        const CounterState(
          counter: Counter(value: -1),
          status: CounterStatus.success,
        ),
      ],
      );

      blocTest(
        'emits [CounterState] when user double taps decrement button, emits new states, changing value by -2', 
      build: () => CounterBloc(),
      act: (bloc) => bloc
      ..add(CounterDecrementPressed())
      ..add(CounterDecrementPressed()),
      expect: () => [
        const CounterState(
          counter: Counter(value: -1),
          status: CounterStatus.success,
        ),
        const CounterState(
          counter: Counter(value: -2),
          status: CounterStatus.success,
        ),
      ],
      );
    }); 

  });
}

/**
 * Obs:
 * 
 * 1-A função 'main' define um grupo de testes chamado 'CounterBloc'.
 *  Dentro deste grupo, são definidos vários subgrupos de testes para cada evento do 'CounterBloc'.
 * 
 * 2-Este método é usado para construir uma instância do 'CounterBloc' que será usada nos testes.
 * 
 * 3-Neste subgrupo, são definidos dois testes para o construtor do 'CounterBloc'. 
 * O primeiro teste verifica se a construção do 'CounterBloc' é bem-sucedida ('returnsNormally').
 *  O segundo teste verifica se o estado inicial do 'CounterBloc' 
 * é o esperado ('CounterState()' com um contador 'Counter' e um status 'CounterStatus.initial').
 * 
 * 4-Este subgrupo contém testes para o evento 'CounterStarted'. Os testes verificam se,
 *  quando 'CounterStarted' é adicionado ao 'CounterBloc', o estado do contador é atualizado
 *  para 'CounterStatus.success' e se, após o contador ser inicializado com sucesso,
 *  adicionar 'CounterStarted' novamente não emite nenhum novo estado.
 * 
 * 5-Este subgrupo contém testes para o evento 'CounterIncrementPressed'.
 *  Os testes verificam se, quando 'CounterIncrementPressed' é adicionado ao
 *  'CounterBloc', o estado do contador é atualizado para refletir o valor 
 * incrementado e se, ao incrementar duas vezes, o estado do contador é 
 * atualizado duas vezes, aumentando o valor por 2.
 * 
 * 6-Este subgrupo contém testes para o evento 'CounterDecrementPressed'.
 *  Os testes verificam se, quando 'CounterDecrementPressed' é adicionado 
 * ao 'CounterBloc', o estado do contador é atualizado para refletir o valor
 *  decrementado e se, ao decrementar duas vezes, o estado do contador é atualizado
 *  duas vezes, diminuindo o valor por -2
 * 
 * Cada um dos grupos de testes 'CounterStarted', 'CounterIncrementPressed' e 'CounterDecrementPressed'
 *  usa a biblioteca 'bloc_test' para definir um ou mais testes que verificam o comportamento esperado 
 * do 'CounterBloc' em resposta aos eventos correspondentes.

Os métodos 'act' são usados para simular a adição de eventos ao 'CounterBloc'. 
O método 'expect' é usado para especificar o resultado esperado, como a emissão 
de um estado atualizado do 'CounterState'. O método 'skip' é usado para pular a 
execução de um teste específico, o que pode ser útil para testes que levam muito 
tempo para executar ou para testes que são considerados menos importantes.

Este código de teste é uma parte importante do desenvolvimento de uma aplicação Flutter,
 pois garante que o comportamento do 'CounterBloc' esteja corretamente implementado e 
 funcionando conforme esperado antes de ser usado na aplicação completa.
 */