class User {
  String nombre;
  String nickName;
  String correo;
  String institucion;
  String carrera;
  String fechaNacimiento;
  String contrasena;

  User(
      {this.nombre,
      this.nickName,
      this.correo,
      this.institucion,
      this.carrera,
      this.fechaNacimiento,
      this.contrasena});

  User.fromJson(Map<String, dynamic> json) {
    nombre = json['nombre'];
    nickName = json['nickName'];
    correo = json['correo'];
    institucion = json['institucion'];
    carrera = json['carrera'];
    fechaNacimiento = json['fechaNacimiento'];
    contrasena = json['contrasena'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombre'] = this.nombre;
    data['nickName'] = this.nickName;
    data['correo'] = this.correo;
    data['institucion'] = this.institucion;
    data['carrera'] = this.carrera;
    data['fechaNacimiento'] = this.fechaNacimiento;
    data['contrasena'] = this.contrasena;
    return data;
  }
}
