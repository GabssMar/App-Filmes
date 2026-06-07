class MovieModel {
  String titulo;
  String ano;
  String diretor;
  String poster;

  MovieModel({required this.titulo, required this.ano, required this.diretor, required this.poster});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      titulo: json['Title'] ?? 'Sem título',
      ano: json['Year'] ?? '',
      diretor: json['Director'] ?? '',
      poster: json['Poster'] ?? '',
    );
  }
}