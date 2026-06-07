import "dart:convert";
import "package:http/http.dart" as http;
import "movie_model.dart";

class ApiServices {
  static Future<MovieModel?> getMovie({ String titulo = "" }) async {
    String tituloFormatado = Uri.encodeComponent(titulo);
    String endpoint = "https://www.omdbapi.com/?t=$tituloFormatado&apikey=d258229f";

    final resposta = await http.get(Uri.parse(endpoint));

    if (resposta.statusCode == 200) {
      var jsonResponse = jsonDecode(resposta.body);
      if(jsonResponse['Response'] == 'False') return null;
      return MovieModel.fromJson(jsonResponse);
    } else {
      return null;
    }
  }
}