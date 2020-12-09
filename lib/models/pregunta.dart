class Pregunta {
  String enunciado;
  List<dynamic> opciones;
  String ayuda;
  String tip;
  int tipoPregunta;
  List<Costos> costos;
  Pregunta(
      {this.enunciado,
      this.opciones,
      this.ayuda,
      this.tip,
      this.tipoPregunta,
      this.costos});

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
    if (json['costos'] != null) {
      costos = new List<Costos>();
      json['costos'].forEach((v) {
        costos.add(new Costos.fromJson(v));
      });
    }
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
    /* print(json); */
    contenido = json['contenido'];
    correcta = json['correcta'] ?? json['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contenido'] = this.contenido;
    data['correcta'] = this.correcta;
    return data;
  }
}

class Costos {
  int costoAyuda;
  int puntosAcierto;
  int puntosFracaso;
  String nivel;

  Costos({this.costoAyuda, this.puntosAcierto, this.puntosFracaso, this.nivel});

  Costos.fromJson(Map<String, dynamic> json) {
    costoAyuda = json['costo_ayuda'];
    puntosAcierto = json['puntos_acierto'];
    puntosFracaso = json['puntos_fracaso'];
    nivel = json['nivel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['costo_ayuda'] = this.costoAyuda;
    data['puntos_acierto'] = this.puntosAcierto;
    data['puntos_fracaso'] = this.puntosFracaso;
    data['nivel'] = this.nivel;
    return data;
  }
}
