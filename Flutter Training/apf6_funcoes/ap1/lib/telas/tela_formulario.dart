import 'package:ap1/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class TelaFormulario extends StatefulWidget {
  const TelaFormulario({super.key});

  @override
  State<TelaFormulario> createState() => _TelaFormularioState();
}

class _TelaFormularioState extends State<TelaFormulario> {
  final key = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController githublController = TextEditingController();

  String nome = '';
  String email = '';
  String telefone = '';
  String github = '';
  TipoSanguineo? tipoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
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
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: emailController,
                  validator: (text) {
                    if ((text == null || text.isEmpty)) {
                      return 'Informe um e-mail';
                    } else if (!text.contains('@'))  {
                      return 'E-mail inválido';
                    }
                    email = text;
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Telefone'),
                  controller: telefoneController,
                  keyboardType: TextInputType.number,
                  validator: (text) {
                    if ((text == null || text.isEmpty)) {
                      return 'Informe um Telefone';
                    } else if (text.length < 10)  {
                      return 'Telefone inválido';
                    }
                    telefone = text;
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Github'),
                  controller: githublController,
                  validator: (text) {
                    if ((text == null || text.isEmpty)) {
                      return 'Informe um github';
                    }
                    github = text;
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                DropdownButtonFormField<TipoSanguineo>(
                  value: tipoSelecionado,
                  items: TipoSanguineo.values.map((tipo) {
                    return DropdownMenuItem(
                      value: tipo,
                      child: Text(descreverTipo(tipo)),
                    );
                  }).toList(),
                  onChanged: (novoTipo) {
                    setState(() {
                      tipoSelecionado = novoTipo!;
                    });
                  },
                  validator: (valor) =>
                  valor == null ? 'Selecione um tipo sanguíneo' : null,
                ),

                const SizedBox(height: 60),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (key.currentState?.validate() ?? false) {
                        final novaPessoa = Pessoa(
                          nome: nomeController.text,
                          email: emailController.text,
                          telefone: telefoneController.text, // você ainda não criou esse campo
                          github: githublController.text, // nem este
                          tipoSanguineo: tipoSelecionado!,
                        );
                        context.read<EstadoListaDePessoas>().incluir(novaPessoa);
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: Text('Salvar'),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

String descreverTipo(TipoSanguineo tipo) {
  switch (tipo) {
    case TipoSanguineo.aPositivo: return 'A+';
    case TipoSanguineo.aNegativo: return 'A-';
    case TipoSanguineo.bPositivo: return 'B+';
    case TipoSanguineo.bNegativo: return 'B-';
    case TipoSanguineo.oPositivo: return 'O+';
    case TipoSanguineo.oNegativo: return 'O-';
    case TipoSanguineo.abPositivo: return 'AB+';
    case TipoSanguineo.abNegativo: return 'AB-';
  }
}