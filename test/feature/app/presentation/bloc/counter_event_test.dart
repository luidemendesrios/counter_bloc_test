import 'package:counter_bloc_test/feature/app/presentation/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterEvent', () { //1
    group('CounterStarted', () {
      test('Supports value equality', () {
        expect(CounterStarted(),
         CounterStarted()
         );
      });

      test('props are correct', () { //1
        expect(CounterStarted().props,
        equals(<Object?>[]),
        );
      });
     });

    group('CounterIncrementPressed', () { //2
      test('Supports value equality', () {
        expect(
          CounterIncrementPressed(),
          CounterIncrementPressed()
          );
      });
    });

    group('CounterDecrementPressed', () { //3
      test('Supports value equality', () {
        expect(
          CounterDecrementPressed(),
          CounterDecrementPressed()
          );
      });
    });
  });
}

/**
 * Obs: 
 * 
 * 1-A função 'main' define um grupo de testes chamado 'CounterEvent'.
 *  Dentro deste grupo, são definidos subgrupos de testes para cada evento do 'CounterBloc'.
 * 
 * Neste subgrupo, são definidos dois testes para o evento 'CounterStarted'.
 *  O primeiro teste verifica se duas instâncias do evento 'CounterStarted' 
 * são consideradas iguais, o que é esperado para eventos que não possuem 'props'.
 *  O segundo teste verifica se a lista de 'props' do evento 'CounterStarted' é 
 * realmente uma lista vazia, conforme definido no código do 'CounterEvent'.
 * 
 * 2-Este subgrupo contém um teste para o evento 'CounterIncrementPressed'.
 *  O teste verifica se duas instâncias do evento 'CounterIncrementPressed' 
 * são consideradas iguais, o que é esperado para eventos que não possuem 'props'.
 * 
 * 3-Este subgrupo contém um teste para o evento 'CounterDecrementPressed`. 
 * O teste verifica se duas instâncias do evento 'CounterDecrementPressed` são
 *  consideradas iguais, o que é esperado para eventos que não possuem 'props`.
 * 
 * Em todos os testes, o método 'expect' é usado para verificar se as condições são atendidas.
 *  O método 'equals' é usado para verificar se duas listas são iguais, o que é esperado quando 
 * os 'props' são uma lista vazia.

Este código de teste é uma parte importante do desenvolvimento de uma aplicação Flutter,
 pois garante que os eventos do 'CounterBloc' estejam corretamente implementados e que 
 instâncias do mesmo evento sejam consideradas iguais, o que é essencial para o funcionamento
  adequado do sistema de eventos do BLoC.


 */