void main() {
  try {
    function();
  } catch (e) {
    // 'e' é uma instância da exceção lançada.
    print(e.runtimeType); // FormatException
  }

  try {
    function();
  } catch (exception, stackTrace) {
    print(exception);
    print(stackTrace); // Escreve o rastro da pilha de execução.

    rethrow; // Lança novamente a exceção para ser tratada pela função seguinte.
  } finally {
    print('Sempre será executado.');
    // Independentemente se uma exceção for capturada.
  }
}

void function() {
  print('Started Function');

  for (int i = 1; i <= 5; i++) {
    print(i);

    double amount = double.parse('25,55'); // Exceção lançada.
  }

  print('Finished Function');
}
