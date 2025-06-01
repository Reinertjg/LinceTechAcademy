import 'package:flutter/material.dart';

class ConversorUnidade extends StatefulWidget {
  const ConversorUnidade({super.key});

  @override
  State<ConversorUnidade> createState() => _ConversorUnidadeState();
}

class _ConversorUnidadeState extends State<ConversorUnidade> {
  final TextEditingController origemController = TextEditingController();
  final TextEditingController destinoController = TextEditingController();

  TipoConversor? tipoSelecionado;
  String? unidadeOrigemSelecionada;
  String? unidadeDestinoSelecionada;
  bool textConversor = false;

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

  void trocarUnidades() {
    final temp = unidadeOrigemSelecionada;
    unidadeOrigemSelecionada = unidadeDestinoSelecionada;
    unidadeDestinoSelecionada = temp;

    final tempController = origemController.text;
    origemController.text = destinoController.text;
    destinoController.text = tempController;
  }

  String gerarTextoEquivalencia() {
    // Exemplo bem simples:
    // Distancia
    if (unidadeOrigemSelecionada == "Km" && unidadeDestinoSelecionada == "m") {
      return "1000 m";
    } else if (unidadeOrigemSelecionada == "Km" && unidadeDestinoSelecionada == "cm") {
      return "100000 cm";
    } else if (unidadeOrigemSelecionada == "m" && unidadeDestinoSelecionada == "Km") {
      return "0,001 Km";
    } else if (unidadeOrigemSelecionada == "m" && unidadeDestinoSelecionada == "cm") {
      return "100 Cm";
    } else if (unidadeOrigemSelecionada == "cm" && unidadeDestinoSelecionada == "m") {
      return "0,01 m";
    } else if (unidadeOrigemSelecionada == "cm" && unidadeDestinoSelecionada == "Km") {
      return "0,00001 Km";
    }
    // TEMPERATURA
    else if (unidadeOrigemSelecionada == "Celsius" && unidadeDestinoSelecionada == "Fahrenheit") {
      return "32 °F";
    } else if (unidadeOrigemSelecionada == "Celsius" && unidadeDestinoSelecionada == "Kelvin") {
      return "273.15 K";
    } else if (unidadeOrigemSelecionada == "Fahrenheit" && unidadeDestinoSelecionada == "Celsius") {
      return "-17.78 °C";
    } else if (unidadeOrigemSelecionada == "Fahrenheit" && unidadeDestinoSelecionada == "Kelvin") {
      return "255.93 K";
    } else if (unidadeOrigemSelecionada == "Kelvin" && unidadeDestinoSelecionada == "Celsius") {
      return "-272.15 °C";
    } else if (unidadeOrigemSelecionada == "Kelvin" && unidadeDestinoSelecionada == "Fahrenheit") {
      return "-457.87 °F";
    }
  

    // Adicione as outras combinações conforme suas regras de conversão
    return "Conversor não implementado";
  }

  void calcularConversao() {

    final conversor = criarConversorCorreto(); // méodo que instancia a classe correta

    if (campoEditado == CampoEditado.origem) {
      if (origemController.text.isEmpty) {
        destinoController.text = "";
        return;
      }

      double valor = double.tryParse(origemController.text) ?? 0;
      double resultado = conversor.converter(valor, unidadeOrigemSelecionada!, unidadeDestinoSelecionada!);
      destinoController.text = resultado.toString();
    } else if (campoEditado == CampoEditado.destino) {
      if (destinoController.text.isEmpty) {
        origemController.text = "";
        return;
      }

      double valor = double.tryParse(destinoController.text) ?? 0;
      double resultado = conversor.converter(valor, unidadeDestinoSelecionada!, unidadeOrigemSelecionada!);
      origemController.text = resultado.toString();
    }
  }

  // double calcularConversaoText() {
  //   final conversor = criarConversorCorreto(); // méodo que instancia a classe correta
  //   return conversor.converter(1, unidadeOrigemSelecionada!, unidadeDestinoSelecionada!);
  // }

  String obterTextoOrigem() {
    if (tipoSelecionado == TipoConversor.temperatura) {
      return '0';
    } else {
      return "1";
    }
  }

  Conversor criarConversorCorreto() {
    switch (tipoSelecionado) {
      case TipoConversor.distancia:
        return ConversorDistancia();
      case TipoConversor.temperatura:
        return ConversorTemperatura();
      case TipoConversor.peso:
        return ConversorPeso();
      default:
        throw Exception('Conversor não implementado');
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
                    textConversor = true;
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
                        controller: origemController,
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
                        onChanged: (value) {
                          setState(() {
                            campoEditado = CampoEditado.origem;
                            calcularConversao();
                          });
                        },
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
                            campoEditado = CampoEditado.origem;
                            calcularConversao();
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
                        trocarUnidades();
                        calcularConversao();
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
                        controller: destinoController,
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
                        onChanged: (value) {
                          campoEditado = CampoEditado.destino;
                          calcularConversao();
                        },
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
                            campoEditado = CampoEditado.destino;
                            calcularConversao();
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
                visible: textConversor,
                child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${obterTextoOrigem()} $unidadeOrigemSelecionada',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),

                  ),
                  Text(
                    ' = ',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    gerarTextoEquivalencia(),
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

enum CampoEditado { origem, destino }
CampoEditado? campoEditado;

enum TipoConversor { distancia, peso, temperatura }

String descreverTipo(TipoConversor tipo) {
  return switch (tipo) {
    TipoConversor.distancia => 'Distancia',
    TipoConversor.peso => 'Peso',
    TipoConversor.temperatura => 'Temperatura',
  };
}


abstract class Conversor {
  double converter(double valor, String origem, String destino);

}
class ConversorDistancia extends Conversor {
  @override
  double converter(double valor, String origem, String destino) {
    if(origem == "Km" && destino == 'm'){
      return valor * 1000;
    } else if (origem == "Km" && destino == 'cm') {
      return valor * 100000;
    } else if (origem == "m" && destino == 'Km') {
      return valor / 1000;
    } else if (origem == "m" && destino == 'cm') {
      return valor * 100;
    } else if (origem == "cm" && destino == 'Km') {
      return valor / 100000;
    } else if (origem == "cm" && destino == 'm') {
      return valor / 100;
    }
    return 0.0;
  }
}

class ConversorTemperatura extends Conversor {
  @override
  double converter(double valor, String origem, String destino) {
    if (origem == "Celsius" && destino == 'Fahrenheit') {
      return double.parse(((valor * 9 / 5) + 32).toStringAsFixed(2));
    } else if (origem == "Celsius" && destino == 'Kelvin') {
      return double.parse(((valor + 273.15).toStringAsFixed(2)));
    } else if (origem == "Fahrenheit" && destino == 'Celsius') {
      return double.parse((((valor - 32) * 5 / 9).toStringAsFixed(2)));
    } else if (origem == "Fahrenheit" && destino == 'Kelvin') {
      return double.parse(((((valor - 32) * 5 / 9) + 273.15).toStringAsFixed(2)));
    } else if (origem == "Kelvin" && destino == 'Celsius') {
      return double.parse(((valor - 273.15).toStringAsFixed(2)));
    } else if (origem == "Kelvin" && destino == 'Fahrenheit') {
      return double.parse(((((valor - 273.15) * 9 / 5) + 32).toStringAsFixed(2)));
    }
    return 0.0;
  }
}

class ConversorPeso extends Conversor {
  @override
  double converter(double valor, String origem, String destino) {
    // aqui vai a lógica só para distância
    return 0.0;
  }
}
