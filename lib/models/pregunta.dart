class Pregunta {
  String enunciado;
  List<dynamic> opciones;
  String ayuda;
  String tip;
  int tipoPregunta;

  Pregunta(
      {this.enunciado, this.opciones, this.ayuda, this.tip, this.tipoPregunta});

  Pregunta.fromJson(Map<String, dynamic> json) {
    enunciado = json['enunciado'];
    tipoPregunta = json['tipoPregunta'];
    if (json['opciones'] != null) {
      opciones = (json['opciones'] as List).map((v) {
        switch (tipoPregunta) {
          case 4:
            return v;

            break;
          default:
            return (new Opciones.fromJson({...v}));
        }
      }).toList();
    }
    ayuda = json['ayuda'];
    tip = json['tip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enunciado'] = this.enunciado;
    if (this.opciones != null) {
      data['opciones'] = this.opciones.map((v) => v.toJson()).toList();
    }
    data['ayuda'] = this.ayuda;
    data['tip'] = this.tip;
    data['tipoPregunta'] = this.tipoPregunta;

    return data;
  }
}

class Opciones {
  String contenido;
  int correcta;

  Opciones({this.contenido, this.correcta});

  Opciones.fromJson(Map<String, dynamic> json) {
    print(json);
    contenido = json['contenido'];
    correcta = json['correcta'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contenido'] = this.contenido;
    data['correcta'] = this.correcta;
    return data;
  }
}
