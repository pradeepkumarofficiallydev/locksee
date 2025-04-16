//
//
//
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:locksee/controller/login_controller.dart';
// import 'package:locksee/screens/verification_screen.dart';
//
// import '../utils/AppColors.dart';
// import '../utils/custom_widgets.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   _LockseeUIState createState() => _LockseeUIState();
// }
//
// class _LockseeUIState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _phoneController = TextEditingController();
//
//   String _countryCode = "+91"; // Default country code (India)
//   String _countryFlag = "🇮🇳";  // Default flag
//
//   void _pickCountry() {
//     showCountryPicker(
//       context: context,
//       showPhoneCode: true,
//       onSelect: (Country country) {
//         setState(() {
//           _countryCode = "+${country.phoneCode}";
//           _countryFlag = country.flagEmoji;
//         });
//       },
//     );
//   }
//
//   void _validateNumber() {
//     String phoneNumber = _phoneController.text.trim();
//     if (phoneNumber.isEmpty || phoneNumber.length < 7) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Enter a valid phone number")),
//       );
//       return;
//     }
//
//     String fullNumber = "$_countryCode$phoneNumber";
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text("Phone Number: $fullNumber")),
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:
//
//         GetBuilder<LoginController>(
//         init: LoginController(),
//     builder: (s) =>
//
//
//       Stack(
//         children: [
//           // Background Decoration
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage("assets/images/Welcome.png"),
//                 fit: BoxFit.cover,
//                 colorFilter: ColorFilter.mode(
//                   Colors.white.withOpacity(0.8),
//                   BlendMode.dstATop,
//                 ),
//               ),
//             ),
//           ),
//           Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 10),
//
//
//                     Image.asset('assets/images/lock_image.png',height: 100,),
//
//
//
//                     //
//                     // Text(
//                     //   textAlign: TextAlign.center,
//                     //
//                     //   'Welcome',
//                     //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     // ),
//
//                     SizedBox(height: 20),
//
//
//
//                     Text(
//                       textAlign: TextAlign.center,
//
//                       'Verify Your phone number',
//                       style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
//                     ),
//
//
//
//                     Text(
//                       'Let’s get you signed up by OTP',
//                       style: TextStyle(fontSize: 15, color: Colors.black),
//                     ),
//                     SizedBox(height: 70),
//
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Phone number',
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     SizedBox(height: 5),
//
//
//
//                 Container(
//                 height: 50,
//                 alignment: Alignment.center,
//
//                 padding: EdgeInsets.symmetric(horizontal: 15),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(25),
//                   border: Border.all(color: Colors.grey.shade300),
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,  // Fix: Avoids unnecessary stretching
//
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//
//                     Container(
//                       alignment: Alignment.center,
//
//
//                      // color: Colors.green,
//                       child: GestureDetector(
//                         onTap: _pickCountry,
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text(_countryFlag, style: TextStyle(fontSize: 24)),
//                             SizedBox(width: 5),
//                             Text(_countryCode, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                             Icon(Icons.keyboard_arrow_down),
//                           ],
//                         ),
//                       ),
//                     ),
//
//
//
//
//
//
//
//                     Expanded(
//                       child: TextField(
//                         controller: s.phoneController,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Your phone number",
//                           hintStyle: TextStyle(color: Colors.grey),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
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
//                     SizedBox(height: 100),
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
//                     s. isLoading.value ?
//
//                     CustomWidgets.showCircularIndicator1(context,30,AppColor.appColor):
//
//
//
//                     ElevatedButton(
//                       onPressed: () {
//
//                       //  Get.to(() => VerificationScreen());
//
//                         if (_formKey.currentState!.validate()) {
//
//
//
//
//
//
//                         s.login_fun();
//
//                         //Get.to(() => VerificationScreen());
//
//
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: AppColor.appColor,
//                         foregroundColor: Colors.white,
//                         minimumSize: Size(double.infinity, 50),
//                       ),
//                       child: Text("Request OTP"),
//                     ),
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
//
//
//
//
//
//
//
//
//                     SizedBox(height: 90),
//
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//         )
//     );
//   }
// }
//
//
//
//
//
//












import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:locksee/controller/login_controller.dart';
import 'package:locksee/screens/verification_screen.dart';

import '../utils/AppColors.dart';
import '../utils/custom_widgets.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode(); // To manage focus

  String _countryCode = "+91"; // Default country code (India)
  String _countryFlag = "🇮🇳";  // Default flag

  void _pickCountry() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _countryCode = "+${country.phoneCode}";
          _countryFlag = country.flagEmoji;
        });
      },
    );
  }

  void _validateNumber(LoginController s) {
    String phoneNumber = s.phoneController.text.trim();

    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter your phone number")),
      );
      return;
    }

    if (phoneNumber.length < 7 || phoneNumber.length > 15) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Enter a valid phone number")),
      );
      return;
    }

    String fullNumber = "$_countryCode$phoneNumber";
    s.login_fun(); // Call login function only after validation
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: Get.put(LoginController()), // Use Get.put() instead of init:
        builder: (s) => Stack(
          children: [
            // Background Decoration
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Welcome.png"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.8),
                    BlendMode.dstATop,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      Image.asset('assets/images/lock_image.png', height: 100),
                      SizedBox(height: 20),
                      Text(
                        'Verify Your Phone Number',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Let’s get you signed up with OTP',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(height: 70),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Phone number',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 5),
                      Container(
                        height: 50,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: _pickCountry,
                              child: Row(
                                children: [
                                  Text(_countryFlag, style: TextStyle(fontSize: 24)),
                                  SizedBox(width: 5),
                                  Text(_countryCode, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: s.phoneController,
                                focusNode: _phoneFocusNode,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [FilteringTextInputFormatter.digitsOnly], // Accept only digits
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Your phone number",
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                // validator: (value) {
                                //   if (value == null || value.isEmpty) {
                                //     return "Enter your phone number";
                                //   }
                                //   if (value.length < 7 || value.length > 15) {
                                //     return "Enter a valid phone number";
                                //   }
                                //   return null;
                                // },



                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 100),
                      s.isLoading.value
                          ? CustomWidgets.showCircularIndicator1(context, 30, AppColor.appColor)
                          :


                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _validateNumber(s);



                          }

                          else
                            {

                              s.login_fun();




                            }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.appColor,
                          foregroundColor: Colors.white,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        child: Text("Request OTP"),
                      ),
                      SizedBox(height: 90),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



