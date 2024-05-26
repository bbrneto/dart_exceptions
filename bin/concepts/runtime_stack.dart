// Pilha de Execução indica a ordena em que as funções serão executadas.
// Quando vazia, indica que não existe mais nada a ser executado.

// Debug (Depurar): execução com breakpoints (Modo de Depuração).
// Permite uma análise linha a linha do código.
// Step Over: F8
// Step Into: F7
void main() {
  print('Started main');

  functionOne();

  print('Finished main');
}

void functionOne() {
  print('Started F1');

  functionTwo();

  print('Finished F1');
}

void functionTwo() {
  print('Started F2');

  for (int i = 1; i <= 5; i++) {
    print(i);
  }

  print('Finished F2');
}
