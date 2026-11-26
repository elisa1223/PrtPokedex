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
}