import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'movie_model.dart';

class TelaDetalhes extends StatelessWidget {
  final MovieModel filme;

  const TelaDetalhes({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Filme"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: filme.poster,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error, size: 100),
            ),
            const SizedBox(height: 20,),
            Text(
              filme.titulo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10,),
            Text(
              "Ano: ${filme.ano}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10,),
            Text(
              "Diretor: ${filme.diretor}",
              style: const TextStyle(fontSize: 14,),
            ),
          ],
        ),
      ),
    );
  }
}
