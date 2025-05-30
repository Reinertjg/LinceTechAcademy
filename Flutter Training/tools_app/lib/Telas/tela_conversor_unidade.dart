import 'package:flutter/material.dart';

class ConversorUnidade extends StatefulWidget {
  const ConversorUnidade({super.key});

  @override
  State<ConversorUnidade> createState() => _ConversorUnidadeState();
}

class _ConversorUnidadeState extends State<ConversorUnidade> {
  TipoConversor? tipoSelecionado;
  String? unidadeOrigemSelecionada;
  String? unidadeDestinoSelecionada;

  final Map<TipoConversor, List<String>> dadosSelecioandos = {
    TipoConversor.distancia: ['Km', 'm', 'cm'],
    TipoConversor.temperatura: ['Celsius', 'Fahrenheit', 'Kelvin'],
    TipoConversor.peso: ['Kg', 'g', 'mg'],
  };

  List<String> opcoesUnidades = [];

  void atualizarUnidade({
    required bool atualizandoOrigem,
    required String novaUnidade,
  }) {
    if (atualizandoOrigem) {
      final temp = unidadeOrigemSelecionada;
      unidadeOrigemSelecionada = novaUnidade;

      if (unidadeOrigemSelecionada == unidadeDestinoSelecionada) {
        unidadeOrigemSelecionada = unidadeDestinoSelecionada;
        unidadeDestinoSelecionada = temp;
      }
    } else {
      final temp = unidadeDestinoSelecionada;
      unidadeDestinoSelecionada = novaUnidade;

      if (unidadeOrigemSelecionada == unidadeDestinoSelecionada) {
        unidadeDestinoSelecionada = unidadeOrigemSelecionada;
        unidadeOrigemSelecionada = temp;
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Conversor de unidades',
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
                value: tipoSelecionado,
                items:
                    dadosSelecioandos.keys.map((tipo) {
                      return DropdownMenuItem(
                        value: tipo,
                        child: Text(descreverTipo(tipo)),
                      );
                    }).toList(),
                onChanged: (TipoConversor? value) {
                  setState(() {
                    if (value == null) return;
                    tipoSelecionado = value;
                    opcoesUnidades = dadosSelecioandos[value] ?? [];
                    unidadeOrigemSelecionada = opcoesUnidades[0];
                    unidadeDestinoSelecionada = opcoesUnidades[1];
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
                        decoration: InputDecoration(
                          hintText: '0',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: unidadeOrigemSelecionada,
                        isDense: true,
                        // Menor altura
                        itemHeight: 48,
                        items:
                            opcoesUnidades.map((tipo) {
                              return DropdownMenuItem(
                                value: tipo,
                                child: Text(tipo),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            atualizarUnidade(atualizandoOrigem: true, novaUnidade: value!);
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
                        decoration: InputDecoration(
                          hintText: '0',
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        underline: SizedBox(),
                        value: unidadeDestinoSelecionada,
                        isDense: true,
                        // Menor altura
                        itemHeight: 48,
                        items:
                            opcoesUnidades.map((tipo) {
                              return DropdownMenuItem(
                                value: tipo,
                                child: Text(tipo),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            atualizarUnidade(atualizandoOrigem: false, novaUnidade: value!);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Text Conversão 1:1
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '1 Km',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    ' = ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '1000 m',
                    style: TextStyle(
                      fontSize: 24,
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

enum TipoConversor { distancia, peso, temperatura }

String descreverTipo(TipoConversor tipo) {
  return switch (tipo) {
    TipoConversor.distancia => 'Distancia',
    TipoConversor.peso => 'Peso',
    TipoConversor.temperatura => 'Temperatura',
  };
}
