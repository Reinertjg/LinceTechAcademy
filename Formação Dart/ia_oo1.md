# Usando IA como apoio – Orientação a Objetos

**Lince Tech Academy**

---

## 1. Quais são os principais conceitos da orientação a objetos?

**Resposta:**

Os principais conceitos são:

- Classe: Estrutura que define o comportamento (métodos) e o estado (atributos) de um objeto.
- Objeto: Instância de uma classe.
- Encapsulamento: Esconde os detalhes internos de uma classe e expõe apenas o necessário.
- Herança: Permite que uma classe herde atributos e métodos de outra.
- Polimorfismo: Permite que métodos com o mesmo nome se comportem de forma diferente em diferentes classes.
- Abstração: Foca apenas nos aspectos essenciais de um objeto, ignorando detalhes desnecessários.

**Observação:**  
Eu já tinha escutado esses termos, mas nunca tinha parado pra entender a fundo. Usar a IA me ajudou a clarear bastante,
principalmente a diferença entre herança e polimorfismo, que eu sempre confundia.

---

## 2. Quais as vantagens de usar orientação a objetos em comparação com outras formas de programação?

**Resposta:**

- Facilita a organização do código;
- Promove a reutilização de código;
- Torna o sistema mais modular e manutenível;
- Permite representar melhor o mundo real com objetos.

**Observação:**  
Achei interessante perceber que OO não é só "jeito de escrever", mas realmente muda como a gente pensa o sistema.
Entendi que ajuda bastante em projetos maiores, principalmente em grupo.

---

## 3. O que é uma 'classe' e como ela se relaciona com 'objetos'?

**Resposta:**

Uma classe é como um molde, e um objeto é uma instância real criada a partir desse molde. Exemplo:

```dart
class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);
}

void main() {
  var p1 = Pessoa('Maria', 25); // p1 é um objeto da classe Pessoa
}
```

**Observação:**  
O exemplo prático com Dart fez tudo fazer sentido. Eu testei no VSCode e ficou muito claro como uma classe vira um
objeto. Ver o código rodando ajuda muito.

---

## 4. O que são 'métodos' e como eles funcionam dentro de uma classe?

**Resposta:**  
Métodos são funções que pertencem a uma classe. Eles definem comportamentos dos objetos. Exemplo:

```dart
class Pessoa {
  String nome;
  int idade;

  Pessoa(this.nome, this.idade);

  void dizerOla() {
    print('Ola, meu nome é $nome!');
  }
}
```

**Observação:**  
Eu já usava métodos, mas não tinha essa visão de que eles representam ações de um objeto. Agora, entendo melhor o porquê
de colocar eles dentro da classe e não fora.
---

## 5. Como posso acessar os métodos de um objeto em Dart?

**Resposta:**  
Usando o operador ponto (.):

```dart

var pessoa = Pessoa('Lucas', 20);
pessoa.dizerOla
(); // Chamada de método
```

**Observação:**  
Essa parte foi bem tranquila, porque eu já fazia isso sem pensar muito, mas foi bom ver explicado certinho. Me deu mais
confiança de que estou usando da forma correta.

---

## 6. Qual a diferença entre atributos 'públicos' e 'privados'?

**Resposta:**

- Públicos: Podem ser acessados de fora da classe.
- Privados: Em Dart, são prefixados com _ e só podem ser acessados dentro do mesmo arquivo.

```dart
  class Conta {
  double _saldo = 0;

  void depositar(double valor) {
    _saldo += valor;
  }

  double get saldo => _saldo;
}
```

**Observação:**  
Eu não sabia que Dart usava _ para isso. Sempre achei que precisava de palavras-chave como "private", tipo Java. Isso me
ajudou a proteger dados que não deveriam ser acessados diretamente.

---

## 7. Qual a diferença entre um construtor padrão e um construtor nomeado?

**Resposta:**

- Padrão: É o construtor principal da classe.
- Nomeado: Usado para criar múltiplas formas de inicialização.

```dart
class Produto {
  String nome;
  double preco;

  Produto(this.nome, this.preco); // padrão

  Produto.vazio()
      : nome = '',
        preco = 0; // nomeado
}
```

**Observação:**  
Eu nunca tinha usado construtor nomeado antes, mas achei muito útil pra ter mais de uma forma de criar objetos. Testei
no meu código e achei super prático.

---

## 8. O que são 'factories' em Dart e quando devo usá-las?

**Resposta:**  
Factories são construtores que não criam diretamente uma instância com new, mas retornam uma instância de alguma forma,
podendo aplicar lógica de criação.

```dart
class Usuario {
  String nome;

  Usuario._(this.nome);

  factory Usuario.criar(String nome) {
    if (nome.isEmpty) {
      throw ArgumentError('Nome nao pode ser vazio');
    }
    return Usuario._(nome);
  }
}
```

**Observação:**  
Isso foi uma das coisas mais novas pra mim. Não fazia ideia que dava pra criar objetos com lógica dentro de
construtores. Achei muito útil pra quando precisa validar antes de criar.
