import 'package:flutter/material.dart';
import 'package:list_videos/global.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SettingsTheme extends StatefulWidget {
  const SettingsTheme({super.key});

  @override
  State<SettingsTheme> createState() => _SettingsThemeState();
}

class _SettingsThemeState extends State<SettingsTheme> {
  Cores? corSelecionadaBackground;
  Cores? corSelecionadaAppBar;


  @override
  Widget build(BuildContext context) {
    final themeBackgroud = context
        .read<SettingsThemeRepository>()
        .getBackground;
    final themeAppBar = context.read<SettingsThemeRepository>().getAppBar;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Configurações',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: themeAppBar,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.task_alt, size: 35),
            color: Colors.black,
          ),
        ],
      ),
      backgroundColor: themeBackgroud,
      body: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Tema',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text('Cor da barra de tarefas', style: TextStyle(fontSize: 20)),

            /// TODO: AppBar
            DropdownButton<Cores>(
              value: corSelecionadaAppBar,
              hint: Text('Escolha uma cor'),
              items: Cores.values.map((cor) {
                return DropdownMenuItem(
                  alignment: Alignment.centerRight,
                  value: cor,
                  child: Row(
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: EnumParaColor(cor),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black, // Shadow color
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(EnumParaString(cor)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (valor) async {
                setState(() {
                  corSelecionadaAppBar = valor!;
                });
                context.read<SettingsThemeRepository>().incluirAppBar(
                  EnumParaColor(valor!),
                );

                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setString(
                  Constants().appBarColorKey,
                  EnumParaString(corSelecionadaAppBar ?? Cores.azul),
                );
              },
            ),

            SizedBox(height: 15),
            Text('Cor do fundo da aplicação', style: TextStyle(fontSize: 20)),

            /// TODO: Backgroud
            DropdownButton<Cores>(
              value: corSelecionadaBackground,
              hint: Text('Escolha uma cor'),
              focusColor: Colors.white,
              items: Cores.values.map((cor) {
                return DropdownMenuItem(
                  alignment: Alignment.centerRight,
                  value: cor,
                  child: Row(
                    children: [
                      Container(
                        width: 20.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                          color: EnumParaColor(cor),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black, // Shadow color
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(EnumParaString(cor)),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (valor) async {
                setState(() {
                  corSelecionadaBackground = valor!;
                });
                context.read<SettingsThemeRepository>().incluirBackground(
                  EnumParaColor(valor!),
                );

                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setString(
                  Constants().backgroundColorKey,
                  EnumParaString(corSelecionadaBackground ?? Cores.branco),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

enum Cores { azul, roxo, verde, laranja, amarelo, branco }

String EnumParaString(Cores cor) {
  switch (cor) {
    case Cores.azul:
      return 'Azul';
    case Cores.roxo:
      return 'Roxo';
    case Cores.verde:
      return 'Verde';
    case Cores.laranja:
      return 'Laranja';
    case Cores.amarelo:
      return 'Amarelo';
    case Cores.branco:
      return 'Branco';
  }
}

Cores StringParaEnum(String cor) {
  switch (cor) {
    case 'Azul':
      return Cores.azul;
    case 'Roxo':
      return Cores.roxo;
    case 'Verde':
      return Cores.verde;
    case 'Laranja':
      return Cores.laranja;
    case 'Amarelo':
      return Cores.amarelo;
    case 'Branco':
      return Cores.branco;
    default:
      return Cores.branco;
  }
}

Color EnumParaColor(Cores cor) {
  switch (cor) {
    case Cores.azul:
      return Color.fromRGBO(103, 162, 255, 1.0);
    case Cores.roxo:
      return Color.fromRGBO(240, 130, 255, 1.0);
    case Cores.verde:
      return Color.fromRGBO(154, 255, 92, 1.0);
    case Cores.laranja:
      return Color.fromRGBO(255, 149, 92, 1.0);
    case Cores.amarelo:
      return Color.fromRGBO(255, 217, 92, 1.0);
    case Cores.branco:
      return Color.fromRGBO(255, 255, 255, 1.0);
  }
}
