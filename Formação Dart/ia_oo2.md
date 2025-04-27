# Usando IA como apoio – Colecoes (Orientacao a Objetos)

**Lince Tech Academy**

---

## 1. O que significa 'sobrescrever' um metodo em Dart e por que eu faria isso?

**Resposta:**  

Sobrescrever um metodo (override) em Dart significa criar uma nova implementacao de um metodo que foi definido em uma classe pai. Isso e feito para adaptar ou modificar o comportamento do metodo herdado de acordo com a necessidade da classe filha. Utiliza-se a anotacao @override antes do metodo.

**Observacao:**  
Achei interessante porque me ajudou a entender como posso reutilizar codigo e ao mesmo tempo personalizar comportamentos para diferentes classes.

---

## 2. Como posso chamar o metodo original de uma classe pai em um metodo sobrescrito?

**Resposta:**  

Voce pode utilizar a palavra-chave super para acessar o metodo original da classe pai.  
Exemplo:
```dart
@override
void falar() {
  super.falar();
  print("E adiciono mais informacoes na classe filha.");
}
```

**Observacao:**  
Ficou claro que ainda posso aproveitar parte da logica da classe pai mesmo sobrescrevendo.

---

## 3. Como posso criar um getter para acessar um atributo privado de uma classe?

**Resposta:**  

Um getter e uma forma de expor o valor de um atributo privado com controle.  
Exemplo:
```dart
class Pessoa {
  String _nome;

  Pessoa(this._nome);

  String get nome => _nome;
}
```

**Observacao:**  
Me ajudou a entender melhor encapsulamento e como proteger atributos internos.

---

## 4. Em quais situacoes e melhor usar getters e setters em vez de acessar atributos diretamente?

**Resposta:**  

E melhor usar getters e setters quando voce precisa:
- Validar dados antes de atribuir valores;
- Realizar alguma logica ao acessar ou modificar um valor;
- Manter encapsulamento e proteger atributos internos.

**Observacao:**  
Percebi que usar getters e setters e uma boa pratica para manter o codigo mais seguro e flexivel.

---

## 5. O que e uma 'classe abstrata' e como ela difere de uma classe normal?

**Resposta:**  

Uma classe abstrata e uma classe que nao pode ser instanciada diretamente e serve como base para outras classes. Ela pode conter metodos concretos (com implementacao) e abstratos (sem implementacao). Diferente de uma classe normal, seu objetivo e fornecer uma estrutura para as classes filhas.

**Observacao:**  
Consegui entender que classes abstratas sao otimas para forcar uma estrutura base entre classes relacionadas.

---

## 6. Quando devo usar classes abstratas em vez de classes concretas?

**Resposta:**  

Use classes abstratas quando:

- Voce quer definir um comportamento base comum para varias classes;
- Deseja obrigar que as classes filhas implementem certos metodos;
- Esta criando um modelo generico que deve ser especializado por outras classes.

**Observacao:**  
Facilitou muito enxergar quando usar abstracao para evitar codigo duplicado.

---

## 7. O que e 'heranca' em Dart e como ela funciona?

**Resposta:**  

Heranca em Dart permite que uma classe herde atributos e metodos de outra. Usa-se a palavra-chave extends. A classe filha pode reutilizar e/ou sobrescrever funcionalidades da classe pai.

**Observacao:**  
Agora ficou mais claro como posso criar hierarquias de classes e reaproveitar codigo.

---

## 8. Qual a diferenca entre heranca e composicao?

**Resposta:**  

- Heranca: Uma classe herda de outra, formando uma relacao "e um".
- Composicao: Uma classe possui instancias de outras classes, formando uma relacao "tem um".

**Observacao:**  
Gostei da explicacao porque me ajudou a escolher melhor entre usar heranca ou composicao dependendo do caso.

---

