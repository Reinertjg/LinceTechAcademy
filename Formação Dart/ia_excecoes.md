# Usando IA como apoio – Tratamento de Exceções
**Lince Tech Academy**

---

## 1. Qual a diferença entre um erro e uma exceção em Dart?

**Resposta:**

Um erro representa problemas graves que geralmente não podem ser tratados pelo programa (ex: `OutOfMemoryError`).  
Uma exceção representa condições anormais, mas que podem ser previstas e tratadas com lógica de código (ex: falha de leitura de um arquivo).

**Observação:**  
A IA me ajudou a entender que exceções devem ser tratadas, mas erros geralmente indicam falhas sérias no ambiente de execução. Isso muda como penso no controle de fluxo em aplicações.

---

## 2. Em quais situações devo esperar encontrar um erro, e em quais devo esperar uma exceção?

**Resposta:**

Erros geralmente ocorrem em situações fora do controle do programador, como falha de alocação de memória.  
Exceções podem ocorrer em situações previstas, como tentar abrir um arquivo que não existe ou dividir por zero.

**Observação:**  
Essa explicação reforçou a importância de prever exceções em código crítico e não tentar capturar erros que fogem do escopo da aplicação.

---

## 3. O que fazem os blocos `try`, `catch` e `finally` em Dart?

**Resposta:**

- `try`: bloco onde o código que pode lançar uma exceção é escrito.
- `catch`: bloco que trata a exceção se ela ocorrer.
- `finally`: bloco que sempre é executado, ocorrendo ou não exceção.

**Observação:**  
A explicação foi bem completa. Já usei `try/catch`, mas não explorava o `finally`. Agora entendo sua utilidade para liberar recursos, por exemplo.

---

## 4. Como posso capturar diferentes tipos de exceções usando `catch`?

**Resposta:**  
É possível usar `on` para capturar tipos específicos de exceções, e `catch` para exceções genéricas. Exemplo:

```dart
try {
  // código
} on FormatException {
  print('Erro de formatação');
} catch (e) {
  print('Exceção genérica: $e');
}
```

**Observação:**  
Aprendi que posso ter múltiplos blocos on para lidar com diferentes exceções, deixando meu código mais robusto e claro.

---

## 5. Em quais situações é útil usar o bloco `finally`?

**Resposta:**  
O bloco `finally` é útil para executar ações de limpeza ou encerramento, como fechar arquivos, conexões de rede ou banco de dados, independentemente de ter ocorrido exceção.

**Observação:**  
Achei muito útil esse conceito. Pretendo aplicar em conexões que preciso garantir que sejam sempre encerradas, mesmo com falhas.

---

## 6. Por que eu precisaria lançar uma exceção em meu código?

**Resposta:**  
Lançamos exceções para indicar que uma regra de negócio foi violada ou que ocorreu um comportamento inesperado que o método não pode tratar diretamente.

**Observação:**  
Isso me fez pensar que lançar exceções é uma forma de documentar e reforçar regras do sistema, delegando o tratamento para quem invocou o método.

---

## 7. Como posso personalizar mensagens de erro ao lançar exceções?

**Resposta:**
Você pode lançar exceções com mensagens personalizadas:

```dart
throw Exception('A senha deve ter no mínimo 8 caracteres');
```
Ou criar suas próprias classes de exceção:
```dart
class SenhaFracaException implements Exception {
  String toString() => 'Senha muito fraca!';
}
```

**Observação:**  
Gostei da ideia de criar exceções personalizadas. Isso deixa o código mais expressivo e facilita o debug.

## 8.  Quais são as melhores práticas para lançar exceções em Dart?

**Resposta:**  
 - Lançar exceções apenas em situações anormais.
 - Usar exceções personalizadas para melhorar a semântica.
 - Evitar capturar exceções genéricas sem necessidade.
 - Sempre documentar os métodos que podem lançar exceções.

**Observação:**  
Foi importante entender que lançar exceções não deve ser banalizado. A clareza e a previsibilidade são essenciais para manter o código compreensível.
