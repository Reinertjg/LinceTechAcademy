# Usando IA como apoio – Flutter: Programação Assíncrona
Lince Tech Academy

## 1. O que é programação assíncrona em Flutter e por que ela é importante?

**Resposta:**  
Programação assíncrona é um modelo que permite que operações longas (como acesso à internet ou banco de dados) sejam realizadas sem bloquear a execução da interface. Em Flutter, ela é importante para manter a aplicação responsiva enquanto tarefas demoradas estão sendo executadas.

**Observação:**  
Agora entendo que programação assíncrona mantém o app rápido mesmo realizando operações pesadas.

---

## 2. Quais cuidados devo ter usando programação assíncrona?

**Resposta:**  
É importante evitar conflitos de estado, garantir que a interface reaja corretamente à finalização das tarefas e sempre tratar erros que possam ocorrer em chamadas assíncronas.

**Observação:**  
Aprendi que preciso estar atento a erros e mudanças de estado enquanto uso async.

---

## 3. O que são isolates em Flutter?

**Resposta:**  
Isolates são unidades de execução independentes que não compartilham memória entre si. Eles permitem executar tarefas pesadas sem travar o main thread (responsável pela UI).

**Observação:**  
Agora sei que isolates são usados para tarefas muito pesadas que poderiam travar a interface.

---

## 4. Quais cuidados devo ter ao usar isolates em Flutter?

**Resposta:**  
Deve-se garantir que a comunicação entre isolates seja feita por mensagens e não por objetos compartilhados, além de evitar criar muitos isolates desnecessariamente para não sobrecarregar o sistema.

**Observação:**  
Com isso, aprendi que o uso de isolates deve ser moderado e bem planejado.

---

## 5. Qual o conceito do Loop de Eventos em Flutter?

**Resposta:**  
É o mecanismo que gerencia a fila de eventos e tarefas assíncronas. Ele processa eventos um de cada vez, garantindo que o aplicativo permaneça organizado e previsível.

**Observação:**  
Agora entendo que o loop de eventos é o "coração" do gerenciamento assíncrono no Flutter.

---

## 6. O que é um 'Future' em Dart e como ele funciona?

**Resposta:**  
Um `Future` representa um valor que estará disponível no futuro, geralmente o resultado de uma operação assíncrona. Ele pode completar com sucesso (com um valor) ou com erro.

**Observação:**  
Aprendi que `Future` é como uma promessa de que um valor estará disponível depois.

---

## 7. Como posso usar 'async' e 'await' para trabalhar com 'Futures'?

**Resposta:**  
Você declara uma função como `async` e usa `await` antes de chamar um `Future`, o que faz com que a execução espere a resposta antes de continuar.

**Observação:**  
Agora sei que `async` e `await` deixam o código assíncrono mais legível e sequencial.

---

## 8. Como posso lidar com erros em operações assíncronas usando 'try-catch'?

**Resposta:**  
Envolva o código `await` em um bloco `try-catch` para capturar e tratar possíveis exceções que ocorram durante a execução do `Future`.

**Observação:**  
Com isso, aprendi a tratar erros de forma segura e previsível em operações assíncronas.

---

## 9. Traga a explicação dos métodos HTTP.

**Resposta:**
- `GET`: Obtém dados do servidor.
- `POST`: Envia dados para o servidor.
- `PUT`: Atualiza dados existentes.
- `DELETE`: Remove dados do servidor.

**Observação:**  
Agora entendo as funções básicas de cada método HTTP em APIs.

---

## 10. Como posso lidar com diferentes códigos de resposta HTTP (200, 404, 500)?

**Resposta:**  
Você pode verificar o valor de `response.statusCode` e tomar ações específicas:
- `200`: Sucesso.
- `404`: Não encontrado.
- `500`: Erro interno do servidor.

**Observação:**  
Aprendi que checar o código de status ajuda a dar feedback ao usuário e tratar erros corretamente.

---

## 11. O que é JSON e como ele é usado em Flutter?

**Resposta:**  
JSON (JavaScript Object Notation) é um formato leve de troca de dados. Em Flutter, ele é utilizado para comunicar-se com APIs e manipular dados estruturados.

**Observação:**  
Agora sei que JSON é como os dados viajam entre app e servidor.

---

## 12. Como posso acessar valores específicos em um objeto JSON?

**Resposta:**  
Ao converter JSON para um `Map<String, dynamic>`, é possível acessar os valores utilizando as chaves. Ex: `map['nome']`.

**Observação:**  
Aprendi como acessar os dados específicos dentro de uma estrutura JSON.

---

## 13. Como posso lidar com arrays (listas) em JSON em Flutter?

**Resposta:**  
Arrays JSON são convertidos em `List<dynamic>` em Dart. Você pode iterar sobre eles com `for` ou `map`.

**Observação:**  
Agora entendo como trabalhar com listas retornadas de APIs.

---

## 14. Como posso iterar sobre os elementos de um array JSON?

**Resposta:**  
Usando métodos como `for`, `forEach` ou `map`, você pode percorrer os elementos e transformá-los em widgets ou objetos.

**Observação:**  
Aprendi como transformar cada item de um array JSON em um widget usando `map`.

---

## 15. Por que é útil mapear JSON para classes Dart?

**Resposta:**  
Mapear JSON para classes torna o código mais organizado, legível e com validação de tipos, facilitando a manutenção.

**Observação:**  
Agora sei que mapear JSON para classes evita erros e melhora a estrutura do projeto.

---

## 16. Como posso usar 'factory' para criar objetos Dart a partir de JSON?

**Resposta:**  
Você pode usar um construtor `factory` que recebe um `Map<String, dynamic>` e retorna uma instância da classe com os dados convertidos.

**Observação:**  
Com isso, aprendi a transformar JSON em objetos reais de forma prática.

---

## 17. Como posso usar 'toJson()' para converter objetos Dart em JSON?

**Resposta:**  
A função `toJson()` retorna um `Map<String, dynamic>` com os atributos da classe, pronto para ser convertido em JSON com `jsonEncode()`.

**Observação:**  
Agora entendo como enviar objetos como JSON em requisições.

---

## 18. Como organizar minhas requisições no meu código Flutter? Quais as boas práticas realizando requisições?

**Resposta:**
- Criar classes separadas (ex: ApiService) para centralizar as requisições.
- Utilizar funções reutilizáveis para métodos GET, POST etc.
- Tratar erros de rede com `try-catch`.
- Usar `async/await` para clareza.
- Evitar lógica de rede na interface (separar camadas).

**Observação:**  
Aprendi a manter meu código limpo e reutilizável ao lidar com APIs.

---

## 19. Como posso exibir uma mensagem de carregamento enquanto a requisição HTTP está em andamento?

**Resposta:**  
Você pode usar um `FutureBuilder` ou manipular um booleano `isLoading` com `setState` para exibir um `CircularProgressIndicator` enquanto espera a resposta.

**Observação:**  
Agora sei como mostrar para o usuário que algo está sendo carregado.

---

## 20. Dê exemplos de consumo a APIs em Flutter.

**Resposta:**  
Exemplo com `http.get()`:
```dart
final response = await http.get(Uri.parse('https://api.exemplo.com/dados'));
if (response.statusCode == 200) {
  final data = jsonDecode(response.body);
  print(data);
}
