class ContaBancaria {

  ContaBancaria(this.saldo, this.tirular);

  double saldo;
  String tirular;

  void depositar(double deposito) {
    saldo += deposito;
    print("Realizado deposito de R\$$deposito");
  }
  void sacar(double saque) {
    if(saldo < saque) {
      print("Saldo insuficiente. Saldo disponível R\$$saldo");
      return;
    }
    saldo -= saque;
    print("Realizado saque de R\$$saque");
  }
}

void main() {
  ContaBancaria conta = ContaBancaria(100.0, "John");
  conta.sacar(200);
  conta.depositar(300);

  print("Saldo atual: ${conta.saldo}");
}