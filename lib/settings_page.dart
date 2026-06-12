import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configurações"),
        backgroundColor: Colors.blueAccent,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            "Configurações Gerais",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: const Icon(Icons.palette),
              title: const Text("Cor de fundo"),
              subtitle: const Text(
                "Escolha a cor de fundo do aplicativo",
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementar futuramente
              },
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Idioma"),
              subtitle: const Text(
                "Escolha o idioma do aplicativo",
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementar futuramente
              },
            ),
          ),
        ],
      ),
    );
  }
}