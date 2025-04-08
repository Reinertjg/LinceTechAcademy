
void main() {

  Map<String, int?> listaPessoas =
  {
    "Nelson": null,
    "Jane": null,
    "Jack": 16,
    "Rupert": 37,
    "Andy": 13,
    "Kim": 27,
    "Robert": 31,
  };

  for (var pessoa in listaPessoas.entries) {
    print("${pessoa.key} - ${pessoa.value ?? "idade não informada"}");
  }

}



