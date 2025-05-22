import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'produtos_model.dart';

class ListarProdutos extends StatefulWidget {
  const ListarProdutos({super.key});

  @override
  State<ListarProdutos> createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  List<String> listaProduto = List<String>.generate(
    20,
        (i) => 'Produto ${i + 1}',
  );

  Future<List<Produto>> _getProdutos() async {
    Uri url = Uri.parse(
      'https://api.json-generator.com/templates/SFhy78n33IvS/data?access_token=htth6zeba74eubpy3a2k5z5dr3z5lb5sbmqpw4qz',
    );
    print(url);

    var response = await http.get(url);
    var dados = json.decode(response.body) as List;

    List<Produto> produtos = [];

    dados.forEach((elemento) {
      print(elemento['produto']);

      Produto produto = Produto(
        elemento['produto_id'],
        elemento['produto'],
        elemento['endereco'],
        elemento['descricao'],
        elemento['imagem'],
        int.parse(elemento['quantidade']),
        double.parse(elemento['preco']),
      );

      produtos.add(produto);
    });
    return produtos;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('List View')),
        body: FutureBuilder(
          future: _getProdutos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Text('Carregando...');
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, indice) {
                  return ListTile(
                    leading: Image.network(
                      'https://i.pinimg.com/736x/5a/a0/71/5aa07122296293d574c1ee4e8e1ab584.jpg',
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${snapshot.data[indice].produto}',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'R\$ ${snapshot.data[indice].preco}',
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),

                        ),
                      ],
                    ),
                    subtitle: Text(snapshot.data[indice].descricao.toString().substring(0, 30) + '...'),
                    onTap: () {
                      print(
                        'O Produto selecionado foi ${listaProduto[indice]}, na posição $indice',
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

