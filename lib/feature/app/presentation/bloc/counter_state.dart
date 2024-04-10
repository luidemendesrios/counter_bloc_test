import 'package:equatable/equatable.dart'; //biblioteca que fornece meios para comparar objetos e implementar uma semântica de equivalência.
import '../../data/models/counter_model.dart'; //um modelo que representa o estado do contador na sua aplicação.

enum CounterStatus {initial, loading, success, error} //1

class CounterState extends Equatable { //2
  final Counter counter;
  final CounterStatus status;

  const CounterState({
    this.counter = const Counter(),
    this.status = CounterStatus.initial,
  }); //2

  CounterState copyWith({ //3
    Counter? counter,
    CounterStatus? status,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
      status: status ?? this.status,
    );
  } //3

  factory CounterState.fromJson(Map<String, dynamic> json){//4
    return CounterState(
      counter: Counter.fromJson(json['counter']),
      status: CounterStatus.values.firstWhere(
        (element) => element.name.toString() == json['status'],
        ),
    );
  }

 Map<String, dynamic> toJson(){//5
  return {
    'counter': counter.toJson(),
    'status': status.name,
  };
 }

  @override
  List<Object> get props => [counter, status];//6
}

/**
 * Obs:
 * 
 * 1-Este 'enum' é usado para representar o status atual do contador,
 *  com quatro possíveis valores: 'initial', 'loading', 'success' e 'error'.
 * 
 * 2-Aqui, a classe 'CounterState' é definida. 
 * Esta classe representa o estado atual do contador na aplicação. Ela possui dois atributos:
- 'counter': Um objeto do tipo 'Counter' que provavelmente armazena o valor atual do contador.
- 'status': Um 'enum' do tipo 'CounterStatus' que representa o status atual do contador.

  O construtor 'CounterState' inicializa os atributos 'counter' e 'status'. 
  O atributo 'counter' tem um valor padrão de 'Counter()', enquanto o atributo 'status' 
  tem um valor padrão de 'CounterStatus.initial'.

  3-O método 'copyWith' é usado para criar uma cópia do 'CounterState' 
  com os valores fornecidos para 'counter' e 'status'. 
  Isso é útil para atualizar o estado sem alterar o estado original.

  4-O método 'fromJson' é um factory constructor que cria um 'CounterState' 
  a partir de um 'Map' JSON. Ele faz isso instanciando um 'Counter' a partir 
  do JSON fornecido para 'counter' e encontrando o 'CounterStatus' correspondente
   ao valor de 'status' no JSON.

  5-O método 'toJson' retorna um 'Map' que representa o 'CounterState' em formato JSON.
   Ele usa o método 'toJson' do objeto 'counter' para converter o contador em um 'Map' JSON
    e armazena o status atual do contador usando o nome do `enum` `CounterStatus`.
  
  6-Por fim, o método 'props' é sobrescrito para retornar uma lista que contém os atributos
   'counter' e 'status'. Isso é necessário para que o 'Equatable' possa rastrear as mudanças
    no estado do contador.


 */