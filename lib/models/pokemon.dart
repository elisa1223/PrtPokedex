import 'estadistica.dart';

class Pokemon {
  final int id;
  final String nombre;
  final String imagen;
  final List<String> tipos;
  final double altura; // metros
  final double peso; // kilogramos
  final List<String> habilidades;
  final List<Estadistica> estadisticas;

  Pokemon({
    required this.id,
    required this.nombre,
    required this.imagen,
    required this.tipos,
    required this.altura,
    required this.peso,
    required this.habilidades,
    required this.estadisticas,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    // INICIO TODO 1
    return Pokemon(
      id: json['id'],
      nombre: json['name'],
      imagen:
          json['sprites']['other']['official-artwork']['front_default'] ?? '',
      tipos: [for (final t in json['types']) t['type']['name'] as String],
      // height viene en decímetros y weight en hectogramos: entre 10
      altura: (json['height'] as int) / 10,
      peso: (json['weight'] as int) / 10,
      habilidades: [
        for (final h in json['abilities']) h['ability']['name'] as String,
      ],
      estadisticas: [for (final e in json['stats']) Estadistica.fromJson(e)],
    );
  }
}
