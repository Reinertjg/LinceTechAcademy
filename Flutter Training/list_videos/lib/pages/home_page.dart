import 'package:flutter/material.dart';
import 'package:list_videos/services/create_favorite_service.dart';
import 'package:provider/provider.dart';

import '../main.dart';
import '../models/video_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final filtroController = TextEditingController();
  String filtro = '';
  bool isFiltered = false;

  @override
  Widget build(BuildContext context) {
    final themeBackgroud = context
        .read<SettingsThemeRepository>()
        .getBackground;
    final themeAppBar = context.read<SettingsThemeRepository>().getAppBar;
    final lista = context.watch<CreateFavoriteRepository>().favorites;
    final listaFiltrada =
    lista.where((v) => v.title.toLowerCase().contains(filtro)).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: isFiltered ?
            TextField(
              controller: filtroController,
              decoration: InputDecoration(
                hintText: 'Pesquisar vídeos...',
                border: InputBorder.none,
              ),
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                  setState(() {
                    filtro = value.toLowerCase();
                  });
              },
            )
          : Text(
            'Favortitos YT',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          backgroundColor: themeAppBar,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search_rounded, color: Colors.black, size: 35),
              onPressed: () {
                setState(() {
                  isFiltered = !isFiltered;
                });
              },
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.settings, color: Colors.black, size: 35),
              onPressed: () {
                Navigator.pushNamed(context, '/settingsTheme');
              },
            ),
            SizedBox(width: 10),
          ],
        ),
        backgroundColor: themeBackgroud,
        body: Column(
          children: [
            Expanded(
              child: Consumer<CreateFavoriteRepository>(
                builder: (context, favoriteRepository, child) {
                  if (favoriteRepository.favorites.isEmpty) {
                    return Center(
                      child: ListTile(
                        leading: Icon(Icons.star_border),
                        title: Text(
                          'Nenhum vídeo favorito encontrado.',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: listaFiltrada.length,
                    itemBuilder: (_, index) {
                      final favoriteVideo = listaFiltrada[index];
                      return Card(
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    favoriteVideo.thumbnailUrl,
                                    width: 400,
                                    height: 185,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(favoriteVideo.title),

                              Text(favoriteVideo.category),
                            ],
                          ),
                        ),
                      );
                    }
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/create');
          },
          tooltip: 'Favoritar',
          backgroundColor: themeAppBar,
          child: const Icon(Icons.add, color: Colors.black, size: 35),
        ),
      ),
    );
  }
}

class FavoriteVideoCard extends StatefulWidget {
  final FavoriteVideo favoriteVideo;

  const FavoriteVideoCard({super.key, required this.favoriteVideo});

  @override
  State<FavoriteVideoCard> createState() => _FavoriteVideoCardState();
}

class _FavoriteVideoCardState extends State<FavoriteVideoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.favoriteVideo.thumbnailUrl,
                width: 400,
                height: 195,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 6),

            Text(widget.favoriteVideo.title),

            Text(widget.favoriteVideo.category),
          ],
        ),
      ),
    );
  }
}
