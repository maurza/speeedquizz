class Pregunta {
  String enunciado;
  List<dynamic> opciones;
  String ayuda;
  String tip;

  Pregunta({this.enunciado, this.opciones, this.ayuda, this.tip});

  Pregunta.fromJson(Map<String, dynamic> json) {
    enunciado = json['enunciado'];
    if (json['opciones'] != null) {
      opciones = (json['opciones'] as List).map((v) {
        if (v.runtimeType == String) {
          if ((v as String).contains('-')) {
            return v;
          } else {
            return v;
          }
        } else {
          return (new Opciones.fromJson(v));
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
    return data;
  }
}

class Opciones {
  String contenido;
  int correcta;

  Opciones({this.contenido, this.correcta});

  Opciones.fromJson(Map<String, dynamic> json) {
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
