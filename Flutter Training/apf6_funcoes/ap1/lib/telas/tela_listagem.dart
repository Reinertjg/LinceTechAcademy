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
                return Card(
                  color: corPorTipoSanguineo(pessoa.tipoSanguineo).withValues(alpha: (0.6)),
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                pessoa.nome,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            PopupMenuButton(
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                  value: 'editar',
                                  child: Text('Editar'),
                                ),
                                const PopupMenuItem(
                                  value: 'excluir',
                                  child: Text('Excluir'),
                                ),
                              ],
                              onSelected: (value) {
                                if (value == 'editar') {
                                  Navigator.pushNamed(
                                    context,
                                    '/formulario',
                                    arguments: pessoa,
                                  );
                                } else if (value == 'excluir') {
                                  context.read<EstadoListaDePessoas>().excluir(pessoa);
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text('Email: ${pessoa.email}'),
                        Text('Telefone: ${pessoa.telefone}'),
                        Text('GitHub: ${pessoa.github}'),
                        Text('Tipo sanguíneo: ${descreverTipo(pessoa.tipoSanguineo)}'),
                      ],
                    ),
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

String descreverTipo(TipoSanguineo tipo) {
  switch (tipo) {
    case TipoSanguineo.aPositivo:
      return "A+";                // A+
    case TipoSanguineo.aNegativo:
      return "A-";                // A-
    case TipoSanguineo.bPositivo:
      return "B+";                // B+
    case TipoSanguineo.bNegativo:
      return "B-";                // B-
    case TipoSanguineo.oPositivo:
      return "O+";                // O+
    case TipoSanguineo.oNegativo:
      return "O-";                // O-
    case TipoSanguineo.abPositivo:
      return "AB+";               // AB+
    case TipoSanguineo.abNegativo:
      return "AB-";               // AB_
  }
}


Color corPorTipoSanguineo(TipoSanguineo tipo) {
  switch (tipo) {
    case TipoSanguineo.aPositivo:
      return Colors.blue;        // A+ → Azul
    case TipoSanguineo.aNegativo:
      return Colors.red;         // A- → Vermelho
    case TipoSanguineo.bPositivo:
      return Colors.purple;      // B+ → Roxo
    case TipoSanguineo.bNegativo:
      return Colors.orange;      // B- → Laranja
    case TipoSanguineo.oPositivo:
      return Colors.green;       // O+ → Verde
    case TipoSanguineo.oNegativo:
      return Colors.yellow;      // O- → Amarelo
    case TipoSanguineo.abPositivo:
      return Colors.cyan;        // AB+ → Ciano
    case TipoSanguineo.abNegativo:
      return Colors.white;       // AB- → Branco
  }
}
