import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_minima/models/pokemon.dart';

void main() {
  final json = {
    'id': 25,
    'name': 'pikachu',
    'height': 4,
    'weight': 60,
    'sprites': {
      'other': {
        'official-artwork': {
          'front_default':
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
        },
      },
    },
    'types': [
      {
        'slot': 1,
        'type': {'name': 'electric', 'url': 'https://pokeapi.co/api/v2/type/13/'},
      },
    ],
    'stats': [
      {'base_stat': 35, 'stat': {'name': 'hp'}},
      {'base_stat': 90, 'stat': {'name': 'speed'}},
    ],
  };

  test('Pokemon.fromJson lee id, nombre, imagen y tipos', () {
    final pokemon = Pokemon.fromJson(json);
    expect(pokemon.id, 25);
    expect(pokemon.nombre, 'pikachu');
    expect(
      pokemon.imagen,
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png',
    );
    expect(pokemon.tipos, ['electric']);
  });
    test('Pokemon.fromJson lee las estadisticas', () {
    final pokemon = Pokemon.fromJson(json);
    expect(pokemon.estadisticas.length, 2);
    expect(pokemon.estadisticas.first.nombre, 'hp');
    expect(pokemon.estadisticas.first.valor, 35);
  });
}