
# Usando IA como apoio – SQLite no Flutter
Lince Tech Academy

---

## 1. O que é um banco de dados SQLite e como ele funciona em Flutter?  
**Resposta:**  
SQLite é um banco de dados relacional local, leve e embutido, que não requer servidor. No Flutter, ele funciona através de pacotes como `sqflite`, permitindo criar, consultar, atualizar e deletar dados armazenados localmente no dispositivo.  

**Observação:**  
Ideal para apps que precisam armazenar dados estruturados de forma offline.  

---

## 2. Quais são as vantagens de usar SQLite em aplicativos Flutter?  
**Resposta:**  
- Funciona offline  
- Desempenho rápido para dados locais  
- Suporte a SQL completo (SELECT, JOIN, GROUP BY, etc.)  
- Estrutura relacional (tabelas e relacionamentos)  
- Persistência confiável dos dados  

**Observação:**  
É robusto para dados estruturados, mas não recomendado para sincronização em nuvem sem um backend.  

---

## 3. Quais são os tipos de dados básicos que posso armazenar em um banco de dados SQLite?  
**Resposta:**  
- INTEGER – números inteiros  
- REAL – números de ponto flutuante  
- TEXT – textos e strings  
- BLOB – dados binários (imagens, arquivos)  
- NULL – valores nulos  

**Observação:**  
SQLite é flexível com tipos, mas é importante definir bem as colunas.  

---

## 4. Como posso inserir novos registros em uma tabela SQLite usando Flutter?  
**Resposta:**  
Através do método `insert()` do pacote `sqflite`, passando um mapa com chave-valor correspondente às colunas e valores.  

**Observação:**  
Sempre abrir uma instância do banco antes da operação.  

---

## 5. Como posso inserir vários registros de uma vez em uma tabela SQLite?  
**Resposta:**  
- Utilizar um loop com múltiplos `insert()`  
- Ou encapsular as inserções dentro de uma `batch` ou `transaction` para melhor performance  

**Observação:**  
Batch é recomendado para muitas inserções de uma só vez.  

---

## 6. Como posso obter o ID do último registro inserido em uma tabela SQLite?  
**Resposta:**  
O método `insert()` retorna automaticamente o ID do registro inserido se a tabela tiver uma chave primária autoincrementável.  

**Observação:**  
Isso é útil para relacionar registros entre tabelas.  

---

## 7. Como posso filtrar os resultados de uma consulta usando a cláusula WHERE?  
**Resposta:**  
Usando o parâmetro `where` nos métodos `query()` ou executando uma instrução SQL com WHERE.  

**Observação:**  
Permite buscar registros específicos, como `WHERE id = 1`.  

---

## 8. Como posso agrupar os resultados de uma consulta usando a cláusula GROUP BY?  
**Resposta:**  
Adicionando o parâmetro `groupBy` no método `query()` ou usando diretamente SQL com `GROUP BY`.  

**Observação:**  
Útil para agregações, como somar valores por categoria.  

---

## 9. Como posso excluir registros de uma tabela SQLite usando Flutter?  
**Resposta:**  
Utilizando o método `delete()` do pacote `sqflite`, com uma condição `where` para evitar excluir tudo.  

**Observação:**  
Sempre usar WHERE para segurança nas exclusões.  

---

## 10. Quais os cuidados necessários ao usar UPDATE, INSERT e DELETE?  
**Resposta:**  
- Sempre usar WHERE para UPDATE e DELETE para evitar modificar tudo acidentalmente  
- Validar os dados antes de qualquer INSERT ou UPDATE  
- Utilizar transações para operações críticas ou em lote  
- Tratar erros e exceções adequadamente  

**Observação:**  
Essas operações afetam diretamente os dados, portanto, são críticas.  

---

## 11. Como posso criar tabelas relacionadas em um banco de dados SQLite?  
**Resposta:**  
Usando chaves estrangeiras (`FOREIGN KEY`) na criação das tabelas, vinculando uma tabela à outra.  

**Observação:**  
Isso garante integridade referencial entre os dados.  

---

## 12. Como posso consultar dados de tabelas relacionadas usando JOIN?  
**Resposta:**  
Utilizando comandos SQL como `INNER JOIN`, `LEFT JOIN` para combinar dados de duas ou mais tabelas com base em uma chave comum.  

**Observação:**  
JOINs permitem criar consultas poderosas e eficientes.  

---

## 13. O que são transações em um banco de dados SQLite e por que são importantes?  
**Resposta:**  
Transações são blocos de operações que são executadas de forma atômica. Se uma falhar, todas são revertidas. Isso garante integridade dos dados.  

**Observação:**  
Indispensável para operações em lote ou críticas.  

---

## 14. Como posso reverter uma transação em caso de erro?  
**Resposta:**  
O próprio SQLite reverte a transação automaticamente se ocorrer uma exceção dentro de um bloco `transaction` no Flutter.  

**Observação:**  
O controle de erros com try-catch é essencial nesse processo.  

---

## 15. Quais são as vantagens de usar transações para garantir a integridade dos dados?  
**Resposta:**  
- Evita dados inconsistentes em caso de falha  
- Garante que todas as operações sejam bem-sucedidas antes de serem confirmadas  
- Melhora performance em operações em lote  

**Observação:**  
Sempre utilizar transações em atualizações complexas ou múltiplas inserções.  

---

## 16. Como posso criar um banco de dados e uma tabela em SQLite usando Flutter?  
**Resposta:**  
Usando o método `openDatabase()` e dentro dele executar um SQL `CREATE TABLE` na função `onCreate`.  

**Observação:**  
O banco é criado no armazenamento local do dispositivo.  

---

## 17. Dicas de como otimizar minhas consultas?  
**Resposta:**  
- Utilizar índices (`INDEX`) nas colunas mais buscadas  
- Usar WHERE e LIMIT para restringir resultados  
- Fazer JOINs apenas quando necessário  
- Usar transações para múltiplas operações  
- Evitar SELECT * (selecione apenas as colunas necessárias)  

**Observação:**  
Consultas bem otimizadas melhoram muito a performance do app.  

---

