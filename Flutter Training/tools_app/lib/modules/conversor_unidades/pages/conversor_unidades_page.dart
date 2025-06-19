import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../database/db.dart';
import '../models/tipo_conversor.dart';
import '../controllers/conversor_unidades_controller.dart';

class OperationUnidade extends ChangeNotifier {
  final controllerDB = OperacaoUnidadesController();
  final controller = ConversorUnidadesController();

  TextEditingController get origemController => controller.origemController;
  TextEditingController get destinoController => controller.destinoController;
  String? get unidadeOrigemSelecionada => controller.unidadeOrigemSelecionada;
  String? get unidadeDestinoSelecionada => controller.unidadeDestinoSelecionada;

  Future<void> insert() async {
    final operacao = ConversorUnidadesModel(
      valorOrigem: origemController.text,
      tipoOrigem: controller.tipoSelecionado.toString(),
      valorDestino: destinoController.text,
      tipoDestino: controller.unidadeDestinoSelecionada ?? '',
    );

    await controllerDB.insert(operacao);
    notifyListeners();
  }
}

class ConversorUnidade extends StatefulWidget {
  const ConversorUnidade({super.key});

  @override
  State<ConversorUnidade> createState() => _ConversorUnidadeState();
}

class _ConversorUnidadeState extends State<ConversorUnidade> {
  final controller = ConversorUnidadesController();

  @override
  void dispose() {
    controller.origemController.dispose();
    controller.destinoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<OperationUnidade>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Conversor de unidades',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 20, 70, 1),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await state.insert();
            },
            icon: Icon(Icons.save_outlined, size: 35),
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        // Container Branco
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),

          child:
          // Column conversor de unidades
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text Tipo
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Tipo',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Input Tipo
              DropdownButtonFormField<TipoConversor>(
                value: controller.tipoSelecionado,
                items:
                controller.dadosSelecioandos.keys.map((tipo) {
                  return DropdownMenuItem(
                    value: tipo,
                    child: Text(descreverTipo(tipo)),
                  );
                }).toList(),
                onChanged: (TipoConversor? value) {
                  setState(() {
                    if (value == null) return;
                    controller.textConversor = true;
                    controller.tipoSelecionado = value;
                    controller.opcoesUnidades = controller.dadosSelecioandos[value] ?? [];
                    controller.unidadeOrigemSelecionada = controller.opcoesUnidades[0];
                    controller.unidadeDestinoSelecionada = controller.opcoesUnidades[1];
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      // Cor da borda quando o campo ESTÁ focado
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Distancia, peso, temperatura...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      // Cor da borda quando o campo ESTÁ focado
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              /// TODO: Campo Quantia
              // Text Quantia
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Quantia',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Input Quantia
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.origemController,
                        decoration: InputDecoration(
                          hintText: 'Digite a quantia',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            controller.campoEditado = CampoEditadoUnidade.origem;
                            controller.calcularConversao();
                          });
                        },
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: controller.unidadeOrigemSelecionada,
                        isDense: true,
                        // Menor altura
                        itemHeight: 48,
                        items:
                        controller.opcoesUnidades.map((tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(tipo),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            controller.atualizarUnidade(
                              atualizandoOrigem: true,
                              novaUnidade: value!,
                            );
                            controller.campoEditado = CampoEditadoUnidade.origem;
                            controller.calcularConversao();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        controller.trocarUnidades();
                        controller.calcularConversao();
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_downward_rounded,
                          color: Color.fromRGBO(19, 75, 176, 1),
                        ),
                        Icon(
                          Icons.arrow_upward_rounded,
                          color: Color.fromRGBO(19, 75, 176, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              /// TODO: Campo Converter para
              // Text Converter para
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  'Converter para',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              // Output Converter para
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller.destinoController,
                        decoration: InputDecoration(
                          hintText: 'Digite a quantia',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          controller.campoEditado = CampoEditadoUnidade.destino;
                          controller.calcularConversao();
                        },
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: controller.unidadeDestinoSelecionada,
                        isDense: true,
                        // Menor altura
                        itemHeight: 48,
                        items:
                        controller.opcoesUnidades.map((tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(tipo),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            controller.atualizarUnidade(
                              atualizandoOrigem: false,
                                novaUnidade: value!,
                            );
                            controller.calcularConversao();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              /// TODO: Text Conversão 1:1
              // Text Conversão 1:1
              Visibility(
                visible: controller.textConversor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${controller.obterTextoOrigem()} ${controller
                          .unidadeOrigemSelecionada}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      ' = ',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${controller.calcularConversaoText()} ${controller.abreviarTipo(controller.unidadeDestinoSelecionada)}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(19, 75, 176, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}