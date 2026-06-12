import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto/settings_page.dart';
import 'home_page.dart';
import 'details_page.dart';
import 'package:projeto/config_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: configService.themeNotifier,

      builder: (context, currentTheme, child) {
        return GetMaterialApp(
          title: 'TechWorld',
          debugShowCheckedModeBanner: false,
          theme: currentTheme,

        //receita 9a - estrutura de rotas usando getPages
          initialRoute: '/',
          getPages: [
            GetPage(
              name: '/', 
              page: () => const HomePage()),

            GetPage(
              name: '/details', 
              page: () => const DetailsPage()),
            // rotas temporárias para se caso der erro ao acessar o menu lateral
            
            GetPage(      
              name: '/news',
              page: () => const HomePage()),
            
            GetPage(
              name: '/settings',
              page: () => const SettingsPage(),
            ), // rota para a home, caso queira acessar diretamente
          ],
        );
      },
    );
  }
}
