import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Notícias fictícias
    final noticias = [
      {
        "titulo": "Nova tecnologia é lançada",
        "descricao": "Empresa apresenta inovação para 2026."
      },
      {
        "titulo": "Time vence campeonato",
        "descricao": "Final emocionante termina nos pênaltis."
      },
      {
        "titulo": "Mercado financeiro cresce",
        "descricao": "Economia apresenta sinais positivos."
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jornal Flutter'),
      ),

      // Receita 1 - Construção de Objetos de Interface Gráfica
      body: ListView.builder(
        itemCount: noticias.length,
        itemBuilder: (context, index) {
          final noticia = noticias[index];

          return Card(
            margin: const EdgeInsets.all(10),

            child: ListTile(
              title: Text(noticia["titulo"]!),
              subtitle: Text(noticia["descricao"]!),

              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/details',
                  arguments: noticia,
                );
              },
            ),
          );
        },
      ),
    );
  }
}