import 'package:flutter/material.dart';

class DetalhesProdutos extends StatefulWidget {
  final String? produtoId;
  final String? produto;
  final String? descricao;
  final String? imagem;
  final double? preco;
  const DetalhesProdutos({super.key, this.produtoId, this.produto, this.descricao, this.imagem, this.preco});

  @override
  State<DetalhesProdutos> createState() => _DetalhesProdutosState();
}

class _DetalhesProdutosState extends State<DetalhesProdutos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.produto.toString()),
          backgroundColor: Colors.lightGreenAccent,
        ),
        body: Center(
          child: Column(
            children: [
              Image.network(widget.imagem.toString()),
              Text(widget.produto.toString(), style: TextStyle(fontSize: 50),),
              Text(widget.preco.toString()),
              ElevatedButton(onPressed: () {
                Navigator.pop(context);
              }, child: Text('Voltar')),
            ],
          ),
        ),
      ),

    );
  }
}