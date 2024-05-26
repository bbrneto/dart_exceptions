class Account {
  String name; // Atributo obrigatório
  double balance;
  bool isAuthenticated;
  DateTime? createdAt; // Atributo opcional (Inicializa com null)

  Account({
    required this.name,
    required this.balance,
    required this.isAuthenticated,
    this.createdAt,
  })  : assert(name.isNotEmpty, 'O nome não pode estar vazio.'),
        assert(balance >= 0, 'O saldo não pode ser negativo.');

  editBalance({required value}) {
    balance = balance + value;
  }
}
