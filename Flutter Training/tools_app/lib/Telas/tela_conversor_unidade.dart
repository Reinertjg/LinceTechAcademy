import 'package:flutter/material.dart';

class ConversorUnidade extends StatefulWidget {
  const ConversorUnidade({super.key});

  @override
  State<ConversorUnidade> createState() => _ConversorUnidadeState();
}

class _ConversorUnidadeState extends State<ConversorUnidade> {
  TipoConversor? tipoSelecionado;
  TipoDistancia? tipoSelecionadoD;

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
          height: 330,
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
                    TipoConversor.values.map((tipo) {
                      return DropdownMenuItem(
                        value: tipo,
                        child: Text(descreverTipo(tipo)),
                      );
                    }).toList(),
                onChanged: (value) {
                  setState(() {
                    tipoSelecionado = value!;
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
                decoration:
                BoxDecoration(
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
                      child: DropdownButton<TipoDistancia>(
                        underline: SizedBox(),
                        value: tipoSelecionadoD,
                        isDense: true,             // Menor altura
                        itemHeight: 48,
                        items:
                            TipoDistancia.values.map((tipo) {
                              return DropdownMenuItem(
                                value: tipo,
                                child: Text(descreverTipoDistancia(tipo)),
                              );
                            }).toList(),
                        onChanged: (value) {
                          setState(() {
                            tipoSelecionadoD = value!;
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
                decoration:
                BoxDecoration(
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
                      child: DropdownButton<TipoDistancia>(
                        underline: SizedBox(),
                        value: tipoSelecionadoD,
                        isDense: true,             // Menor altura
                        itemHeight: 48,
                        items:
                        TipoDistancia.values.map((tipo) {
                          return DropdownMenuItem(
                            value: tipo,
                            child: Text(descreverTipoDistancia(tipo)),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            tipoSelecionadoD = value!;
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
                  Text('1 Km', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text(' = ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  Text('1000 m', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color.fromRGBO(19, 75, 176, 1)),),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}

enum TipoConversor { distancia, peso, temperatura }

enum TipoDistancia { cemtimetros, metros, kilometros }

enum TipoPeso { miligrama, grama, kilograma }

enum TipoTemperatura { celsius, kelvin, fahrenheit }

String descreverTipo(TipoConversor tipo) {
  return switch (tipo) {
    TipoConversor.distancia => 'Distancia',
    TipoConversor.peso => 'Peso',
    TipoConversor.temperatura => 'Temperatura',
  };
}

String descreverTipoDistancia(TipoDistancia tipo) {
  return switch (tipo) {
    TipoDistancia.cemtimetros => 'CM',
    TipoDistancia.metros => 'M',
    TipoDistancia.kilometros => 'KM',
  };
}
