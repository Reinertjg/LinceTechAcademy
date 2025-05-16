apf3_funcoesimport 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _tela());
  }
}

class _tela extends StatefulWidget {
  const _tela({super.key});

  @override
  State<_tela> createState() => _telaState();
}

class _telaState extends State<_tela> {
  final key = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController idadeController = TextEditingController();

  String nome = '';
  int idade = 0;
  bool inativo = true;
  Color corArea = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Cadastro', style: TextStyle(fontSize: 25)),

                const SizedBox(height: 30),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  controller: nomeController,
                  validator: (text) {
                    if (text!.isEmpty) {
                      return 'Não pode ser vazio';
                    } else if (text.length < 3) {
                      return 'Não pode ter menos de 3 letras';
                    } else if (!RegExp(r'^[A-Z]').hasMatch(text)) {
                      return 'Precisa começar com uma letra maiúscula';
                    }
                    nome = text;
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Idade'),
                  controller: idadeController,
                  keyboardType: TextInputType.number,
                  validator: (text) {
                    if (int.tryParse(text!) == null) {
                      return 'Precisa ser um número valido';
                    } else if (int.parse(text) < 18) {
                      return 'Precisa ser maior ou igual a 18 anos';
                    }
                    idade = int.parse(text);
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Checkbox(
                      value: inativo,
                      onChanged: (checked) {
                        setState(() {
                          inativo = !inativo;
                        });
                      },
                    ),
                    Text('Inativo')
                ]),
                

                const SizedBox(height: 60),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if(key.currentState?.validate() ?? false) {
                        if(inativo == false) {
                          corArea = Colors.green;
                        } else {
                          corArea = Colors.grey;
                        }
                      }
                    });

                  },
                  child: Text('Salvar'),
                ),

                const SizedBox(height: 60),

                Container(
                  width: 50,
                  height: 50,
                  color: corArea,
                  child: Center(
                    child:
                    Text('Nome: $nome \nIdade: $idade'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
