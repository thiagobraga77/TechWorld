import 'package:flutter/material.dart';

// Receitas 5 e 6 - separando a lógica da interface 
class NewsService {
  // gerência de estado usando ValueNotifier. 
  final ValueNotifier<List<Map<String, String>>> stateNotifier = ValueNotifier([]);

  void carregarNoticias() {
    stateNotifier.value = [
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
  }
}

//instância global
final newsService = NewsService();