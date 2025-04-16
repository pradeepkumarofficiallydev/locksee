// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:intl/intl.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   String? countryCode;
//   String? language;
//   bool isLoading = false;
//   bool showLocationModal = false;
//   bool isEligibleCountry = false;
//   String? ipAddress;
//   String? adId;
//   List<Map<String, dynamic>> countryList = [];
//
//   @override
//   void initState() {
//     super.initState();
//     onPageInit();
//   }
//
//   /// Initialize Page & Fetch Data
//   Future<void> onPageInit() async {
//     await checkValue();
//   }
//
//   /// Fetch Country, Language, IP Address, and Store in Preferences
//   Future<void> checkValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedTimeZone = prefs.getString('timeZone');
//     String? savedIpAddress = prefs.getString('ISPAddress');
//
//     if (savedTimeZone != null && savedIpAddress != null) {
//       setState(() {
//         countryCode = prefs.getString('country_code') ?? 'US';
//       });
//       return;
//     }
//
//     setState(() => isLoading = true);
//     String apiUrl = "https://api.example.com/ip"; // Replace with actual IP API
//     try {
//       final response = await http.get(Uri.parse(apiUrl));
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         setState(() {
//           countryCode = data['country_code'] ?? 'US';
//           ipAddress = data['ip'];
//         });
//
//         prefs.setString('ISPAddress', ipAddress!);
//         prefs.setString('timeZone', DateFormat('zzzz').format(DateTime.now()));
//         await fetchLanguage(countryCode!);
//       }
//     } catch (e) {
//       print("Error fetching IP: $e");
//     }
//     setState(() => isLoading = false);
//   }
//
//   /// Fetch Language Based on Country Code
//   Future<void> fetchLanguage(String countryCode) async {
//     String languageApiUrl = "https://api.example.com/languages?country_code=$countryCode";
//     try {
//       final response = await http.get(Uri.parse(languageApiUrl));
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         if (data['data'] != null && data['data'].isNotEmpty) {
//           setState(() {
//             language = data['data'][0]['language'];
//           });
//         }
//       }
//     } catch (e) {
//       print("Error fetching language: $e");
//     }
//   }
//
//   /// Fetch Country List
//   Future<void> fetchCountryList() async {
//     String countryApiUrl = "https://api.example.com/countries";
//     try {
//       final response = await http.get(Uri.parse(countryApiUrl));
//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body);
//         setState(() {
//           countryList = List<Map<String, dynamic>>.from(data['data']);
//         });
//       }
//     } catch (e) {
//       print("Error fetching country list: $e");
//     }
//   }
//
//   /// Construct Payload for API Request
//   Future<Map<String, dynamic>> getPayload() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // Fetching stored values
//     String? refererUrl = prefs.getString('referer_url') ?? '';
//     String? vid = prefs.getString('vid') ?? '';
//     String? adId = prefs.getString('ad_id') ?? '';
//
//     // Fetching Device Info
//     DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//     String deviceId = '';
//     String deviceName = '';
//
//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       deviceId = androidInfo.id;
//       deviceName = androidInfo.model;
//     } else if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       deviceId = iosInfo.identifierForVendor ?? '';
//       deviceName = iosInfo.name;
//     }
//
//     // Constructing the payload
//     return {
//       'country_code': countryCode,
//       'device_id': deviceId,
//       'device_type': Platform.operatingSystem, // Returns 'android' or 'ios'
//       'device_name': deviceName,
//       'ip_address': ipAddress ?? '',
//       'source': 1,
//       'referer_url': refererUrl,
//       'vid': vid,
//       'source_user_id2': 0,
//       'idfa_gaid': adId,
//     };
//   }
//
//   /// Send Data to Server
//   void sendDataToServer() async {
//     Map<String, dynamic> payload = await getPayload();
//     print("Payload Data: $payload");
//
//     try {
//       final response = await http.post(
//         Uri.parse("https://api.example.com/signup"),
//         body: jsonEncode(payload),
//         headers: {'Content-Type': 'application/json'},
//       );
//
//       if (response.statusCode == 200) {
//         print("Success: ${response.body}");
//       } else {
//         print("Error: ${response.body}");
//       }
//     } catch (e) {
//       print("Request failed: $e");
//     }
//   }
//
//   /// Open URL for Terms & Privacy
//   Future<void> launchUrl(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       print("Could not launch $url");
//     }
//   }
//
//   /// UI
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Center(child: Image.asset('assets/images/logo.png', width: 150)),
//               SizedBox(height: 20),
//               Text(
//                 "Welcome to Our App",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: sendDataToServer,
//                 child: Text("Login"),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: sendDataToServer,
//                 child: Text("Sign Up"),
//               ),
//               SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () => launchUrl("https://example.com/terms"),
//                 child: Text("Terms & Conditions"),
//               ),
//             ],
//           ),
//           if (isLoading)
//             Center(
//               child: CircularProgressIndicator(),
//             ),
//         ],
//       ),
//     );
//   }
// }
////////////////




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/utils/app_text_styles.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? selectedTag;
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);
    DateTime lastDate = DateTime(2100);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [







        //
        // ListView.builder(
        //
        //               physics: NeverScrollableScrollPhysics(), // Disable scrolling
        //
        //
        //               shrinkWrap: true,
        //               itemCount: s.shippingPloicyResponse?.value?.data?.length??0,
        //
        //               itemBuilder: (context, index) {
        //
        //                 var items= s.shippingPloicyResponse?.value?.data![index];
        //
        //                 return
        //
        //                   buildPrivacySection(
        //                       items!.title,
        //                       items!.des
        //
        //
        //
        //
        //
        //
        //
        //
        //                   );
        //               },
        //             ),








            // Tags Dropdown
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text("Tags"),
                  value: selectedTag,
                  icon: Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTag = newValue;
                    });
                  },
                  items: ["Tag 1", "Tag 2", "Tag 3"].map((String tag) {
                    return DropdownMenuItem<String>(
                      value: tag,
                      child: Text(tag),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(width: 12),

            // Start Date Picker
            _buildDatePicker(context, startDate, true),

            SizedBox(width: 8),

            // "To" Label
            Text("To", style: TextStyle(fontSize: 16, color: Colors.grey)),

            SizedBox(width: 8),

            // End Date Picker
            _buildDatePicker(context, endDate, false),
          ],
        ),


      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, DateTime? date, bool isStartDate) {
    return GestureDetector(
      onTap: () => _selectDate(context, isStartDate),
      child: Container(
        width: 120,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date != null
                  ? "${date.day}-${date.month}-${date.year}"
                  : "Select Date",
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            Icon(Icons.calendar_today, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }







  Widget buildPrivacySection(String? title, String? content) {
    return



      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [




          Theme(
            data: Theme.of(Get.context!!).copyWith(dividerColor: Colors.transparent), // Remove the divider


            child: ExpansionTile(
              tilePadding: EdgeInsets.zero, // Remove padding if needed



              title: Text(
                title!,
                style: AppTextStyles.normalopenSans1(Colors.black26,30),

              ),


              children: [
                Text(
                  content!,
                  style: AppTextStyles.normalopenSans1(Colors.black26,30),
                ),
              ],
            ),
          ),

          Divider(

            color: Colors.grey[500],
            thickness: 1,
            height: 0,

          ),
        ],
      );
  }




}







////////////////////



//
//
// import 'package:flutter/material.dart';
// import 'package:gadgetguruz/controller/PrivacyPolicyController.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../util/NewTextstyle.dart';
// import '../util/colors.dart';
// class ShippingPolicyScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text('Shipping Policy',
//           style: Newtextstyle.pageTitle(MyColors.purpleColor),
//         ),
//         leading: IconButton(
//           icon:  Icon(
//             Icons.arrow_back_ios_rounded,
//             color: MyColors.purpleColor,
//             size: height*.6,
//
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//
//
//       body:
//
//
//
//       GetBuilder<PrivacyPolicyController>(
//         init: PrivacyPolicyController(),
//         builder: (s) {
//           // Early return if loading
//           if (s.isLoading.value) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: Colors.purple,
//               ),
//             );
//           }
//
//           // Check if data is null or empty
//           final dataList = s.shippingPloicyResponse?.value?.data ?? [];
//           if (dataList.isEmpty) {
//             return Center(
//               child: Text("No data available", style: Newtextstyle.bigText(MyColors.black)),
//             );
//           }
//
//           return
//
//
//             Container(
//
//
//
//               padding: EdgeInsets.all(height*.4),
//
//
//               child: SingleChildScrollView(
//
//
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     Text(
//                       textAlign: TextAlign.start,
//                       'Welcome to Gadget Guruz Technologies',
//                       style: Newtextstyle.privacyTitleTextbold(MyColors.black),
//                     ),
//                     SizedBox(height: height*.4),
//                     Text(
//                       'Service based Circular Economy platform for electronics that is a unique combination of repairs and an eCommerce platform ("we", "our", "us"). We are committed to protecting your privacy and ensuring the security of your personal information.',
//                       style:  Newtextstyle.privacyTitleTextnorml(MyColors.black),
//                     ),
//                     //  SizedBox(height: height*.4),
//
//
//                     ListView.builder(
//
//                       physics: NeverScrollableScrollPhysics(), // Disable scrolling
//
//
//                       shrinkWrap: true,
//                       itemCount: s.shippingPloicyResponse?.value?.data?.length??0,
//
//                       itemBuilder: (context, index) {
//
//                         var items= s.shippingPloicyResponse?.value?.data![index];
//
//                         return
//
//                           buildPrivacySection(
//
//                               items!.title,
//                               items!.des
//
//
//
//
//
//
//
//                           );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//
//
//
//         },
//       ),
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//     );
//   }
//
//   Widget buildPrivacySection(String? title, String? content) {
//     return
//
//
//
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//
//
//
//
//           Theme(
//             data: Theme.of(Get.context!!).copyWith(dividerColor: Colors.transparent), // Remove the divider
//
//
//             child: ExpansionTile(
//               tilePadding: EdgeInsets.zero, // Remove padding if needed
//
//
//
//               title: Text(
//                 title!,
//                 style: Newtextstyle.privacyTitleTextbold(MyColors.black),
//               ),
//
//
//               children: [
//                 Text(
//                   content!,
//                   style:  Newtextstyle.privacyTitleTextnorml(MyColors.black),
//                 ),
//               ],
//             ),
//           ),
//
//           Divider(
//
//             color: Colors.grey[500],
//             thickness: 1,
//             height: 0,
//
//           ),
//         ],
//       );
//   }
// }
//




