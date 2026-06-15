import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_service.dart';
import 'sidebar.dart';
import 'search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('app_title'.tr),
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
              PopupMenuItem<String>(
                value: 'pt',
                child: Text('pt_news'.tr),
              ),
              PopupMenuItem<String>(
                value: 'en',
                child: Text('en_news'.tr),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              newsService.carregarNoticias(isRefresh: true);
            },
          ),
        ],
      ),

      
      drawer: const AppDrawer(),


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
                return Center(
                  child: Text('empty_news'.tr),
                );
              }

              // Escutando a variável de pesquisa diretamente do serviço
              return ValueListenableBuilder<String>(
                valueListenable: newsService.termoPesquisaNotifier,
                builder: (context, termoPesquisa, child) {
                  final noticiasFiltradas = termoPesquisa.isEmpty
                      ? noticias
                      : noticias.where((noticia) =>
                          (noticia['titulo'] ?? '').toLowerCase().contains(termoPesquisa.toLowerCase())
                        ).toList();

                  return Column(
                    children: [
                      SearchBarWidget(
                        controller: newsService.searchController,
                        onChanged: (valor) {
                          newsService.atualizarPesquisa(valor);
                        },
                        onClear: () {
                          newsService.limparPesquisa();
                          FocusScope.of(context).unfocus();
                        },
                      ),
                      Expanded(
                        child: NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                              if (termoPesquisa.isEmpty) {
                                newsService.carregarNoticias(isRefresh: false);
                              }
                            }
                            return false;
                          },
                          child: ListView.builder(
                            itemCount: noticiasFiltradas.length,
                            itemBuilder: (context, index) {
                              final noticia = noticiasFiltradas[index];

                              return Card(
                                margin: const EdgeInsets.all(10),
                                child: ListTile(
                                  leading: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: noticia['image']!.isNotEmpty
                                        ? Image.network(
                                            noticia['image']!,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                width: 80,
                                                height: 80,
                                                color: Colors.grey[300],
                                                child: const Icon(Icons.broken_image, size: 35, color: Colors.grey),
                                              );
                                            },
                                          )
                                        : Container(
                                            width: 80,
                                            height: 80,
                                            color: Colors.grey[300],
                                            child: const Icon(Icons.article, size: 35, color: Colors.grey),
                                          ),
                                  ),
                                  title: Text(
                                    noticia['titulo']!,
                                    style: Theme.of(context).textTheme.titleMedium,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  subtitle: Text(
                                    noticia['descricao']!,
                                    style: Theme.of(context).textTheme.titleSmall,
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
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}