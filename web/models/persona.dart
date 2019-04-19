class Persona {
  String nombre;
  String apellidoPaterno;
  String apellidoMaterno;
  num edad;

  Persona({this.nombre, this.apellidoPaterno, this.apellidoMaterno, this.edad});

  factory Persona.fromJson(Map<String, dynamic> json) => Persona(
      nombre: json['nombre'],
      apellidoPaterno: json['apellidoPaterno'],
      apellidoMaterno: json['apellidoMaterno'],
      edad: json['edad']);

  Map<String, dynamic> toJson() => {
        'nombre': nombre,
        'apellidoPaterno': apellidoPaterno,
        'apellidoMaterno': apellidoMaterno,
        'edad': edad
      };
}
