import 'package:flutter/material.dart';

import '../models/pokemon.dart';
import '../services/pokeapi_service.dart';

class PokedexScreen extends StatefulWidget {
  const PokedexScreen({super.key});

  @override
  State<PokedexScreen> createState() => _PokedexScreenState();
}

class _PokedexScreenState extends State<PokedexScreen> {
  final _controlador = TextEditingController();
  Future<Pokemon>? _futuroPokemon;

  void _buscar() {
    final texto = _controlador.text.trim();
    if (texto.isEmpty) return;
    setState(() {
      _futuroPokemon = obtenerPokemon(texto);
    });
  }

  @override
  void dispose() {
    _controlador.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex mínima')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controlador,
              decoration: const InputDecoration(
                labelText: 'Nombre o número del Pokémon',
                border: OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: (_) => _buscar(),
            ),
            const SizedBox(height: 12),
            FilledButton(onPressed: _buscar, child: const Text('Buscar')),
            const SizedBox(height: 24),
            Expanded(
              child: _futuroPokemon == null
                  ? const Center(
                      child: Text('Escribe un nombre y presiona Buscar'),
                    )
                  : FutureBuilder<Pokemon>(
                      future: _futuroPokemon,
                      builder: (context, snapshot) {
                        // INICIO TODO 3
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          return Center(
                            child: Text(
                              '${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        final pokemon = snapshot.data!;
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.network(pokemon.imagen, height: 200),
                              const SizedBox(height: 12),
                              Text(
                                '#${pokemon.id} ${pokemon.nombre}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                children: pokemon.tipos
                                    .map((tipo) => Chip(label: Text(tipo)))
                                    .toList(),
                              ),
                              const SizedBox(height: 12),
                              Text(
                                'Altura: ${pokemon.altura.toStringAsFixed(1)} m   '
                                'Peso: ${pokemon.peso.toStringAsFixed(1)} kg',
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 16),
                              const Divider(),
                              const Text(
                                'Habilidades',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Wrap(
                                spacing: 8,
                                children: pokemon.habilidades
                                    .map(
                                      (habilidad) => Chip(
                                        avatar: const Icon(
                                          Icons.auto_awesome,
                                          size: 16,
                                        ),
                                        label: Text(habilidad),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 16),
                              const Divider(),
                              const Text(
                                'Estadísticas',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              ...pokemon.estadisticas.map(
                                (estadistica) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        child: Text(
                                          estadistica.nombreEnEspanol,
                                        ),
                                      ),
                                      Expanded(
                                        child: LinearProgressIndicator(
                                          value: estadistica.valor / 255,
                                          minHeight: 8,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text('${estadistica.valor}'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                        // FIN TODO 3
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
