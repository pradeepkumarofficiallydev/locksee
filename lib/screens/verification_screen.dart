import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:get/get.dart';

import '../controller/login_controller.dart';
import '../utils/AppColors.dart';
import 'ProfileSetupScreen.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final _formKey = GlobalKey<FormState>();
     final focusNode = FocusNode();

  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  // Mock API Call for OTP verification
  Future<void> _verifyOtp() async {
    setState(() {
      _isLoading = true;
    });


    await Future.delayed(Duration(seconds: 2)); // Simulating API call

    setState(() {
      _isLoading = false;
    });

    // Mock success scenario
    if (_otpController.text == "123456") {
      Get.snackbar("Success", "OTP Verified Successfully",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);
      // Navigate to the next screen (Replace with actual navigation)
    } else {
      Get.snackbar("Error", "Invalid OTP. Please try again.",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:


        GetBuilder<LoginController>(
        init: LoginController(),
    builder: (s) =>

    Stack(
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








    Text(
    "Verification Code",
    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 10),
    // Text(
    // "We have sent you an One Time Password(OTP)\non this mobile number.",
    // textAlign: TextAlign.center,
    // style: TextStyle(fontSize: 14, color: Colors.black54),
    // ),






                    Center(

                      child: Text.rich(
                        textAlign: TextAlign.center,

                        TextSpan(

                          text: "We have sent you an ",
                          style: TextStyle(fontSize: 18,color: AppColor.grayColor1),
                          children: [

                            TextSpan(
                              text: "One Time Password(OTP)\n",
                              style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.blackColor,fontSize: 18,),
                            ),


                            TextSpan(
                              text: "on this mobile number.",
                              style: TextStyle(fontSize: 18,color: AppColor.grayColor1),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 30),

    SizedBox(height: 10),








                    // Enter OTP Text


                    // OTP Input Field with Styling
                    Container(

                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [




                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Enter OTP',

                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),

                            ),
                          ),

                          SizedBox(height: 10),
                          Pinput(
                            controller: s.otpController,
                            length: 4,
                            focusNode: focusNode,


                            keyboardType: TextInputType.number,
                            defaultPinTheme: PinTheme(
                              width: 50,
                              height: 50,
                              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),

                            focusedPinTheme: PinTheme(
                              width: 50,
                              height: 50,
                              textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue),
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.withOpacity(0.2),
                              ),
                            ),


                            separatorBuilder: (index) => const SizedBox(width: 30), // Adjust spacing here


                            // validator: (value) {
                            //   if (value == null || value.length < 6) {
                            //     return 'Enter a valid 6-digit OTP';
                            //   }
                            //   return null;
                            // },



                            // validator: (value) {
                            //   if (value == null || value.isEmpty || value.length != 6) {
                            //     return 'Enter a valid 6-digit OTP';
                            //   }
                            //   return null;
                            // },





                              onChanged: (value) {
                              setState(() {
                              // Handle OTP input change (if needed)
                              print("OTP entered: $value");
                              });
                              },
                            validator: (value) {

                              setState(() {

                              });
                                                  return value?.length !=4  ?  'Otp is incorrect' : null;
                                                },




                          ),
                        ],
                      ),
                    ),


                    SizedBox(height: 50),

                    // Login Button with Loader
                    ElevatedButton(
                      onPressed: _isLoading
                          ? null
                          : () {
                        if (_formKey.currentState!.validate()) {


                         // Get.to(() => ProfileSetupScreen());

                        s.otp_verfica_fun();
                    //       ;


                        }
                      },
                      style: ElevatedButton.styleFrom(

                        backgroundColor: s.otpController.text.length>3? AppColor.appColor:Color(0XFFF0D5AA),
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                      ),

                      child: _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : Text("Submit"),
                    ),
                    SizedBox(height: 20),

                    // Resend OTP Option
                    GestureDetector(
                      onTap: () {
                        Get.snackbar("OTP Resent", "A new OTP has been sent to your number.",
                            snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.blue, colorText: Colors.white);
                      },
                      child:


                      Text.rich(
                        TextSpan(
                          text: "Didn't receive an OTP? ",
                          style: TextStyle(fontSize: 16),
                          children: [
                            TextSpan(
                              text: "Resend",
                              style: TextStyle(fontWeight: FontWeight.bold, color: AppColor.appColor,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
        )
    );
  }
}






//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_state_manager/src/simple/get_state.dart';
//
// import 'package:pinput/pinput.dart';
//
//
//
// class OTPVerificationScreen extends StatelessWidget {
//
//
//   final focusNode = FocusNode();
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//
//     final defaultPinTheme = PinTheme(
//       width: 60,
//       height: 60
//
//       ,
//
//
//       textStyle: const TextStyle(
//         fontSize: 18,
//         color: Color.fromRGBO(30, 60, 87, 1),
//       ),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: AppColor.whitecolor
//       ),
//     );
//
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque, // Ensures taps outside are registered
//
//       onTap: () => FocusScope.of(context).unfocus(), // Dismiss keyboard
//
//       child: Scaffold(
//         backgroundColor:AppColor.whitecolor,
//         resizeToAvoidBottomInset: true,
//
//         body: SingleChildScrollView(
//             child:
//
//
//             GetBuilder<OtpVerificationController>(
//               init: OtpVerificationController(),
//               builder: (s) => Container(
//
//                 height: MediaQuery.of(context).size.height, // Constrain height to screen
//
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//
//                   //  crossAxisAlignment: CrossAxisAlignment.center,
//
//                   children: [
//                     // Logo Section
//                     Container(
//
//                       child: CircleAvatar(
//                         radius:  height * 2.2,
//                         backgroundImage:
//
//
//                         AssetImage("assets/images/16.png"),
//
//
//
//                       ),
//                     ),
//
//                     SizedBox(height: height * 2),
//
//
//
//
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                           color:AppColor.appColor,
//
//                           borderRadius: BorderRadius.only(     topLeft: Radius.circular(height * 1.2),  // Top-left corner radius
//                             topRight: Radius.circular( height * 1.2),)
//                       ),
//
//                       child: Column(
//
//
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//
//                         children: [
//
//
//
//                           SizedBox(height: height * .9),
//
//                           // Card Section for OTP
//                           Container(
//
//                             child: Column(
//
//                               children: [
//                                 // Heading Text
//                                 Text(
//                                   'मोबाइल OTP दर्ज करे',
//                                   style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.black,height*.9),
//
//                                 ),
//                                 SizedBox(height: height * .3),
//
//                                 // Subheading Text
//
//
//
//                                 Text(
//
//                                   'आपके नंबर ${s.maskPhoneNumber(s.mobile_no)} चार अंकीय कोड भेजा गया',
//                                   style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.35),
//
//                                   textAlign: TextAlign.center,
//                                 ),
//                                 SizedBox(height: height * .5),
//
//
//
//
//
//                                 Form(
//
//
//                                   key: formKey,
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Directionality(
//                                         // Specify direction if desired
//                                         textDirection: TextDirection.ltr,
//                                         child: Pinput(
//                                           length: 4,
//                                           controller: s. pinController,
//                                           focusNode: focusNode,
//                                           //androidSmsAutofillMethod:
//                                           //  AndroidSmsAutofillMethod.smsUserConsentApi,
//                                           //  listenForMultipleSmsOnAndroid: true,
//                                           defaultPinTheme: defaultPinTheme,
//                                           // separatorBuilder: (index) => const SizedBox(width: 10),
//                                           validator: (value) {
//                                             return value?.length !=4  ?  'Otp is incorrect' : null;
//                                           },
//                                           // onClipboardFound: (value) {
//                                           //   debugPrint('onClipboardFound: $value');
//                                           //   pinController.setText(value);
//                                           // },
//                                           hapticFeedbackType: HapticFeedbackType.lightImpact,
//                                           onCompleted: (pin) {
//                                             debugPrint('onCompleted: $pin');
//                                           },
//                                           onChanged: (value) {
//                                             debugPrint('onChanged: $value');
//                                           },
//                                           cursor: Column(
//                                             mainAxisAlignment: MainAxisAlignment.end,
//                                             children: [
//                                               Container(
//                                                 margin: const EdgeInsets.only(bottom: 9),
//                                                 width: 20,
//                                                 height: 1,
//                                                 color: Colors.grey,
//                                               ),
//                                             ],
//                                           ),
//                                           focusedPinTheme: defaultPinTheme.copyWith(
//                                             decoration: defaultPinTheme.decoration!.copyWith(
//                                               borderRadius: BorderRadius.circular(10),
//                                               border: Border.all(color: AppColor.activebtncolor),
//                                             ),
//                                           ),
//                                           submittedPinTheme: defaultPinTheme.copyWith(
//                                             decoration: defaultPinTheme.decoration!.copyWith(
//                                               color: AppColor.whitecolor,
//                                               borderRadius: BorderRadius.circular(10),
//                                               border: Border.all(color: AppColor.whitecolor),
//                                             ),
//                                           ),
//                                           errorPinTheme: defaultPinTheme.copyBorderWith(
//                                             border: Border.all(color: Colors.redAccent),
//                                           ),
//                                         ),
//                                       ),
//
//                                     ],
//                                   ),
//                                 ),
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
//                                 s.isLoading2
//                                     ?
//                                 Container(
//                                     alignment: Alignment.center,
//                                     margin: EdgeInsets.all(10),
//
//                                     child: Text("Resend otp in 0:"
//                                         +s.start.toString(),
//                                       style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.3),
//                                     )   ):
//
//
//
//                                 TextButton(
//                                   style: TextButton.styleFrom(
//                                     textStyle: const TextStyle(fontSize: 20),
//                                   ),
//                                   onPressed: () {
//
//
//
//                                     s.isLoading2=true;
//
//
//
//                                     s.start=30;
//
//                                     s.startTimer();
//
//                                     s.ResendOtpfun();
//
//
//
//
//                                   },
//                                   child:
//
//                                   Text('आपका OTP समाप्त हो गया है 00:00 Resend Code',
//                                     style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.3),
//                                   ),
//                                 ),
//
//
//
//                                 SizedBox(height: height * .5),
//
//                                 // Resend OTP Timer
//                                 // Text('आपका OTP समाप्त हो गया है 00:00 Resend Code',
//                                 //   style: Newtextstyle.normaNoSpacingboldlopenSans(Colors.white,height*.3),
//                                 //
//                                 //   textAlign: TextAlign.center,
//                                 // ),
//                                 //
//                                 //
//                                 // SizedBox(height: height * .5),
//                                 //
//
//
//                                 s. isLoading.value ?
//
//                                 CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.whitecolor):
//
//
//
//                                 ElevatedButton(
//                                   onPressed: () {
//
//
//
//                                     //     Get.offAll(() => MembershipForm());
//
//                                     if(formKey.currentState!.validate()){
//
//
//                                       // Navigator.push(
//                                       //   context,
//                               4        //   MaterialPageRoute(builder: (context) => MembershipForm()),);
//                                       //
//
//
//                                       s.User_Verificy_Fun();
//
//
//
//                                     }else{
//                                       print("cds,c,ld,lcd");
//
//                                       Get.snackbar(
//                                         "Invalid your otp",
//                                         "",
//                                         backgroundColor: AppColor.whitecolor,
//                                         forwardAnimationCurve: Curves.easeOutBack,
//                                         snackPosition: SnackPosition.BOTTOM,
//
//                                       );
//
//                                       s.update();
//
//
//
//                                       // CustomWidgets.showToast("Service is not available at this address!! Try another");
//
//
//
//                                     }
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
//                                   },
//                                   style: ElevatedButton.styleFrom(
//                                     backgroundColor: Colors.orange[300],
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(25),
//                                     ),
//                                     side: BorderSide(color: AppColor.whitecolor, width: 2.5),
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: height * .7,
//                                       vertical: height * .2,
//                                     ),
//                                   ),
//                                   child: Text(
//                                     "ओटीपी वेरीफाई करे",
//
//
//
//
//                                     style: Newtextstyle.normaNoSpacingboldlopenSans(AppColor.blackcolor,height*.4),
//
//
//
//                                   ),
//                                 ),
//
//                                 // Verify Button
//                               ],
//                             ),
//                           ),
//                           SizedBox(height: height * .5),
//
//                           // Footer Section
//                           Column(
//
//
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.start,
//
//                             children: [
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
//                               Container(
//                                 height: height*1.2,
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   textAlign: TextAlign.start,
//
//                                   "जन सहमति पार्टी",
//                                   style: Newtextstyle.normalopenSans(Colors.white,height*.9),),
//
//
//
//                               ),
//                               Container(
//                                 alignment: Alignment.center,
//                                 child: Text(
//                                   '"जनता की सहमति, लोकतंत्र की मजबूती"',
//
//                                   style: Newtextstyle.normaNoSpacinglopenSans(Colors.black,height*.4),
//                                   textAlign: TextAlign.start,
//                                 ),
//                               ),
//
//
//
//                               SizedBox(height: height * .3),
//
//                             ],
//                           ),
//
//
//                         ],
//                       ),),
//
//
//
//
//                     //   SizedBox(height: height * 3),
//
//
//                   ],
//                 ),
//               ),
//
//
//             )
//         ),
//       ),
//     );
//   }
// }
