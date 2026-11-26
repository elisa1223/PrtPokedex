class Estadistica {
  final String nombre;
  final int valor;

  Estadistica({
    required this.nombre,
    required this.valor,
  });

  factory Estadistica.fromJson(Map<String, dynamic> json) {
    return Estadistica(
      nombre: json['stat']['name'],
      valor: json['base_stat'],
    );
  }
}