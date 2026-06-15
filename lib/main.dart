import 'package:flutter/material.dart';
import 'package:projeto/config_service.dart';
import 'package:projeto/settings_page.dart';
import 'home_page.dart';
import 'details_page.dart';
import 'translations.dart';
import 'package:get/get.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configService.loadTheme();

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

          translations: AppTranslations(),

          locale: const Locale(
            'pt',
            'BR',
          ),

          fallbackLocale: const Locale(
            'pt',
            'BR',
          ),

          //receita 9a - estrutura de rotas usando getPages
          initialRoute: '/',
          getPages: [
            GetPage(name: '/', page: () => const HomePage()),

            GetPage(name: '/details', page: () => const DetailsPage()),

            // rotas temporárias para se caso der erro ao acessar o menu lateral
            GetPage(name: '/news', page: () => const HomePage()),

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
