part of 'counter_bloc.dart'; //1

abstract class CounterEvent extends Equatable{//2
  const CounterEvent();

  @override
  List<Object> get props => []; //3
}

class CounterStarted extends //4
CounterEvent {}

class CounterIncrementPressed extends //5
 CounterEvent {}

class CounterDecrementPressed extends //6
 CounterEvent {}

/**
 * Obs:
 * 1- Esta diretiva indica que o conteúdo deste arquivo faz parte do arquivo counter_bloc.dart. 
 * Isso permite dividir a definição do bloc em vários arquivos para facilitar a organização e 
 * manutenção do código.
 * 
 * 2-Aqui, uma classe abstrata chamada 'CounterEvent' é definida.
 *  Esta classe é uma subclasse de 'Equatable', que é uma classe fornecida pelo Flutter que
 *  permite que você compare instâncias de objetos com '==' e 'hashCode'. Isso é útil para o 
 * Bloc (Business Logic Component) do Flutter, que precisa rastrear mudanças e dependências em 
 * diferentes partes do seu aplicativo.
 * 
 * 3-O método 'props' é sobrescrito e retorna uma lista vazia de 'Object'.
 *  Isso é necessário para que o Bloc possa rastrear as mudanças nas propriedades do objeto.
 *  No entanto, como o contador não tem propriedades, a lista está vazia.
 * 
 * 4-Esta linha define uma subclasse chamada 'CounterStarted' que estende a classe 'CounterEvent'.
 *  Essa subclasse é usada para indicar o início do contador - quando a aplicação é inicializada ou
 *  quando o contador é reiniciado.
 * 
 * 5-Esta linha define outra subclasse chamada 'CounterIncrementPressed' que também estende 'CounterEvent'.
 *  Esta classe é usada para indicar que o botão de incremento do contador foi pressionado, fazendo com que 
 * o valor do contador aumente.
 * 
 * 6-Essa linha define mais uma subclasse chamada 'CounterDecrementPressed' que,
 *  como as outras, estende 'CounterEvent'.
 *  Esta classe é usada para indicar que o botão de decremento do contador foi pressionado,
 *  fazendo com que o valor do contador diminua.

Essas classes de evento são usadas para comunicar mudanças no estado do contador dentro do Bloc da aplicação.
 O Bloc irá processar esses eventos e gerenciar o estado do contador em resposta a eles.
 */