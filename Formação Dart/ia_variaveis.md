# Uso da Palavra-chave `late` em Dart

A palavra-chave `late` em Dart permite adiar a inicialização de variáveis, garantindo que sejam atribuídas antes do acesso. Isso é útil para evitar inicializações desnecessárias e melhorar o desempenho.

## 📌 Exemplos de Uso

### 1️⃣ **Inicialização tardia de variáveis não-nullable**
Sem `late`, uma variável não-nullable precisa ser inicializada imediatamente:

```dart
class Pessoa {
  String nome;
  
  Pessoa(this.nome);
}

void main() {
  var pessoa = Pessoa("João");
  print(pessoa.nome); // João
}
```

Com `late`, a inicialização pode ser adiada:

```dart
class Pessoa {
  late String nome;
}

void main() {
  var pessoa = Pessoa();
  pessoa.nome = "João";
  print(pessoa.nome); // João
}
```

---

### 2️⃣ **Otimização de desempenho**
Com `late`, um cálculo ou carregamento pesado só ocorre quando necessário:

```dart
class Usuario {
  late String email = carregarEmail();

  String carregarEmail() {
    print("Carregando email do banco de dados...");
    return "usuario@email.com";
  }
}

void main() {
  var usuario = Usuario();
  print("Objeto criado!"); // O email ainda não foi carregado
  print(usuario.email); // Agora o email é carregado
}
```

---

### 3️⃣ **Uso com `final` para inicialização única**
`late final` permite que a variável seja atribuída apenas uma vez:

```dart
class Configuracao {
  late final String apiUrl;

  void configurar(String url) {
    apiUrl = url; // Só pode ser atribuída uma vez
  }
}

void main() {
  var config = Configuracao();
  config.configurar("https://meuapp.com/api");
  print(config.apiUrl); // https://meuapp.com/api
}
```

Se tentarmos atribuir `apiUrl` novamente, ocorrerá um erro.

---

## 🔹 **Quando Usar `late`?**
✅ Para garantir inicialização antes do uso, sem valor padrão imediato.  
✅ Para evitar cálculos ou carregamentos desnecessários.  
✅ Para usar `final` com inicialização adiada.

🚨 **Evite `late` se a variável puder ser acessada antes de ser inicializada. Isso pode causar exceções em tempo de execução.**
