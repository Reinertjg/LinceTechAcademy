# Usando IA como apoio - Variáveis
**Lince Tech Academy**

---

### 1. **Quais as boas práticas em Dart declarando variáveis?**

**Resposta:**
- Usar `var` quando o tipo pode ser inferido automaticamente.
- Usar tipos explícitos (`int`, `String`, `bool`, etc.) quando for importante para legibilidade.
- Preferir `final` e `const` sempre que o valor da variável não for mudar.
- Nomear variáveis de forma clara e descritiva.
- Evitar nomes genéricos como `x`, `temp`, `data`, exceto em contextos muito curtos.

**Observação:**
A resposta foi direta e clara. Achei muito útil o lembrete sobre `final` e `const`, e percebi que muitas vezes deixo o tipo implícito até quando seria melhor declarar explicitamente para clareza.

---

### 2. **O que evitar na hora de declarar variáveis em Dart?**

**Resposta:**
- Evitar variáveis com nomes ambíguos.
- Não usar `late` desnecessariamente.
- Evitar criar variáveis globais fora de controle.
- Não reutilizar nomes de variáveis em escopos diferentes.

**Observação:**
A IA trouxe pontos que eu ainda não tinha parado para pensar, como o uso indevido de `late` e variáveis globais. Essa dica me ajudou a refletir sobre organização do código.

---

### 3. **Quais cuidados tomar quando crio variáveis com valor nulo trabalhando com Dart?**

**Resposta:**
- Sempre checar se a variável pode ser nula e, se sim, utilizar o operador `?`.
- Usar o operador `??` para fornecer valores padrão.
- Quando o valor só será definido depois, considerar o uso de `late`.

**Observação:**
Gostei da explicação do uso do `??`, que eu já via em códigos mas ainda não entendia completamente. Também foi bom o alerta sobre o uso de `late` apenas quando necessário.

---

### 4. **No Dart quando usar variáveis nulas e quando usar o modificador `late`?**

**Resposta:**
- Use variáveis nulas (`String? nome`) quando o valor pode ser ausente em algum momento.
- Use `late` quando a variável será obrigatoriamente inicializada antes do uso, mas não no momento da declaração.

**Observação:**
Foi uma das explicações mais claras que já vi sobre esse tema. A IA conseguiu diferenciar bem as duas situações e me deu mais segurança para usar o `late`.

---

### 5. **Gostaria de entender quais os benefícios da utilização do modificador `late` no Dart.**

**Resposta:**
- Permite inicializar a variável depois da declaração, mantendo o tipo não-nulo.
- Evita a necessidade de usar `?` para tipos que obrigatoriamente terão valor.
- Útil em classes quando o valor é passado por injeção de dependência ou construção complexa.

**Observação:**
Aqui a IA mostrou casos práticos, especialmente com injeção de dependência, que são muito reais no desenvolvimento. A explicação foi clara e contextualizada.

---

### 6. **Quais as diferenças entre `final` e `const` em Dart?**

**Resposta:**
- `final` é usado quando o valor é definido apenas uma vez, mas em tempo de execução.
- `const` é usado quando o valor é imutável e conhecido em tempo de compilação.
- Exemplo: `final DateTime agora = DateTime.now();` vs `const pi = 3.14;`

**Observação:**
Muito boa. Essa diferença me confundia no começo e o exemplo com `DateTime` me ajudou bastante. Agora entendo melhor quando optar por cada um.

---

### 7. **Por que no Dart usar variáveis `final` e `const` ao invés de usar somente seus valores padrão?**

**Resposta:**
- Melhor desempenho com `const`, pois os objetos são alocados apenas uma vez.
- Segurança e legibilidade com `final`, prevenindo alterações acidentais.
- Facilita a leitura e manutenção do código.

**Observação:**
Faz muito sentido. Não tinha parado pra pensar no impacto de desempenho do `const`. Agora vejo valor em escrever código mais defensivo com `final`.

---

### 8. **Quais métodos possuem as variáveis `String` no Dart?**

**Resposta:**
- `length`, `contains`, `toUpperCase`, `toLowerCase`, `split`, `trim`, `replaceAll`, `startsWith`, `endsWith`, `substring`, `indexOf`, etc.

**Observação:**
Resposta muito útil e prática. Já deixei essa lista anotada para testar no console do DartPad. Ótimo para quem está começando.

