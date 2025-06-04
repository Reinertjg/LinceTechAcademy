import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:tools_app/modules/conversor_moedas/controller/conversor_moedas_controller.dart';

import '../models/tipo_conversor.dart';
import '../services/moeda_service.dart';

class ConversorMoeda extends StatefulWidget {
  const ConversorMoeda({super.key});

  @override
  State<ConversorMoeda> createState() => _ConversorMoedaState();
}

class _ConversorMoedaState extends State<ConversorMoeda> {
  final controller = ConversorMoedasController();
  final service = MoedaService();

  @override
  void dispose() {
    controller.origemController.dispose();
    controller.destinoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    carregarMoedasData();
  }

  Future<void> carregarMoedasData() async {
    await service.createMapData();
    setState(() {}); // força a reconstrução da tela após o Future terminar
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Conversor de Moedas',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              setState(() {
                carregarMoedasData();
              });
            },
          ),
        ],
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 20, 70, 1),
      ),
      backgroundColor: Color.fromRGBO(230, 230, 230, 1),
      body: Padding(
        padding: EdgeInsets.all(16.0),

        // Container Branco
        child: Container(
          padding: EdgeInsets.all(20.0),
          height: MediaQuery.of(context).size.width * 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.white,
          ),

          child:
          /// TODO: Campo Quantia
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                      // Campo de texto para a origem
                      child: TextField(
                        controller: controller.origemController,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          hintText: 'Digite a quantia',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 18,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            controller.campoEditado = CampoEditadoMoeda.origem;
                            controller.calcularConversao();
                          });
                        },
                      ),
                    ),

                    // Dropdown para Moeda de Origem
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: controller.moedaOrigemSelecionada,
                        isDense: true,
                        // Menor altura
                        itemHeight: 48,
                        items:
                            controller.opcoesMoedas.map((tipo) {
                              String label = controller.formatarLabelMoeda(
                                tipo,
                              );
                              return DropdownMenuItem(
                                value: tipo,
                                child: Row(
                                  children: [
                                    CountryFlag.fromCurrencyCode(tipo),
                                    SizedBox(width: 8),
                                    Text(label),
                                  ],
                                ),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            controller.atualizarUnidade(
                              atualizandoOrigem: true,
                              novaUnidade: value!,
                            );
                            controller.moedaOrigemSelecionada = value;
                            controller.calcularConversao();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              /// Icons Trocar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        controller.trocarMoedas();
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

              SizedBox(height: 30),

              /// TODO: Campo Converter para
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      'Converter para',
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
                          // Campo de texto para a origem
                          child: TextField(
                            controller: controller.destinoController,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Valor convertido',
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 18,
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              setState(() {
                                controller.campoEditado =
                                    CampoEditadoMoeda.destino;
                                controller.calcularConversao();
                              });
                            },
                          ),
                        ),

                        // Dropdown para Moeda de Origem
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            underline: SizedBox(),
                            value: controller.moedaDestinoSelecionada,
                            isDense: true,
                            // Menor altura
                            itemHeight: 48,
                            items:
                                controller.opcoesMoedas.map((tipo) {
                                  String label = controller.formatarLabelMoeda(
                                    tipo,
                                  );
                                  return DropdownMenuItem(
                                    value: tipo,
                                    child: Row(
                                      children: [
                                        CountryFlag.fromCurrencyCode(tipo),
                                        SizedBox(width: 8),
                                        Text(label),
                                      ],
                                    ),
                                  );
                                }).toList(),
                            onChanged: (value) {
                              setState(() {
                                controller.atualizarUnidade(
                                  atualizandoOrigem: false,
                                  novaUnidade: value!,
                                );
                                controller.moedaDestinoSelecionada = value;
                                controller.calcularConversao();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${iconMoedas[controller.moedaOrigemSelecionada]} 100 ${controller.moedaOrigemSelecionada}',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' = ',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${controller.calcularConversaoText()} ${controller.moedaDestinoSelecionada}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(19, 75, 176, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
