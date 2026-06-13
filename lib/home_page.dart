import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_service.dart';
import 'sidebar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TechWorld'),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language),
            onSelected: (String idiomaEscolhido) {
              newsService.carregarNoticias(
                isRefresh: true,
                novoIdioma: idiomaEscolhido,
              );
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'pt',
                child: Text('Notícias em Português'),
              ),
              const PopupMenuItem<String>(
                value: 'en',
                child: Text('Notícias em Inglês'),
              ),
            ],
          ),
          // botão para carregar as notícias, alterando o estado do ValueNotifier.
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              newsService.carregarNoticias(isRefresh: true); // mudar o estado
            },
          ),
        ],
      ),

      drawer: const AppDrawer(),

      // verifica se o app está carregando os dados da api
      body: ValueListenableBuilder<bool>(
        valueListenable: newsService.loadingNotifier,
        builder: (context, isLoading, child) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return ValueListenableBuilder<List<Map<String, String>>>(
            valueListenable: newsService.stateNotifier,
            builder: (context, noticias, child) {
              if (noticias.isEmpty) {
                return const Center(
                  child: Text(
                    "Clique no botão de atualizar para carregar as notícias!",
                  ),
                );
              }

              // receitas 1 e 4 - exibe a lista de notícias
              // construção do feed de notícias
              return NotificationListener<ScrollNotification>(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
                    newsService.carregarNoticias(isRefresh: false);
                  }
                  return false;
                },
                child: ListView.builder(
                  itemCount: noticias.length,
                  itemBuilder: (context, index) {
                    final noticia = noticias[index];

                    return Card(
                      margin: const EdgeInsets.all(10),
                      child: ListTile(
                        // exibindo a imagem
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            noticia['image']!,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 80,
                                height: 80,
                                color: Colors.grey[300],
                                child: const Icon(
                                  Icons.broken_image,
                                  size: 35,
                                  color: Colors.grey,
                                ),
                              );
                            },
                          ),
                        ),
                        title: Text(
                          noticia['titulo']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                          noticia['descricao']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        onTap: () {
                          Get.toNamed('/details', arguments: noticia);
                        },
                      ),
                    );
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
