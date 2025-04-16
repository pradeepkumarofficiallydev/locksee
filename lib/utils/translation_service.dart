// import 'dart:convert';
// import 'dart:ui';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
//
// import 'Preference.dart';
//
//
//
// class TranslationService extends GetxService {
//
//
//
//   Future<void> loadTranslations() async {
//     try {
//       print("Loading translations...");
//
//
//
//       //'es':esTranslations,
//       /// 'zh':zhTranslations,
//       //'nl':nlTranslations,
//       //  'vi':viTranslations,
//       // 'ph':phTranslations
//       // Load JSON translation files from assets
//       final String enJson = await rootBundle.loadString('assets/lang/english.json');
//       final String frJson = await rootBundle.loadString('assets/lang/french.json');
//
//       final String deJson = await rootBundle.loadString('assets/lang/German.json');
//       final String nlJson = await rootBundle.loadString('assets/lang/Dutch.json');
//
//
//
//       final String idJson = await rootBundle.loadString('assets/lang/indonesia.json');
//       final String itJson = await rootBundle.loadString('assets/lang/Italian.json');
//
//       final String jaJson = await rootBundle.loadString('assets/lang/Japanese.json');
//
//       final String koJson = await rootBundle.loadString('assets/lang/Korean.json');
//       final String plJson = await rootBundle.loadString('assets/lang/Polish.json');
//
//       final String ptJson = await rootBundle.loadString('assets/lang/Portuguese.json');
//       final String thJson = await rootBundle.loadString('assets/lang/Thai.json');
//
//       final String viJson = await rootBundle.loadString('assets/lang/Vietnamese.json');
//
//
//
//      // final String frJson = await rootBundle.loadString('assets/lang/fr.json');
//
//       print("en.json content: $enJson");
//       print("fr.json content: $frJson");
//
//       // Decode JSON files into maps
//       Map<String, String> enTranslations = Map<String, String>.from(jsonDecode(enJson));
//       Map<String, String> frTranslations = Map<String, String>.from(jsonDecode(frJson));
//
//       Map<String, String> deTranslations = Map<String, String>.from(jsonDecode(deJson));
//       Map<String, String> idTranslations = Map<String, String>.from(jsonDecode(idJson));
//
//       Map<String, String> itTranslations = Map<String, String>.from(jsonDecode(itJson));
//       Map<String, String> jaTranslations = Map<String, String>.from(jsonDecode(jaJson));
//
//       Map<String, String> koTranslations = Map<String, String>.from(jsonDecode(koJson));
//       Map<String, String> plTranslations = Map<String, String>.from(jsonDecode(plJson));
//
//       Map<String, String> ptTranslations = Map<String, String>.from(jsonDecode(ptJson));
//       Map<String, String> esTranslations = Map<String, String>.from(jsonDecode(ptJson));
//
//
//
//       Map<String, String> thTranslations = Map<String, String>.from(jsonDecode(thJson));
//       Map<String, String> zhTranslations = Map<String, String>.from(jsonDecode(thJson));
//
//
//       Map<String, String> nlTranslations = Map<String, String>.from(jsonDecode(nlJson));
//       Map<String, String> viTranslations = Map<String, String>.from(jsonDecode(viJson));
//
//
//       Map<String, String> phTranslations = Map<String, String>.from(jsonDecode(frJson));
//
//       Get.addTranslations({
//         'en': enTranslations,
//         'fr': frTranslations,
//         'de':deTranslations,
//         'id':idTranslations,
//         'it':itTranslations,
//         'ja': jaTranslations,
//         'ko':koTranslations,
//         'pl':plTranslations,
//         'pt':ptTranslations,
//         'es':esTranslations,
//         'th':thTranslations,
//          'zh':zhTranslations,
//          'nl':nlTranslations,
//          'vi':viTranslations,
//          'ph':phTranslations
//
//       });
//
//
//
//
//
//
//
//
//       print("Translations added successfully!");
//     } catch (e) {
//       print("Error loading translations: $e");
//     }
//   }
//
//
//   void changeLanguage(String languageCode) {
//     Get.updateLocale(Locale(languageCode));
//
//     Preference.shared.setString(Preference.DEFAULT_LAGUAGE,languageCode );
//
//   }
//
//
//
//   Future<Locale> getSavedLocale() async {
//
//
//
//     String? savedLang = Preference.shared.getString(Preference.DEFAULT_LAGUAGE);
//
//     print("cdcd${savedLang}");
//
//
//
//     return savedLang != null ? Locale(savedLang) : Locale('en');
//
//
//
//   }
// }






import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Preference.dart';

class TranslationService extends GetxService {
  static const Locale fallbackLocale = Locale('en'); // Default fallback language

  Future<void> loadTranslations() async {
    try {
      print("Loading translations...");

      // Load JSON translation files from assets
      final Map<String, String> languageFiles = {
        'en': 'assets/lang/english.json',
        'fr': 'assets/lang/french.json',
        'de': 'assets/lang/German.json',
        'nl': 'assets/lang/Dutch.json',
        'id': 'assets/lang/indonesia.json',
        'it': 'assets/lang/Italian.json',
        'ja': 'assets/lang/Japanese.json',
        'ko': 'assets/lang/Korean.json',
        'pl': 'assets/lang/Polish.json',
        'pt': 'assets/lang/Portuguese.json',
        'es': 'assets/lang/spanish.json',
        'th': 'assets/lang/Thai.json',
        'vi': 'assets/lang/Vietnamese.json',
        'zh': 'assets/lang/Chinese.json',
        'ph': 'assets/lang/Filipino.json'
      };

      Map<String, Map<String, String>> translations = {};

      for (var entry in languageFiles.entries) {
        try {
          String jsonString = await rootBundle.loadString(entry.value);
          translations[entry.key] = Map<String, String>.from(jsonDecode(jsonString));
        } catch (e) {
          print("Error loading ${entry.value}: $e");
        }
      }

      Get.addTranslations(translations);
      print("✅ Translations added successfully!");

    } catch (e) {
      print("❌ Error loading translations: $e");
    }
  }

  /// Change the current language
  void changeLanguage(String languageCode) {
    Get.updateLocale(Locale(languageCode));
    Preference.shared.setString(Preference.DEFAULT_LAGUAGE, languageCode);
  }

  /// Retrieve the saved locale or fallback to 'en'
  Future<Locale> getSavedLocale() async {
    String? savedLang = Preference.shared.getString(Preference.DEFAULT_LAGUAGE);
    return savedLang != null ? Locale(savedLang) : fallbackLocale;
  }
}

