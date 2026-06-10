import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Receitas 5 e 6 - separando a lógica da interface
class NewsService {
  // gerência de estado usando ValueNotifier.
  final ValueNotifier<List<Map<String, String>>> stateNotifier = ValueNotifier(
    [],
  );
  final ValueNotifier<bool> loadingNotifier = ValueNotifier(false);

  // endereço api
  final String apiUrl =
      'https://gnews.io/api/v4/top-headlines?category=general&lang=pt&apikey=802aa8d8a879c202cf4ccfb726704dbc';

  Future<void> carregarNoticias() async {
    loadingNotifier.value = true;

    var url = Uri.parse(apiUrl);

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // receita 4 - transforma string json em um dicionário(map)
        var jsonDados = jsonDecode(response.body);
        List artigos = jsonDados['articles'];

        // receita 4 - mapeando a lista do json
        stateNotifier.value = artigos.map<Map<String, String>>((artigo) {
          return {
            "titulo": artigo['title'] ?? 'Sem título',
            "descricao": artigo['description'] ?? 'Sem descrição',
            "conteudo": artigo['content'] ?? 'Sem conteúdo',
            "image": artigo['image']?.toString() ?? 'https://via.placeholder.com/150',
          };
        }).toList();
      } else {
        debugPrint('Erro ao carregar notícias: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Erro ao carregar notícias: $e');
    } finally {
      loadingNotifier.value = false;
    }
  }
}

//instância global
final newsService = NewsService();
