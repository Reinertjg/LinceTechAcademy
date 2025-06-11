import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/create_favorite_controller.dart';
import '../main.dart';
import '../network/noembed_http.dart';

class CreateFavorite extends StatefulWidget {
  const CreateFavorite({super.key});

  @override
  State<CreateFavorite> createState() => _CreateFavoriteState();
}

class _CreateFavoriteState extends State<CreateFavorite> {
  final createFavoriteController = CreateFavoriteController();

  final controllerUrl = TextEditingController();
  final controllerCategory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeAppBar = context.read<SettingsThemeRepository>().getAppBar;

    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Cadastro',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save, size: 35),
            onPressed: () async {
              await createFavoriteController.saveFavorite(
                context,
                controllerUrl.text,
                controllerCategory.text,
              );
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.cancel, size: 35),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            /// TODO: Título do Vídeo
            Text(
              'URL do Vídeo', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: controllerUrl,
              decoration: InputDecoration(
                hintText: 'youtube.com/watch?v=gcklghjBV6c&t',
                labelText: 'URL',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: themeAppBar, width: 2),
                ),
              ),
            ),

            SizedBox(height: 30),

            /// TODO: Categoria do Vídeo
            Text(
              'Categoria (#)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: controllerCategory,
              decoration: InputDecoration(
                hintText: 'jogos,filmes,musica',
                labelText: 'Categoria',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: themeAppBar, width: 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
