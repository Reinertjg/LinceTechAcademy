# Usando IA como apoio – Introdução ao Flutter e Widgets  
Lince Tech Academy

---

## 1. Explique o MaterialApp e seus parâmetros?

**Resposta:**  
O MaterialApp é o widget raiz em muitos apps Flutter e configura aspectos importantes como tema, rotas e título. Ele define o ambiente visual baseado no Material Design. Alguns parâmetros principais são:

- `home`: define a tela inicial do app.  
- `theme`: configura cores e estilos.  
- `routes`: mapa de rotas nomeadas.  
- `title`: título do app (usado por sistemas operacionais).  
- `debugShowCheckedModeBanner`: remove a faixa "debug" no canto da tela.

**Observação:**  
A IA me ajudou a entender que o MaterialApp é mais do que um container — ele define a estrutura e identidade do app desde o início.

---

## 2. Como funcionam os “import’s” no Flutter?

**Resposta:**  
Os imports no Flutter seguem a estrutura do Dart. É possível importar bibliotecas nativas (`dart:math`), pacotes (`package:flutter/material.dart`) e arquivos locais (`import 'meu_arquivo.dart'`). Eles permitem a reutilização de código e acesso a recursos externos.

**Observação:**  
Percebi que organizar bem os imports é essencial para manter a legibilidade e evitar conflitos, principalmente em projetos maiores.

---

## 3. Explique o que é o Material Design e como ele é utilizado no Flutter.

**Resposta:**  
Material Design é um sistema de design criado pelo Google que define diretrizes de UI como cores, sombras e interações. O Flutter implementa isso por meio de widgets que seguem essas diretrizes, como `AppBar`, `FloatingActionButton`, `Card`, etc.

**Observação:**  
A IA me fez entender que usar Material Design não é apenas visual, mas também garantir consistência e usabilidade no app.

---

## 4. Quais são os principais widgets do Material Design disponíveis no Flutter?

**Resposta:**  
Alguns widgets importantes:

- `Scaffold`  
- `AppBar`  
- `FloatingActionButton`  
- `Card`  
- `TextField`, `ListTile`, `SnackBar`, entre outros.

**Observação:**  
Agora tenho uma base melhor para escolher os widgets certos com base no propósito visual e funcional.

---

## 5. O que são widgets Stateless e quando devemos utilizá-los?

**Resposta:**  
Stateless widgets são componentes que não mudam de estado depois de construídos. Eles são ideais para interfaces estáticas, como ícones, texto, botões com comportamento fixo.

**Observação:**  
A IA reforçou que pensar em Stateless ajuda a otimizar performance e tornar o código mais previsível.

---

## 6. Explique o ciclo de vida de um widget Stateless.

**Resposta:**  
O Stateless widget é criado com seu construtor e renderizado via o método `build()`. Após isso, ele não muda. Se algo precisar mudar, é necessário recriar o widget com novos dados.

**Observação:**  
Aprendi que o ciclo de vida é simples e ideal para partes fixas da UI, como logotipo ou um botão desativado.

---

## 7. Quais são as limitações dos widgets Stateless?

**Resposta:**  

- Não podem atualizar a interface dinamicamente.  
- Não armazenam estado interno.  
- Qualquer mudança exige reconstrução externa.

**Observação:**  
Entendi que abusar de Stateless em interfaces interativas pode levar a lógica mais complexa e difícil de manter.

---

## 8. O que são widgets Stateful e quando devemos utilizá-los?

**Resposta:**  
Widgets Stateful possuem estado interno que pode mudar durante o tempo de vida do widget. Usamos quando há interação com o usuário, animações ou qualquer atualização dinâmica.

**Observação:**  
Vi que Stateful é necessário para UIs dinâmicas, mas deve ser usado com responsabilidade para evitar acoplamento excessivo.

---