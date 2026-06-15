import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sidebar.dart';
import 'package:projeto/config_service.dart';
import 'package:projeto/language_service.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("settings".tr)
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),

        children: [
          Text(
            "gen_settings".tr,
            style: Theme.of(context).textTheme.headlineSmall,
          ),

          const SizedBox(height: 16),

          TextButton.icon(
            onPressed: () {
              Get.back();
              Get.toNamed('/');
            },
            icon: const Icon(Icons.arrow_back),
            label: Text(
              "back".tr,
              style: Theme.of(context).textTheme.bodyMedium
            ),
          ),

          Card(
            child: ExpansionTile(
              leading: const Icon(Icons.palette),
              title: Text(
                "themes".tr,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              children: [
                ValueListenableBuilder(
                  valueListenable: configService.currentThemeName,
                  builder: (context, currentTheme, child) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text("light".tr),
                          trailing: currentTheme == "light" ? const Icon(Icons.check_box) : null,
                          onTap: () {
                            configService.applyTheme("light");
                          },
                        ),
                        ListTile(
                          title: Text("dark".tr),
                          trailing: currentTheme == "black" ? const Icon(Icons.check_box) : null,
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
            child: ExpansionTile(
              leading: const Icon(Icons.language),
              title: Text(
                "language".tr,
                style: Theme.of(context).textTheme.titleMedium
              ),
              subtitle: Text("choose_lang".tr),
              
              children: [
                ValueListenableBuilder(
                  valueListenable: languageService.currentLanguage,
                  builder: (context, currentLanguage, child) {
                    return Column(
                      children: [
                        ListTile(
                          title: const Text("Português (Brasil)"),
                          trailing: currentLanguage == "pt_BR" ? const Icon(Icons.check_box) : null,
                          onTap: () {
                            languageService.applyLanguage("pt_BR");
                          },
                        ),
                        ListTile(
                          title: const Text("English (US)"),
                          trailing: currentLanguage == "en_US" ? const Icon(Icons.check_box) : null,
                          onTap: () {
                            languageService.applyLanguage("en_US");
                          },
                        ),
                      ],
                    );
                  }
                )
              ],
            ),
          ),
        ],
      ),

      drawer: const AppDrawer(),
    );
  }
}