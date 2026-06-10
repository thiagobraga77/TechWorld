import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: const Text(
              "TechWorld",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Início"),

            onTap: () {
              Get.back();
              Get.toNamed('/');
            },
          ),

          ListTile(
            leading: const Icon(Icons.article),
            title: const Text("Notícias"),

            onTap: () {
              Get.back();
              Get.toNamed('/news');
            },
          ),

          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configurações"),

            onTap: () {
              Get.back();
              Get.toNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}