import 'dart:convert';
import 'package:draft/detalhers_produto.dart';
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

  Future<List<Produto>> _getProdutos() async {
    try {
      Uri url = Uri.parse(
        'https://api.json-generator.com/templates/SFhy78n33IvS/data?access_token=htth6zeba74eubpy3a2k5z5dr3z5lb5sbmqpw4qz',
      );
      print('Buscando: $url');

      var response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Erro na requisição: ${response.statusCode}');
      }

      var dados = json.decode(response.body) as List;
      List<Produto> produtos = [];

      for (var elemento in dados) {
        print(elemento); // para debug

        produtos.add(Produto(
          elemento['produto_id'], // verifique se essa chave existe
          elemento['produto'],
          elemento['endereco'],
          elemento['descricao'],
          elemento['imagem'],
          int.tryParse(elemento['quantidade'].toString()) ?? 0,
          double.tryParse(elemento['preco'].toString()) ?? 0.0,
        ));
      }

      return produtos;
    } catch (e) {
      print('Erro ao carregar produtos: $e');
      return [];
    }
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
                      snapshot.data[indice].imagem,
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
                    subtitle: Text('${snapshot.data[indice].descricao.toString().substring(0, 30)}...'),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return DetalhesProdutos(
                          produtoId: snapshot.data[indice].produtoId,
                          produto: snapshot.data[indice].produto,
                          descricao: snapshot.data[indice].descricao,
                          imagem: snapshot.data[indice].imagem,
                          preco: snapshot.data[indice].preco,
                        );
                      }));
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

