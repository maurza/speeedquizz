import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:speedquizz/extras/constants.dart';

class QuizzService {
  Future obtenerPregunta(String tipoPregunta) async {
    http.Response response =
        await http.get(Constants().url + "gPregunta/" + tipoPregunta);

    return json.decode(response.body);
  }
}
