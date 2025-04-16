import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locksee/screens/AgoraSdk.dart';
import 'package:locksee/screens/home_screen.dart';
import 'package:locksee/screens/login_screen.dart';
import 'package:locksee/screens/notification_screen.dart';
import 'package:locksee/screens/splash_screen.dart';
import 'package:locksee/utils/Preference.dart';
import 'package:locksee/utils/translation_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preference().instance();


  // MobileAds.instance.initialize();
  //
  // MobileAds.instance.initialize().then((InitializationStatus status) {
  //   print("Google Mobile Ads SDK initialized: ${status.adapterStatuses}");
  // });



  final translationService = Get.put(TranslationService());
  await translationService.loadTranslations();

  Locale savedLocale = await translationService.getSavedLocale();

  print("Saved Locale: $savedLocale");

  runApp(MyApp(savedLocale: savedLocale));

  ///9027292852

}

class MyApp extends StatefulWidget {
  final Locale savedLocale;

  const MyApp({super.key, required this.savedLocale});

  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.updateLocale(widget.savedLocale);

      // Future.delayed(Duration(milliseconds: 300), () {
      //
      //
      //   Get.updateLocale(widget.savedLocale);
      //
      //
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,


      locale: widget.savedLocale,
      // Use saved language

      fallbackLocale: Locale('en'),
      // Default language
      initialRoute: '/',

      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/dashboard', page: () => HomeScreen()),
        GetPage(name: '/signup', page: () => LoginScreen()),




      ],

      onGenerateRoute: (settings) {
        final args = settings.arguments;

        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => LoginScreen());


          case '/home_screen':
            return MaterialPageRoute(builder: (context) => HomeScreen());


          case '/notification_screen':
            return MaterialPageRoute(
                builder: (context) => NotificationsScreen());



          default:
            return null; // Return null if the route is not found
        }
      },

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),


     );
  }
}
