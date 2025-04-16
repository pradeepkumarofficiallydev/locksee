// import 'package:flutter/material.dart';
// import '../utils/DeepLinkService.dart';
//
//
// class DeepLink extends StatelessWidget {
//   final DeepLinkService _deepLinkService = DeepLinkService();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => HomePage(),
//         '/referral': (context) => ReferralPage(),
//       },
//     );
//   }
// }
//
//
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final DeepLinkService _deepLinkService = DeepLinkService();
//
//   @override
//   void initState() {
//     super.initState();
//     _deepLinkService.initDeepLinking(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Home Page')),
//       body: Center(child: Text('Welcome to MyApp!')),
//     );
//   }
// }
//
// class ReferralPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final referralCode = ModalRoute.of(context)!.settings.arguments as String;
//
//     return Scaffold(
//       appBar: AppBar(title: Text('Referral Page')),
//       body: Center(child: Text('Referral Code: $referralCode')),
//     );
//   }
// }













import 'package:flutter/material.dart';
import 'package:app_links/app_links.dart';
import 'package:shared_preferences/shared_preferences.dart';


class DeepLink extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DeepLink> {
  late final AppLinks _appLinks;
  String _referralCode = "No referral code found";

  @override
  void initState() {
    super.initState();
    _appLinks = AppLinks();
    checkFirstInstall();
  }

  /// ✅ Check if the app is installed for the first time
  Future<void> checkFirstInstall() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstInstall = prefs.getBool("first_install") ?? true;

    if (isFirstInstall) {
      print("🚀 First-time install detected!");
      await prefs.setBool("first_install", false);
      getDeepLink();
    } else {
      print("🔄 App re-opened, not first-time install.");
    }
  }

  /// ✅ Handle deep links
  void getDeepLink() async {
    _appLinks.getInitialAppLink().then((Uri? uri) async {
      if (uri != null) {
        String? referralCode = uri.queryParameters["code"];
        if (referralCode != null) {

          saveReferralCode(referralCode);


        }
      }
    });

    _appLinks.uriLinkStream.listen((Uri uri) {
      String? referralCode = uri.queryParameters["code"];
      if (referralCode != null) {
        saveReferralCode(referralCode);
      }
    });
  }

  /// ✅ Save referral code in SharedPreferences
  Future<void> saveReferralCode(String code) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("referral_code", code);
    setState(() {
      _referralCode = "Referral Code: $code";
    });
    print("🔑 Referral code saved: $code");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Referral Tracking in Flutter")),
        body: Center(child: Text(_referralCode)),
      ),
    );
  }
}









