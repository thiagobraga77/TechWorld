import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Receitas 5 e 6 - separando a lógica da interface
class NewsService {
  // gerência de estado usando ValueNotifier.
  final ValueNotifier<List<Map<String, String>>> stateNotifier = ValueNotifier([]);
  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  //  gerenciadores de estado para a barra de pesquisa
  final ValueNotifier<String> termoPesquisaNotifier = ValueNotifier('');
  final TextEditingController searchController = TextEditingController();

  int _paginaAtual = 1;
  String _idioma = 'pt';

  NewsService() {
    carregarNoticias(isRefresh: true);
  }

  // pesquisa e atualização do termo de pesquisa
  void atualizarPesquisa(String termo) {
    termoPesquisaNotifier.value = termo;
  }

  void limparPesquisa() {
    searchController.clear();
    termoPesquisaNotifier.value = '';
  }

  Future<void> carregarNoticias({bool isRefresh = false, String? novoIdioma}) async {
    if (novoIdioma != null) {
      _idioma = novoIdioma;
    }

    if (isRefresh) {
      _paginaAtual = 1; 
      loadingNotifier.value = true; 
    } else {
      _paginaAtual++; 
    }

    var url = Uri(
      scheme: 'https',
      host: 'gnews.io',
      path: '/api/v4/top-headlines',
      queryParameters: {
        'category': 'general',
        'apikey': '802aa8d8a879c202cf4ccfb726704dbc', 
        'lang': _idioma,
        'page': _paginaAtual.toString(),
        'max': '10',
      },
    );

    

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonDados = jsonDecode(response.body);
        List artigos = jsonDados['articles'];

        var novasNoticias = artigos.map<Map<String, String>>((artigo) {
          return {
            "titulo": artigo['title']?.toString() ?? 'Sem título',
            "descricao": artigo['description']?.toString() ?? 'Sem descrição',
            "conteudo": artigo['content']?.toString() ?? 'Sem conteúdo',
            "image": artigo['image']?.toString() ?? '',
          };
        }).toList();

        if (isRefresh) {
          stateNotifier.value = novasNoticias; 
        } else {
          stateNotifier.value = [...stateNotifier.value, ...novasNoticias]; 
        }
      } else {
        debugPrint('Erro ao carregar notícias: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erro ao carregar notícias: $e');
    } finally {
      if (isRefresh) {
        loadingNotifier.value = false;
      }
    }
  }
}

// instância global
final newsService = NewsService();