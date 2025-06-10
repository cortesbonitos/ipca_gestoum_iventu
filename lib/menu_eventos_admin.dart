import 'package:flutter/material.dart';
import 'menu_editar_evento.dart';
import 'menu_criar_evento.dart';

class MenuEventosAdmin extends StatelessWidget {
  const MenuEventosAdmin({super.key});

  static const Color verdeEscuro = Color(0xFF1a4d3d);
  static const Color verdeClaro = Color(0xFFA8D4BA);

  @override
  Widget build(BuildContext context) {
    final eventos = [
      {'titulo': 'Evento 1', 'sub': 'Subhead'},
      {'titulo': 'Evento 2', 'sub': 'Subhead'},
      {'titulo': 'Evento 3', 'sub': 'Subhead'},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Eventos (Admin)'),
        backgroundColor: verdeEscuro,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: eventos.length,
              itemBuilder: (context, index) {
                final evento = eventos[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: verdeClaro,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      backgroundColor: verdeEscuro,
                      child: const Text('A', style: TextStyle(color: Colors.white)),
                    ),
                    title: Text(evento['titulo'] ?? ''),
                    subtitle: Text(evento['sub'] ?? ''),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MenuEditarEvento()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: verdeEscuro,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Editar'),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MenuCriarEvento()),
                );
              },
              icon: const Icon(Icons.add),
              label: const Text('Criar Evento'),
              style: ElevatedButton.styleFrom(
                backgroundColor: verdeEscuro,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
