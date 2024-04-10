import 'package:counter_bloc_test/feature/app/data/models/counter_model.dart';
import 'package:counter_bloc_test/feature/app/presentation/bloc/counter_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterState', () { //1
    const mockCounter = Counter();
    
    group('CounterState, initial', () { 
      const mockStatus = CounterStatus.initial;

      CounterState createSubject(){
        return const CounterState(
          counter: mockCounter,
          status: mockStatus,
        );
      }

      test('supports value equality', () {//2
        expect(createSubject(),
         equals(createSubject()));
      });

        test('props are correct', () {//3
        expect(createSubject().props,
         equals(<Object?>[mockCounter,
         mockStatus]));
      });

      test('returns object with updated status', (){//4
        expect(
          createSubject().copyWith(
          status: CounterStatus.success,
        ),  const CounterState(
          counter: mockCounter,
          status: CounterStatus.success,
        ),
        );
      });

       test('returns a valid [CounterState] with CounterState.fromJson', (){//5
        final Map<String, dynamic> json = {
          'counter': {'value':0},
          'status': 'initial'
        };
        final state = CounterState.fromJson(json);
        expect(
          state,
          createSubject(),
         );
      });

      test('returs a Map with CounterState.toJson', () {//6
        Map<String, dynamic> json = createSubject().toJson();
        expect(json, 
        {
          'counter': {'value': 0},
          'status': 'initial'
        },
        );
      });
    });
    
  });
}
/**
 * Obs:A função 'main' define um grupo de testes chamado 'CounterState'.
 *  Dentro deste grupo, são definidos subgrupos de testes para verificar 
 * diferentes aspectos do 'CounterState'.
 * 
 * 1- Este subgrupo contém testes para o estado inicial do 'CounterState'.
 * Este método é usado para criar uma instância do 'CounterState` que será
 *  usada nos testes. Ele usa um 'Counter' mock e um 'CounterStatus' mock para criar o estado.
 * 
 * 2-Este teste verifica se duas instâncias do 'CounterState' com os mesmos 'props' 
 * são consideradas iguais. Isso é importante para garantir que o estado do contador 
 * seja imutável e que mudanças no estado resultem na criação de uma nova instância.
 * 
 * 3-Este teste verifica se os 'props' do 'CounterState' contêm o 'Counter' 
 * mock e o 'CounterStatus' mock corretamente.
 * 
 * 4-Este teste verifica se o método 'copyWith'
 *  do 'CounterState' retorna um novo objeto com o status atualizado para 'CounterStatus.success'.
 * 
 * 5-Este teste verifica se o construtor 'fromJson' do 'CounterState' cria 
 * um 'CounterState' válido a partir de um JSON fornecido. Ele usa um JSON com um valor
 *  de contador e um status inicial e verifica se o estado resultante é igual ao 'CounterState' inicial.
 * 
 * 6-Este teste verifica se o método 'toJson' do 'CounterState' retorna 
 * um mapa JSON que representa corretamente o estado do contador com um valor de contador e um status inicial.
 * 
 * Esses testes garantem que o 'CounterState' seja corretamente inicializado, possua os 'props' 
 * corretos, suporte a igualdade de valor, possa ser copiado com um status atualizado,
 *  possa ser criado a partir de um JSON e possa ser convertido para um JSON.
 *  Isso é crucial para garantir que o estado do contador seja manipulado de maneira 
 * consistente e previsível dentro do 'CounterBloc'.
 * 
 * Cada um dos testes acima usa a biblioteca 'flutter_test' para verificar 
 * aspectos específicos do 'CounterState'. O método 'expect' é usado para 
 * especificar a condição que deve ser atendida pelo teste. No caso do 
 * teste 'props are correct', por exemplo, 'expect' verifica se a lista 
 * de 'props' do 'CounterState' contém exatamente o 'Counter' mock e o 'CounterStatus' 
 * mock que foram passados para a criação do estado.

O teste 'returns a valid [CounterState] with CounterState.fromJson' 
verifica se o método 'fromJson' pode converter um mapa JSON em um 'CounterState' válido.
 Este teste é importante para garantir que a deserialização de dados de fora do 
 Flutter (como de uma API web) seja feita corretamente.

O teste 'returs a Map with CounterState.toJson', por sua vez, 
verifica se o método 'toJson' pode converter um 'CounterState' em um mapa JSON.
 Isso é útil para a serialização de dados para envio a outras partes do app,
  para persistência em um banco de dados ou para envio para outro sistema.

Esses testes são essenciais para garantir que o 'CounterState' 
funcione conforme esperado e que qualquer mudança no estado seja representada 
de maneira consistente tanto em termos de dados quanto de comportamento. 
Isso ajuda a prevenir bugs e a manter a aplicação robusta e confiável.

Em resumo, os testes para o 'CounterState' garantem que:
- O estado inicial seja corretamente configurado.
- O estado possa ser copiado e ter seu status atualizado.
- O estado possa ser criado a partir de um JSON.
- O estado possa ser convertido para um JSON.

Todos esses pontos são fundamentais para a interação do 'CounterState' com outros 
componentes da aplicação, como a UI e serviços de dados.
 */


