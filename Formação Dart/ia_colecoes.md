# Usando IA como apoio - Coleções
**Lince Tech Academy**

---

##  1. Quais as boas práticas no uso de listas em Dart?

**Resposta:**
- Declarar o tipo da lista para evitar erros de runtime.
- Utilizar listas imutáveis (`const` ou `List.unmodifiable`) quando possível.
- Evitar misturar tipos dentro da mesma lista.
- Usar métodos como `add`, `remove`, `where`, `map` com clareza e propósito.

**Minha observação:**  
Me chamou a atenção o uso de listas imutáveis. Nunca tinha usado `List.unmodifiable`, e agora vejo como isso pode evitar bugs causados por modificações inesperadas.

---

##  2. Que práticas posso adotar para trazer uma melhor performance ao usar listas em Dart?

**Resposta:**
- Preferir `for` tradicional a `.forEach()` em listas grandes.
- Evitar recriar listas desnecessariamente dentro de loops.
- Alocar o tamanho da lista se souber de antemão quantos elementos terá.

**Minha observação:**  
Não sabia que `.forEach()` era menos eficiente. Em projetos futuros vou priorizar `for` simples quando trabalhar com grandes volumes de dados.

---

## 3. O que não é recomendado fazer quando se usa listas em Dart?

**Resposta:**
- Não alterar a lista enquanto está sendo percorrida.
- Evitar listas com tipos misturados.
- Fugir de estruturas muito aninhadas (listas dentro de listas dentro de listas...).

**Minha observação:**  
Já enfrentei bugs por alterar lista dentro de `forEach()`. Agora vejo que o ideal seria clonar a lista ou mudar a abordagem.

---

##  4. Como entender quando usar listas e quando usar mapas?

**Resposta:**
- Use listas quando a ordem importa e os itens não têm identificadores únicos.
- Use mapas quando precisar associar uma chave a um valor.
- Para acesso por posição → lista. Para acesso por chave → mapa.

**Minha observação:**  
Ficou bem claro. Posso pensar em listas como “coleções ordenadas” e mapas como “dicionários”. Isso ajuda a decidir rápido qual usar.

---

##  5. Em Dart, quais práticas são interessantes no uso de mapas?

**Resposta:**
- Definir tipos de chave e valor.
- Utilizar `putIfAbsent` para evitar sobrescritas.
- Iterar com `.entries` ao invés de `.keys` e `.values` separadamente.

**Minha observação:**  
O método `putIfAbsent` é uma joia escondida. Evita muita lógica desnecessária quando queremos adicionar valores sem sobrescrever.

---

##  6. Quais métodos podem me auxiliar no uso de listas e sets em Dart?


**Resposta:**
- **Listas**: `add`, `remove`, `map`, `where`, `fold`, `contains`
- **Sets**: `add`, `remove`, `union`, `intersection`, `difference`, `lookup`

**Minha observação:**  
Achei muito poderoso o `.intersection()` e `.difference()` nos sets. Já imagino cenários de filtros e tags onde isso se encaixa perfeitamente.

---

##  7. Quais cuidados devo levar ao usar sets?

**Resposta:**
- Sets não aceitam valores duplicados.
- A ordem dos elementos não é garantida (exceto `LinkedHashSet`).
- Mutabilidade pode causar comportamentos inesperados se não for controlada.

**Minha observação:**  
Eu pensava que sets sempre mantinham a ordem de inserção, mas agora sei que isso só vale para `LinkedHashSet`. Informação valiosa!

---

## 8. Documentação do `elementAtOrNull`

**Pergunta feita à IA:**
> Traga a documentação do método `elementAtOrNull`.

**Resposta:**  
Método disponível via o pacote `collection`. Retorna o elemento no índice especificado ou `null` se o índice for inválido.
```dart
import 'package:collection/collection.dart';

final lista = [10, 20, 30];
print(lista.elementAtOrNull(5)); // null
```
**Minha observação:**   
Excelente alternativa para evitar exceções ao acessar índices fora do alcance. Mas é bom lembrar que depende de um pacote externo.