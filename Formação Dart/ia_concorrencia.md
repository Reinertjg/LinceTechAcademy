
# Usando IA como apoio – Concorrência

**Lince Tech Academy**

---

## 1. O que é um Future em Dart e como ele me ajuda a lidar com tarefas que levam tempo?

**Resposta:**

Um `Future` em Dart representa uma operação que será concluída no futuro. Ele é utilizado para lidar com tarefas que podem demorar para terminar, como buscar dados da internet ou ler arquivos, sem travar a execução do programa.

**Observação:**

Achei que agora ficou mais claro como posso fazer o app continuar funcionando enquanto espero uma tarefa terminar.

---

## 2. O que significam os termos 'assíncrono' e 'síncrono'?

**Resposta:**

'Síncrono' significa que as operações são executadas uma após a outra, bloqueando até que cada uma termine. 'Assíncrono' permite que outras operações continuem enquanto a tarefa ainda está sendo concluída.

**Observação:**

Essa explicação facilitou muito o entendimento do motivo de usar funções assíncronas para melhorar a performance.

---

## 3. O que acontece se um Future falhar e como posso lidar com esse erro?

**Resposta:**

Se um Future falhar, ele lança uma exceção que pode ser tratada usando `try-catch` ou o método `catchError`. Assim, o aplicativo não quebra e pode agir conforme o erro.

**Observação:**

Gostei da explicação porque mostrou que é importante se preparar para erros, principalmente em apps que dependem de internet.

---

## 4. Existe uma forma de executar várias tarefas assíncronas em paralelo?

**Resposta:**

Sim, usando `Future.wait()`, é possível executar várias tarefas assíncronas ao mesmo tempo e aguardar todas terminarem juntas.

**Observação:**

Achei muito útil, porque já imaginei usando para carregar vários dados ao mesmo tempo no app.

---

## 5. Em quais situações devo usar Futures em meu código Dart?

**Resposta:**

Futures devem ser usados sempre que houver uma operação que demora, como chamadas de API, leitura/gravação de arquivos, ou qualquer tarefa que não precisa travar a aplicação.

**Observação:**

Me ajudou a perceber que usar Future é uma prática essencial para aplicações mais responsivas.

---

## 6. Quais cuidados devo tomar não usando await em funções Future?

**Resposta:**

Se você não usar `await`, o Future começará a executar mas o programa não vai esperar terminar, o que pode causar bugs por tentar usar o resultado antes dele estar pronto.

**Observação:**

Achei importante a observação porque eu já estava errando nisso antes e agora ficou claro o perigo.

---

## 7. Como lidar com erros usando Future?

**Resposta:**

Erros podem ser tratados usando `try-catch` em funções `async`, ou adicionando `catchError` diretamente no Future. Isso evita que erros quebrem o fluxo do programa.

**Observação:**

Foi bom ver exemplos simples de `try-catch` porque me mostrou que lidar com erro não é tão complicado quanto eu achava.

---

## 8. De quais formas posso esperar que um Future seja concluído e obter o resultado?

**Resposta:**

Você pode usar `await` em uma função assíncrona ou o método `.then()` para esperar um Future terminar e acessar seu resultado.

**Observação:**

Gostei que agora sei duas formas de lidar com Future e posso escolher a melhor dependendo do caso.

