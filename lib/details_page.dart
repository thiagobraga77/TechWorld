import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final noticia = Get.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: Text("details".tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              noticia["titulo"]!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: noticia["image"] != null && noticia["image"]!.isNotEmpty
                  ? Image.network(
                      noticia["image"]!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.article, size: 60, color: Colors.grey),
                              const SizedBox(height: 8),
                              Text('no_image'.tr, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                            ],
                          ),
                        );
                      },
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.article, size: 60, color: Colors.grey),
                          const SizedBox(height: 8),
                          Text('no_image'.tr, style: const TextStyle(color: Colors.grey, fontSize: 16)),
                        ],
                      ),
                    ),
            ),
            const SizedBox(height: 15),
            Text(
              noticia["descricao"]!,
              style: const TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}