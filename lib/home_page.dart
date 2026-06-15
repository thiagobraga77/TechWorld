import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'news_service.dart';
import 'sidebar.dart';
import 'package:projeto/config_service.dart';
import 'search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _termoPesquisa = '';
  final TextEditingController _controller = TextEditingController();

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
                child: const Text('Notícias em Português'),
              ),
              const PopupMenuItem<String>(
                value: 'en',
                child: const Text('Notícias em Inglês'),
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
                return const Center(
                  child: Text(
                    "Clique no botão de atualizar para carregar as notícias!",
                  ),
                );
              }

              final noticiasFiltradas = _termoPesquisa.isEmpty
                  ? noticias
                  : noticias.where((noticia) => (noticia['titulo'] ?? '')
                      .toLowerCase()
                      .contains(_termoPesquisa.toLowerCase())).toList();

              return Column(
                children: [
                  SearchBarWidget(
                    controller: _controller,
                    onChanged: (valor) {
                      setState(() {
                        _termoPesquisa = valor;
                      });
                    },
                    onClear: () {
                      setState(() {
                        _termoPesquisa = '';
                        _controller.clear();
                      });
                      FocusScope.of(context).unfocus();
                    },
                  ),
                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent) {
                          if (_termoPesquisa.isEmpty) {
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
                              );
                            },
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
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}