void main() {
  var s1 = Singleton();
  var s2 = Singleton();

  print(identical(s1, s2)); // Verifique se duas referências de objeto são para o mesmo objeto.
  print(s1 == s2); // true
}

// Factory é uma palavra-chave usada para implementar um construtor que nem sempre cria uma instância da classe.
// Por exemplo, um construtor de fábrica pode retornar uma instância de um cache ou pode retornar uma instância de um subtipo.
class Singleton {
  static final Singleton _instance = Singleton._internal();

  factory Singleton() {
    return _instance;
  }

  // Construtor privado.
  Singleton._internal();

  // External é uma palavra chave que gera um função abstrata em uma classe que não necessariamente é abstrata.
  // Basicamente diz que o corpo da função será definido em um local externo.
  external int get hashCode;
}
