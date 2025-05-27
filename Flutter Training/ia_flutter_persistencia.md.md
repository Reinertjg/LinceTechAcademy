
# Usando IA como apoio – Persistência de Dados no Flutter
Lince Tech Academy

---

## 1. O que é persistência de dados em aplicativos Flutter e por que é importante?  
**Resposta:**  
Persistência de dados é a capacidade de um aplicativo salvar informações localmente, mesmo após ser fechado. Isso é essencial para manter configurações, preferências do usuário, sessões e dados que não precisam ser buscados novamente da internet, garantindo melhor desempenho e experiência do usuário.  

**Observação:**  
Sem persistência, o app perderia todas as informações ao ser fechado.  

---

## 2. Quais são os diferentes tipos de dados que podem ser persistidos em um aplicativo Flutter?  
**Resposta:**  
- Dados simples (chave-valor) – Ex.: preferências do usuário  
- Dados estruturados – Ex.: listas, objetos complexos  
- Arquivos – Ex.: imagens, PDFs, textos  
- Bancos de dados locais – Ex.: SQLite, Drift  
- Cache – Dados temporários para melhorar performance  

**Observação:**  
A escolha depende da complexidade e da frequência de acesso aos dados.  

---

## 3. O que é o pacote SharedPreferences em Flutter e como ele funciona?  
**Resposta:**  
É um plugin que permite armazenar dados simples em formato chave-valor no armazenamento local do dispositivo. Ele funciona como um dicionário persistente, salvando dados como `String`, `int`, `double`, `bool` e `List<String>`.  

**Observação:**  
Ideal para configurações, preferências e dados simples.  

---

## 4. Quais são as limitações do SharedPreferences em termos de armazenamento de dados?  
**Resposta:**  
- Armazena apenas dados simples (não suporta objetos complexos diretamente)  
- Não é adequado para grandes volumes de dados  
- Pode ter problemas de performance se usado para dados muito extensos ou consultas frequentes e complexas  

**Observação:**  
Para dados complexos ou relacionais, use bancos como SQLite ou Drift.  

---

## 5. Quando devo usar SharedPreferences em vez de outras opções de persistência de dados?  
**Resposta:**  
Quando o aplicativo precisa armazenar informações simples, como:  
- Tema selecionado (claro/escuro)  
- Token de login (quando não exige criptografia forte)  
- Preferências do usuário  
- Flags de primeiro acesso ou introduções concluídas  

**Observação:**  
Não use para dados sensíveis ou grandes volumes.  

---

## 6. Como posso lidar com erros ao usar SharedPreferences?  
**Resposta:**  
- Usar `try-catch` para capturar exceções durante leitura ou escrita  
- Verificar se o valor retornado não é `null` antes de usar  
- Implementar fallback (valores padrão) caso haja falha na leitura  

**Observação:**  
Erros podem ocorrer por falta de permissão, corrupção de dados ou problemas no armazenamento do dispositivo.  

---

## 7. Quais são as melhores práticas para usar SharedPreferences de forma eficiente?  
**Resposta:**  
- Armazenar apenas dados simples e essenciais  
- Evitar escrita/leitura desnecessária, especialmente em loops ou chamadas frequentes  
- Usar abstrações, como serviços ou helpers, para centralizar o acesso às preferências  
- Sempre definir valores padrão ao ler dados  
- Considerar a migração para soluções mais robustas quando a complexidade aumentar  

**Observação:**  
Organização e boas práticas evitam bugs e melhoram a manutenibilidade do código.  

---
