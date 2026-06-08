import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_service.dart'; 

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechWorld'),
        actions: [
          // botão para carregar as notícias, alterando o estado do ValueNotifier.
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              newsService.carregarNoticias(); // mudar o estado
            },
          )
        ],
      ),

      // parte das receitas 5 e 6 - gerência de estado usando ValueNotifier e ValueListenableBuilder
      body: ValueListenableBuilder<List<Map<String, String>>>(
        valueListenable: newsService.stateNotifier,
        builder: (context, noticias, child) {
          
          // caso não haja notícias
          if (noticias.isEmpty) {
            return const Center(
              child: Text('Clique no botão de atualizar para carregar as notícias.'),
            );
          }

          // receitas 1 e 4 - exibe a lista de notícias
          return ListView.builder(
            itemCount: noticias.length,
            itemBuilder: (context, index) {
              final noticia = noticias[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(noticia["titulo"]!),
                  subtitle: Text(noticia["descricao"]!),
                  onTap: () {
                    // receita 9a - fazendo o roteamento com Get
                    Get.toNamed('/details', arguments: noticia);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}