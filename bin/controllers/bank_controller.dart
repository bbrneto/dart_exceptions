import '../exceptions/bank_controller_exceptions.dart';
import '../models/account.dart';

class BankController {
  final Map<String, Account> _database = {};

  addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  bool makeTransfer({
    required String idSender,
    required String idReceiver,
    required double amount,
  }) {
    // Verificar se ID de remetente é válido
    if (!verifyId(idSender)) {
      // return false;
      throw SenderIdInvalidException(idSender: idSender); // Lança exceção
    }

    // Verificar se ID de destinatário é válido
    if (!verifyId(idReceiver)) {
      // return false;
      throw ReceiverIdInvalidException(idReceiver: idReceiver); // Lança exceção
    }

    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Verificar se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      // return false;
      throw SenderNotAuthenticatedException(idSender: idSender); // Lança exceção
    }

    // Verificar se o destinatário está autenticado
    if (!accountReceiver.isAuthenticated) {
      // return false;
      throw ReceiverNotAuthenticatedException(idReceiver: idReceiver); // Lança exceção
    }

    // Verificar se o remetente possui saldo suficiente
    if (accountSender.balance < amount) {
      // return false;
      throw SenderBalanceLowerThanAmountException(
        idSender: idSender,
        senderBalance: accountSender.balance,
        amount: amount,
      ); // Lança exceção
    }

    // Se tudo estiver certo, efetivar transação
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}
