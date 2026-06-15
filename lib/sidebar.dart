import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // O radar do GetX que descobre em qual tela o usuário está agora
    final String currentRoute = Get.currentRoute;

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Text(
              "app_title".tr,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          
          ListTile(
            // Se a rota atual for a raiz ('/'), o botão fica "aceso"
            selected: currentRoute == '/',
            selectedColor: Colors.blueAccent,
            leading: const Icon(Icons.home),
            title: Text("home".tr),
            onTap: () {
              Get.back();
              if (currentRoute != '/') Get.toNamed('/');
            },
          ),
          
          ListTile(
            selected: currentRoute == '/about',
            selectedColor: Colors.blueAccent,
            leading: const Icon(Icons.info),
            title: Text("about".tr),
            onTap: () {
              Get.back();
              if (currentRoute != '/about') Get.toNamed('/about');
            },
          ),

          ListTile(
            selected: currentRoute == '/settings',
            selectedColor: Colors.blueAccent,
            leading: const Icon(Icons.settings),
            title: Text("settings".tr),
            onTap: () {
              Get.back();
              if (currentRoute != '/settings') Get.toNamed('/settings');
            },
          ),
        ],
      ),
    );
  }
}