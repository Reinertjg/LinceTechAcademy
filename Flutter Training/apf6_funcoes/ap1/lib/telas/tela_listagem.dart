import 'package:flutter/material.dart';
import 'package:ap1/main.dart';
import 'package:provider/provider.dart';

class TelaListagem extends StatefulWidget {
  const TelaListagem({super.key});

  @override
  State<TelaListagem> createState() => _TelaListagemState();
}

class _TelaListagemState extends State<TelaListagem> {
  final filtroController = TextEditingController();
  String filtro = '';

  @override
  Widget build(BuildContext context) {
    final lista = context.watch<EstadoListaDePessoas>().pessoas;
    final listaFiltrada =
        lista.where((p) => p.nome.toLowerCase().contains(filtro)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Listagem'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: filtroController,
              decoration: InputDecoration(
                labelText: 'Filtrar por nome',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                setState(() {
                  filtro = valor.toLowerCase();
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listaFiltrada.length,
              itemBuilder: (context, index) {
                final pessoa = listaFiltrada[index];
                return ListTile(
                  title: Text(pessoa.nome),
                  subtitle: Text(pessoa.email),
                  trailing: PopupMenuButton<String>(
                    itemBuilder:
                        (context) => [
                          const PopupMenuItem(
                            child: Text('Editar'),
                            value: 'editar',
                          ),
                          const PopupMenuItem(child: Text('Excluir'), value: 'excluir',),
                        ],
                    onSelected: (valor) {
                      if (valor == 'editar') {

                      } else if (valor== 'excluir') {
                        Provider.of<EstadoListaDePessoas>(context, listen: false).excluir(pessoa);
                      }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Color corPorTipoSanguineo(TipoSanguineo tipo) {
  switch (tipo) {
    case TipoSanguineo.aPositivo:
      return Colors.blue;
    case TipoSanguineo.aNegativo:
      return Colors.red;
    case TipoSanguineo.abPositivo:
      return Colors.white;
    case TipoSanguineo.abNegativo:
      return Colors.yellow;
    case TipoSanguineo.bPositivo:
      return Colors.green;
    case TipoSanguineo.bNegativo:
      return Colors.deepOrangeAccent;
    case TipoSanguineo.oPositivo:
      return Colors.cyan;
    case TipoSanguineo.oNegativo:
      return Colors.pinkAccent;
  }
}
