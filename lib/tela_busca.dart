import 'package:flutter/material.dart';
import 'api_services.dart';
import 'movie_model.dart';
import 'tela_detalhes.dart';

class TelaBusca extends StatefulWidget {
  const TelaBusca({super.key});

  @override
  State<StatefulWidget> createState() => _TelaBusca();
}

class _TelaBusca extends State<TelaBusca> {
  final _tituloController = TextEditingController();

  var _carregando = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 240,
                    child: TextField(
                      controller: _tituloController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text("Título do Filme"),
                          hintText: "Digite e toque em buscar"
                      ),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _carregando = true;
                        });

                        MovieModel? dados = await ApiServices.getMovie(
                          titulo: _tituloController.text,
                        );

                        if (dados == null) {
                          if (!mounted) {
                            return;
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Filme não encontrado"))
                            );
                            setState(() {
                              _carregando = false;
                            });
                          }
                        } else {
                          setState(() {
                            _carregando = false;
                          });

                          if (!mounted) return;

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TelaDetalhes(filme: dados),
                            ),
                          );
                        }
                      },
                      child: _carregando
                          ? const SizedBox(
                          width: 15,
                          height: 15,
                          child: CircularProgressIndicator()
                      )
                          : const Text("Buscar")
                  )
                ],
              ),
            ],
          )
      ),
    );
  }
}