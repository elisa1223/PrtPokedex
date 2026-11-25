import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

Future<Pokemon> obtenerPokemon(String nombre) async {
  // INICIO TODO 2
  final url = Uri.parse(
    'https://pokeapi.co/api/v2/pokemon/${nombre.trim().toLowerCase()}',
  );

  final respuesta = await http.get(url);

  if (respuesta.statusCode == 200) {
    final Map<String, dynamic> datos = jsonDecode(respuesta.body);
    return Pokemon.fromJson(datos);
  } else if (respuesta.statusCode == 404) {
    throw Exception('No se encontró el Pokémon');
  } else {
    throw Exception('Error del servidor: código ${respuesta.statusCode}');
  }
  // FIN TODO 2
}