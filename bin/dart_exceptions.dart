import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

// Caminho feliz: quando tudo dá certo!

// Exceções: situações excepcionais que podem ser previstas. Portanto, devem ser tratadas.
// Fazem parte do fluxo esperado no nosso modelo de negócios.
// Exemplo: FormatException, TimeoutException, IOException etc

// Erros: situações que não deveriam ter acontecido.
// Não fazem parte do fluxo esperado no nosso modelo de negócios.
// Exemplo: StackOverflowError, OutOfMemoryError, TypeError etc
void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
    id: "Ricarth",
    account: Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true),
  );

  bankController.addAccount(
    id: "Kako",
    account: Account(name: "Caio Couto", balance: 600, isAuthenticated: true),
  );

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
      idSender: "Kako",
      idReceiver: "Ricarth",
      amount: 700,
    );

    if (result) {
      print('Transação concluída com sucesso!');
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O ID '${e.idSender}' do rementente não é um ID válido.");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O ID '${e.idReceiver}' do destinatário não é um ID válido.");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O remetente '${e.idSender}' não está autenticado.");
  } on ReceiverNotAuthenticatedException catch (e) {
    print(e);
    print("O destinatário '${e.idReceiver}' não está autenticado.");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print("O remetente '${e.idSender}' tentou enviar ${e.amount}, mas possui apenas ${e.senderBalance}.");
  } on Exception {
    print('Algo deu errado!');
  }
}
