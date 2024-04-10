import 'package:equatable/equatable.dart'; //1

class Counter extends Equatable { //2
  final int value; //3

  const Counter({this.value = 0}); //4

  Counter copyWith({int? value}){ //5
    return Counter(value: value ?? this.value);
  }

  Map<String, dynamic> toJson() { //6
    return {'value': value};
  }

  factory Counter.fromJson(Map<String, dynamic> json) { //7
    return Counter(value: json['value']);
  }

  @override
  List<Object?> get props => [value]; //8

}

/**
 * Obs:
 * 1- Esta linha importa o pacote equatable,
 *  que fornece uma maneira simples de implementar o método == e hashCode em classes Dart.
 * 
 * 2- A classe Counter é definida. Ela estende Equatable,
 *  o que significa que ela herda funcionalidades para comparar objetos de forma mais fácil e eficiente.
 * 
 * 3- A classe Counter tem um único atributo value, que representa o valor do contador.
 *  Ele é definido como final, o que significa que seu valor não pode ser alterado após a sua inicialização.
 * 
 * 4-Este é o construtor da classe Counter.
 *  Ele aceita um parâmetro opcional value,
 *  que é atribuído ao atributo value da classe.
 *  Se nenhum valor for fornecido ao criar uma instância de Counter, o valor padrão será 0.
 * 
 * 5-Este é um método utilitário que permite criar uma cópia de uma instância de Counter com um 
 * novo valor para o atributo value.
 *  Se um novo valor for fornecido, ele é usado; caso contrário, o valor existente é mantido.
 * 
 * 6-Este método converte uma instância de Counter em um mapa JSON.
 *  Ele retorna um mapa com a chave "value" e o valor do atributo value da instância.
 * 
 * 7-Este é um construtor de fábrica (factory) que cria uma instância de Counter a partir de um mapa JSON.
 *  Ele recebe um mapa JSON como parâmetro e retorna uma nova instância de Counter com o valor do atributo
 *  value definido com base no valor fornecido no mapa.
 * 
 * 8-Este método é necessário ao usar a classe Equatable.
 *  Ele retorna uma lista de objetos que serão usados para comparar instâncias de Counter.
 *  Neste caso, a lista contém apenas o atributo value, indicando que duas instâncias de Counter
 *  serão consideradas iguais se seus valores value forem iguais.
    Essa é uma visão geral do código da classe Counter, explicando suas principais partes e funcionalidades.
 */