// No Dart, Null é um tipo! Ele representa a ausência de valor e pertence ao pacote dart.core!
// A classe Null não pode ser instanciada.
import 'dart:math';

import '../models/account.dart';

void main() {
  print('String'.runtimeType);
  print(null.runtimeType);

  String naoPodeSerNulo = 'Não pode ser nulo!'; // Aceita apenas valores não nulos.
  // naoPodeSerNulo = null; // A value of type 'Null' can't be assigned to a variable of type 'String'.

  String? podeSerNulo = 'Pode ser nulo!'; // Aceita tanto valores nulos quanto não nulos.
  print(podeSerNulo.runtimeType);
  podeSerNulo = null;
  print(podeSerNulo.runtimeType);

  testNullSafety();

  testNullProperty();
}

void testNullSafety() {
  // Se uma variável pode ser nula e não foi inicializada, significa que ela é nula.
  Account? myNullAccount; // Equivalente a "Account? myNullAccount = null";
  // print(myNullAccount.balance);// Não é permitido, pois a variável pode ser nula (NullPointerException)!
  // print(myNullAccount!.balance); // Conversão direta: Null check operator used on a null value
  // Usar o bang "!" é uma má prática e deve ser evitado. Ao usá-lo, o programador assume que a variável não será nula.

  Account? myAccount;

  // Simulando uma comunicação externa que pode ou não preencher myAccount
  Random r = Random();

  if (r.nextInt(10) % 2 == 0) {
    myAccount = Account(name: "Ricarth", balance: 300, isAuthenticated: true);
  }

  print(myAccount.runtimeType); // Pode imprimir Account ou Null.

  // Lidando com Null de forma segura:

  // - Dart Analysis
  if (myAccount != null) {
    print(myAccount.balance);
  } else {
    print('Conta nula.');
  }

  // - Operador ternário
  print(myAccount != null ? myAccount.balance : 'Conta nula.');

  // - Safe call
  print(myAccount?.balance); // Pode imprimir o saldo ou "null"
}

void testNullProperty() {
  Account? myAccount = Account(name: "Ricarth", balance: 300, isAuthenticated: true);

  Random r = Random();

  if (r.nextInt(10) % 2 == 0) {
    myAccount.createdAt = DateTime.now();
  }

  print(myAccount.createdAt); // Pode ser nulo.
  // print(myAccount.createdAt.day); // Não é permitido, pois a variável "createdAt" pode ser nula.
  // print(myAccount.createdAt!.day); // Não é recomendável, pois uma exceção pode ser lançada em execução.

  if (myAccount.createdAt != null) {
    // print(myAccount.createdAt.day);// Não é possível, pois só funciona para variáveis locais!
    print(myAccount.createdAt!.day); // Solução para atributos opcionais.
  }
}
