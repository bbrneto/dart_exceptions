// Assert é útil para testes internos, ou seja, para verificações no código que não comprometam a execução do programa quando publicado.
// Construtores são exemplos de locais para uso dos asserts.
// Assert funciona apenas em ambiente de desenvolvimento. Portanto, é ignorado em produção.

// Para simular o ambiente de produção, vá em "Modify Run Configuration..." e clique em "Enable asserts".
// Significa que a execução continuará sem interrupções, ou seja, AssertionError não será lançada.
import '../models/account.dart';

void main() {
  // assert(2 < 1, 'Falha quando a condição for falsa!');

  Account(name: '', balance: 0, isAuthenticated: true);
}
