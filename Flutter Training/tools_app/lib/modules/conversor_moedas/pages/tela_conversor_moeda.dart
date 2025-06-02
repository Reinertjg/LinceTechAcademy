import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:tools_app/modules/conversor_moedas/controller/conversor_moedas_controller.dart';

class ConversorMoeda extends StatefulWidget {
  const ConversorMoeda({super.key});

  @override
  State<ConversorMoeda> createState() => _ConversorMoedaState();
}

class _ConversorMoedaState extends State<ConversorMoeda> {
  final controller = ConversorMoedasController();

  @override
  void dispose() {
    controller.origemController.dispose();
    controller.origemController.dispose();
    super.dispose();
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
        centerTitle: true,
        backgroundColor: Color.fromRGBO(0, 20, 70, 1),
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
                          setState(() {});
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
                              String label;
                              switch (tipo) {
                                case 'USD':
                                  label = 'USD';
                                  break;
                                case 'BRL':
                                  label = 'BRL';
                                  break;
                                default:
                                  label = tipo;
                              }
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
                            controller.moedaOrigemSelecionada = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {});
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
                              setState(() {});
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
                                  String label;
                                  switch (tipo) {
                                    case 'USD':
                                      label = 'USD';
                                      break;
                                    case 'BRL':
                                      label = 'BRL';
                                      break;
                                    default:
                                      label = tipo;
                                  }
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
                                controller.moedaOrigemSelecionada = value;
                              });
                            },
                          ),
                        ),
                      ],
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
