import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto/config_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configurações")),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          const Text(
            "Configurações Gerais",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          TextButton.icon(
            onPressed: () {
              Get.back();
              Get.toNamed('/');
            },
            icon: const Icon(Icons.arrow_back),
            label: const Text("Voltar ao menu"),
          ),

          Card(
            child: ExpansionTile(
              leading: const Icon(Icons.palette),
              title: const Text("TEMAS"),

              children: [
                ValueListenableBuilder(
                  valueListenable: configService.currentThemeName,
                  builder: (context, currentTheme, child) {
                    return Column(
                      children: [
                        ListTile(
                          title: const Text("Claro"),

                          trailing: currentTheme == "light"
                              ? const Icon(Icons.check)
                              : null,

                          onTap: () {
                            configService.setLightTheme();
                          },
                        ),

                        ListTile(
                          title: const Text("Escuro"),

                          trailing: currentTheme == "black"
                              ? const Icon(Icons.check_box)
                              : null,

                          onTap: () {
                            configService.setBlackTheme();
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Idioma"),
              subtitle: const Text("Escolha o idioma do aplicativo"),
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
