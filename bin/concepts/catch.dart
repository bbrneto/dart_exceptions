// Stack trace: rastro da pilha de execução, ou seja, quais funções são chamadas até a ocorrência do bug.
// O modo de depuração interrompe a execução no ponto em que a exceção é lançada.
// Debug: Shift + F9
import 'dart:io';

void main() {
  try {
    function();
  } on FormatException {
    print('Exceção tratada.');

    // Para ser capturada, é necessário um objeto da exceção.
  }

  try {
    function();
  } on FormatException catch (e) {
    // 'e' é uma instância de FormatException.
    print('Exceção capturada.');

    // Cada exception possui seu próprio conjunto de atributos, ou seja, não há padronização.
    print(e.message);
    print(e.source);
    print(e.toString());
  } on HttpException catch (e) {
    // 'e' é uma instância de HttpException.
    print('Exceção específica.');

    // HttpException é um tipo de IOException. Portanto, ela deve vir antes de IOException.
    print(e.message);
    print(e.uri);
    print(e.toString());
  } on IOException catch (e) {
    // 'e' é uma instância de IOException.
    print('Exceção genérica.');

    // Uma exceção genérica não pode vir antes de uma exceção específica.
    print(e.toString());
  } on Exception catch (e) {
    // 'e' é uma instância de Exception.
    print('Exceção encadeada.');

    // Exception é a exceção mais genérica do Dart.
    print(e.toString());
  }
}

void function() {
  print('Started Function');

  for (int i = 1; i <= 5; i++) {
    print(i);

    // try {
    double amount = double.parse('25,55'); // Exceção lançada.
    // } on FormatException {
    //   print('Exceção tratada.');
    // }
  }

  print('Finished Function');
}
