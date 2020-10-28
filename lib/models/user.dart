class User {
  num idUsuario;
  num tipIdTipoLogin;
  String nombre;
  String nickname;
  String correo;
  String password;
  String fechaNacimiento;
  String icono;
  num puntuacion;
  String institucion;
  String carrera;
  num liIdLiga;
  num estIdEstado;

  User(
      {this.idUsuario,
      this.tipIdTipoLogin,
      this.nombre,
      this.nickname,
      this.correo,
      this.password,
      this.fechaNacimiento,
      this.icono,
      this.puntuacion,
      this.institucion,
      this.carrera,
      this.liIdLiga,
      this.estIdEstado});

  User.fromJson(Map<String, dynamic> json) {
    idUsuario = json['id_Usuario'] ?? 0;
    tipIdTipoLogin = json['Tip_id_TipoLogin'] ?? 0;
    nombre = json['nombre'] ?? '';
    nickname = json['nickname'] ?? '';
    correo = json['correo'] ?? '';
    password = json['password'] ?? '';
    fechaNacimiento = json['fecha_nacimiento'] ?? '';
    icono = json['icono'] ?? '';
    puntuacion = json['puntuacion'] ?? 0;
    institucion = json['institucion'] ?? '';
    carrera = json['carrera'] ?? '';
    liIdLiga = json['Li_id_Liga'] ?? 0;
    estIdEstado = json['Est_id_estado'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_Usuario'] = this.idUsuario;
    data['Tip_id_TipoLogin'] = this.tipIdTipoLogin;
    data['nombre'] = this.nombre;
    data['nickname'] = this.nickname;
    data['correo'] = this.correo;
    data['password'] = this.password;
    data['fecha_nacimiento'] = this.fechaNacimiento;
    data['icono'] = this.icono;
    data['puntuacion'] = this.puntuacion;
    data['institucion'] = this.institucion;
    data['carrera'] = this.carrera;
    data['Li_id_Liga'] = this.liIdLiga;
    data['Est_id_estado'] = this.estIdEstado;
    return data;
  }
}
