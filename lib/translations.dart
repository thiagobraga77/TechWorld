import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppTranslations extends Translations {

  @override
  Map<String, Map<String, String>> get keys => {

     "pt_BR": {

      "settings": "Configurações",

      "language": "Idioma",

      "back": "Voltar ao menu",

      "themes": "Temas",

    },

    "en_US": {

      "settings": "Settings",

      "language": "Language",

      "back": "Back to menu",

      "themes": "Themes",

    },

  };


}

 




