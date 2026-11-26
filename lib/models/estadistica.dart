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

  String get nombreEnEspanol {
    switch (nombre) {
      case 'hp':
        return 'PS';
      case 'attack':
        return 'Ataque';
      case 'defense':
        return 'Defensa';
      case 'special-attack':
        return 'Ataque esp.';
      case 'special-defense':
        return 'Defensa esp.';
      case 'speed':
        return 'Velocidad';
      default:
        return nombre;
    }
  }
}