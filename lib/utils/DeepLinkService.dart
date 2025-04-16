import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

class DeepLinkService {


  final AppLinks _appLinks = AppLinks();

  void initDeepLinking(BuildContext context) async {
    // Handle deep links when app is already open
    _appLinks.uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        handleDeepLink(uri, context);
      }
    });

    // Handle deep link when app is launched
    final Uri? initialUri = await _appLinks.getInitialAppLink();
    if (initialUri != null) {
      handleDeepLink(initialUri, context);
    }
     print("first data");

  }









  void handleDeepLink(Uri uri, BuildContext context) {
    final referralCode = uri.queryParameters['code'];
    if (referralCode != null) {


      print("Referral Code: $referralCode");

      // Navigate to Referral Page
      Navigator.pushNamed(context, '/referral', arguments: referralCode);

      // Send referral code to backend
      sendReferralCodeToBackend(referralCode);


    }
  }

  void sendReferralCodeToBackend(String referralCode) {
    print("Sending referral code $referralCode to backend...");
    // TODO: Make API call to backend
  }
}
