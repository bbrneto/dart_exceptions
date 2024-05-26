// Diferente de outras linguagens, o Dart não dá a opção de criar exceções com checagem obrigatória (Checked Exceptions).

// Exceções Checadas são exceções que, ao serem lançadas por uma função, exigem que o bloco de código que usar essa função
// deverá necessariamente implementar um try circundando a linha de chamada da função ou acontecerá um erro em tempo de compilação.

class SenderIdInvalidException implements Exception {
  static const String report = "SenderIdInvalidException";

  String idSender;

  SenderIdInvalidException({required this.idSender});

  @override
  String toString() {
    return "$report\nID Sender: $idSender";
  }
}

class ReceiverIdInvalidException implements Exception {
  static const String report = "ReceiverIdInvalidException";

  String idReceiver;

  ReceiverIdInvalidException({required this.idReceiver});

  @override
  String toString() {
    return "$report\nID Receiver: $idReceiver";
  }
}

class SenderNotAuthenticatedException implements Exception {
  static const String report = "SenderNotAuthenticatedException";

  String idSender;

  SenderNotAuthenticatedException({required this.idSender});

  @override
  String toString() {
    return "$report\nID Sender: $idSender";
  }
}

class ReceiverNotAuthenticatedException implements Exception {
  static const String report = "ReceiverNotAuthenticatedException";

  String idReceiver;

  ReceiverNotAuthenticatedException({required this.idReceiver});

  @override
  String toString() {
    return "$report\nID Receiver: $idReceiver";
  }
}

class SenderBalanceLowerThanAmountException implements Exception {
  static const String report = "SenderBalanceLowerThanAmountException";

  String idSender;
  double senderBalance;
  double amount;

  SenderBalanceLowerThanAmountException({
    required this.idSender,
    required this.senderBalance,
    required this.amount,
  });

  @override
  String toString() {
    return "$report\nID Sender: $idSender\nSender balance: $senderBalance\nAmount: $amount";
  }
}
