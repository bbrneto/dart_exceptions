import '../models/account.dart';

void main() {
  try {
    function();
  } catch (e) {
    print(e.runtimeType);
  }
}

void function() {
  // É possível lançar um objeto de qualquer classe.
  throw Account(name: 'Fulano', balance: 1000, isAuthenticated: true);

  print('Nunca será executado!');
}
