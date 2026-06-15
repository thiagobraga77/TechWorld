import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sidebar.dart';
import 'package:projeto/config_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings".tr,
        )
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          Text(
            "Configurações Gerais",
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const SizedBox(height: 16),

          TextButton.icon(
            onPressed: () {
              Get.back();
              Get.toNamed('/');
            },
            icon: const Icon(
              Icons.arrow_back,
              ),
            label: Text(
              "Voltar ao menu",
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),

          Card(
            child: ExpansionTile(
              leading: const Icon(Icons.palette),
              title: Text(
                "Temas",
                style: Theme.of(context).textTheme.titleMedium,
              ),

              children: [
                ValueListenableBuilder(
                  valueListenable: configService.currentThemeName,
                  builder: (context, currentTheme, child) {
                    return Column(
                      children: [
                        ListTile(
                          title: const Text("Claro"),

                          trailing: currentTheme == "light"
                              ? const Icon(Icons.check_box)
                              : null,

                          onTap: () {
                            configService.applyTheme("light");
                          },
                        ),

                        ListTile(
                          title: const Text("Escuro"),

                          trailing: currentTheme == "black"
                              ? const Icon(Icons.check_box)
                              : null,

                          onTap: () {
                            configService.applyTheme("black");
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
              title: Text(
                "Idioma",
                style: Theme.of(context).textTheme.titleMedium
              ),
              subtitle: const Text("Escolha o idioma do aplicativo"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Implementar futuramente
              },
            ),
          ),
        ],
      ),

    drawer: const AppDrawer(),

    );
  }
}
