import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sidebar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("about".tr),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.info_outline, size: 80, color: Colors.blueAccent),
            const SizedBox(height: 16),
            Text(
              "app_title".tr,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 40),
            
            Text(
              "collaborators".tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            
            const Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Thiago Alexandre Braga de Medeiros"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Marcos Vinícius Dantas da Silva"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Thiago Gomes de Oliveira"),
                  ),
                ],
              ),
            ),

            // empurrar o conteúdo
            const Spacer(),

            const Text(
              "@TechWorld",
              style: TextStyle(
                fontSize: 16, 
                color: Colors.grey, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}