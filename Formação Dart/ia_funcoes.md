# IA como Apoio – Estudo sobre Funções em Dart
**Lince Tech Academy**

---

## Interações com a IA

### 1. Quais cuidados devo ter ao criar funções em Dart?

**Resposta da IA:**
- Nome claro e descritivo para a função.
- Evitar funções muito longas (seguir o princípio da responsabilidade única).
- Manter número reduzido de parâmetros (boas práticas indicam até 3).
- Especificar tipos de entrada e saída.
- Evitar o uso exagerado de variáveis globais.

**Observação:**  
Essa resposta me fez entender melhor como manter o código mais limpo e organizado. É o tipo de coisa que ajuda muito principalmente quando a gente tá trabalhando com mais pessoas ou revendo código depois de um tempo.

---

### 2. Posso chamar minha função dentro dela mesma?

**Resposta da IA:**  
Sim, isso se chama recursão. Ela é útil em estruturas como árvores ou problemas matemáticos como fatorial ou Fibonacci. No entanto, é importante garantir uma condição de parada, para evitar loop infinito e erro de stack overflow.

**Observação:**  
Eu já tinha visto isso antes, mas agora ficou mais claro o quanto é importante cuidar da condição de parada. Recursão pode ser muito útil, mas também é fácil de se perder se não souber o que tá fazendo.

---

### 3. Existe limite de parâmetros em uma função?

**Resposta da IA:**  
Tecnicamente, não há um limite rígido. No entanto, boas práticas recomendam que uma função tenha poucos parâmetros. Muitos parâmetros podem indicar que a função está fazendo coisas demais.

**Observação:**  
Faz total sentido manter o número de parâmetros baixo. Eu vou tentar sempre deixar as funções mais enxutas e com propósito bem definido.

---

### 4. É recomendado usar `dynamic` nos parâmetros de uma função?

**Resposta da IA:**  
Não é recomendado usar `dynamic` a menos que seja realmente necessário. Isso reduz a verificação de tipo em tempo de compilação e pode causar erros em tempo de execução.

**Observação:**  
Essa foi uma boa dica. Eu gosto de usar tipos definidos porque me dá mais controle e segurança, então vou evitar o `dynamic` sempre que puder.

---

### 5. Quando usar operadores de valores opcionais e requeridos em uma função Dart?

**Resposta da IA:**
- Parâmetros nomeados opcionais: usados com `{}` e geralmente com valor padrão.
- Parâmetros nomeados obrigatórios: usados com `required`.  
  Esses ajudam a tornar a função mais legível e clara no uso dos argumentos.

```dart
void saudacao({required String nome, int idade = 18}) {
  print('Olá $nome, idade: $idade');
}
```
---

### 6. O que são parâmetros nomeados em uma função?

**Resposta da IA:**  
São parâmetros passados por nome na chamada da função, facilitando a leitura e clareza. São definidos com {} na declaração da função.
    
**Observação:**  
Achei bem útil isso. Quando a função tem muitos parâmetros, os nomeados ajudam muito a entender o que tá sendo passado. Vou usar mais essa abordagem.

---

### 7. Quais métodos existem para variáveis do tipo Function em Dart?

**Resposta da IA:**  
Function é um tipo que representa qualquer função. Pode ser invocada com () como se fosse uma função normal.

```dart
Function f = () => print("Oi!");
f(); // chama a função
```
**Observação:**  
Gostei bastante desse exemplo. Achei legal ver como dá pra armazenar uma função em uma variável e depois chamar ela. Isso abre várias possibilidades no código.

---

### 8. Diferença entre olaMundo e olaMundo()?

**Resposta da IA:**  
olaMundo refere-se à função como objeto (sem executá-la).

olaMundo() executa a função.

**Observação:**  
Essa explicação foi simples, mas muito útil. Já tinha me confundido com isso antes, principalmente quando passo função como parâmetro. Agora ficou mais claro o que acontece em cada caso.