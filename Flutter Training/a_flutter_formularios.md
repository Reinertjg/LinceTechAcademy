# Usando IA como apoio – Flutter: Formulários  
Lince Tech Academy

---

## 1. O que é um widget TextField em Flutter e para que ele serve?

**Resposta:**  
O widget `TextField` é utilizado para receber entradas de texto do usuário em uma interface Flutter. Ele permite a inserção de dados como texto simples, números ou senhas. É comumente utilizado em formulários para coletar informações de usuários.

**Observação:**  
Compreendi que o `TextField` é um dos widgets mais fundamentais para interação com o usuário em apps de formulário.

---

## 2. Como posso obter o valor digitado pelo usuário em um TextField?

**Resposta:**  
O valor digitado pelo usuário pode ser obtido utilizando um `TextEditingController`. Você associa o `controller` ao `TextField` e pode acessar o texto inserido por meio da propriedade `controller.text`.

**Observação:**  
Agora entendo que o `TextEditingController` é fundamental para manipular e recuperar os dados do `TextField` de forma eficiente.

---

## 3. Qual a diferença entre um TextField e um TextFormField?

**Resposta:**  
A diferença principal é que o `TextFormField` é um widget especializado para ser usado dentro de um formulário (`Form`). Ele oferece funcionalidades como validação de campos e gerenciamento do estado, facilitando o uso em formulários complexos. Já o `TextField` é um widget mais simples e não possui suporte direto para validação.

**Observação:**  
Agora sei que o `TextFormField` deve ser usado quando precisar de validação e integração com formulários, enquanto o `TextField` é mais adequado para entradas simples.

---

## 4. Quais parâmetros importantes do TextField?

**Resposta:**  
Alguns parâmetros importantes do `TextField` incluem:

- `controller`: Controla o texto inserido.
- `decoration`: Permite personalizar o estilo do campo, incluindo bordas, ícones e rótulos.
- `keyboardType`: Define o tipo de teclado exibido, como numérico, email, etc.
- `obscureText`: Usado para ocultar o texto, como em campos de senha.
- `onChanged`: Callback que é chamado sempre que o texto muda.

**Observação:**  
Esses parâmetros proporcionam flexibilidade na personalização e comportamento do `TextField` dentro da interface.

---

## 5. O que significa validar um campo de texto em Flutter?

**Resposta:**  
Validar um campo de texto em Flutter significa garantir que o valor inserido pelo usuário atenda a certos critérios. Isso pode incluir verificações como se o campo está vazio, se o formato do texto é válido (como um e-mail ou telefone), ou se o valor é dentro de um intervalo esperado.

**Observação:**  
A validação é essencial para garantir a qualidade dos dados inseridos pelos usuários e evitar erros na aplicação.

---

## 6. Qual a diferença entre validação síncrona e assíncrona?

**Resposta:**  
A validação síncrona ocorre de forma imediata, geralmente verificando se o valor inserido corresponde a um critério específico, como um formato de e-mail. Já a validação assíncrona envolve verificações que dependem de recursos externos, como consultar um servidor para verificar se o e-mail já está em uso.

**Observação:**  
Entendi que a escolha entre validação síncrona ou assíncrona depende da necessidade do app, sendo a assíncrona usada quando a validação requer comunicação externa.

---

## 7. O que é um widget CheckBox em Flutter e para que ele serve?

**Resposta:**  
O `CheckBox` é um widget utilizado para permitir ao usuário selecionar ou desmarcar uma opção. Ele é ideal para situações em que várias opções podem ser selecionadas simultaneamente, como em preferências de configuração.

**Observação:**  
Agora entendi como o `CheckBox` pode ser útil para obter respostas em formato binário (selecionado ou não) de múltiplas opções.

---

## 8. Como posso alterar a cor e a forma de um CheckBox?

**Resposta:**  
A cor e a forma de um `CheckBox` podem ser alteradas através da propriedade `activeColor` (para mudar a cor quando marcado) e `shape` (para alterar a forma do `CheckBox`). Usando esses parâmetros, podemos personalizar a aparência de acordo com o tema do aplicativo.

**Observação:**  
Com isso, aprendi que a personalização do `CheckBox` ajuda a melhorar a identidade visual do aplicativo e a experiência do usuário.

---