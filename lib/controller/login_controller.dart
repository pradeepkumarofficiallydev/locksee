import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:locksee/utils/AppColors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/response/status.dart';
import '../model_view/auth_repository.dart';
import '../models/LoginResponse.dart';
import '../models/OtpVerificationResponse.dart';
import '../models/SendOTPResponse.dart';
import '../models/VerfiywhetherEmailMobResponse.dart';
import '../screens/ProfileSetupScreen.dart';
import '../screens/verification_screen.dart';
import '../utils/Preference.dart';
import '../utils/SecureStorageService.dart';
import '../utils/translation_service.dart';
import 'package:intl/intl.dart';




class  LoginController extends GetxController
{





  var email = "".obs;
  var deviceID = "Unknown".obs;
  var deviceName = "Unknown".obs;
  var deviceType = (Platform.isAndroid ? "android" : "ios").obs;
  var ipAddress = "192.168.0.1".obs; // Default
  var countryCode = "IN".obs; // Default
  var timeZone = "Asia/Kolkata".obs;
  var googleAdvId = "Unknown".obs;


  var counter = 30.obs; // OTP resend timer
  var isTimerRunning=false.obs;




  var isLoading = false.obs;
  var isLoading1= false.obs;


  final SecureStorageService storageService = SecureStorageService();

  final api =AuthRepository();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final loginResponse=LoginResponse().obs;
  final verfiywhetherEmailMobResponse=VerfiywhetherEmailMobResponse().obs;
  final sendOTPResponse=SendOTPResponse().obs;


  final otpVerificationResponse=OtpVerificationResponse().obs;





  String otp="";

  var isUserPassword=true.obs;



  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController otpController = TextEditingController();

  String user_mobile_no="";


  String firstName="";
  String lastName="";
  String emailId="";
  String mobile="";
  String password="";



  var isPasswordVisible = false.obs;

  var data = Get.arguments;



  final TranslationService _translationService = Get.find();

  @override
  void onInit() {
    super.onInit();


    _getSharedPreferences();



  }






  // Timer countdown function
  void startTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (counter > 0 && isTimerRunning.value) {
          counter--;
          update();


        startTimer();
      } else {

        isTimerRunning.value = false;
          update();




      }
    });
  }


  void login_fun()  async{

    isLoading(true);
    update();


    print("cccifcdcrr");



      Map<String, String> map =Map<String, String>();



        //  "phoneNumber": "+918449211042"


         map =   {
          "phoneNumber": '+91${phoneController.text.trim()}',


         };






    print("My data ${map}");

    isLoading(true);


    update();


    api.loginAPI(map) .then((value)
    async {

      rxRequestStatus.value=Status.COMPLETED;
      loginResponse.value=value;


      isLoading(false);
      update();


      if(loginResponse.value.statusCode==200)
      {


      // await storageService.saveAccessToken(loginResponse.value.data?.token??"");


       // Get.offNamed('/dashboard', arguments: {'refresh': true});

        Preference.shared?.setString(Preference.USER_MOBILE, '+91${phoneController.text.trim()}');


        Get.to(() => VerificationScreen());


      }


   //   print("my final response ${loginResponse.value.data?.data.firstName }");


    }


    ).onError((error, stackTrace)
    {

      isLoading(false);
      update();



      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }


  void _getSharedPreferences()
  {



    // country_code= Preference.shared?.getString(Preference.COUNTRY_CODE)??"";
    // user_email=Preference.shared?.getString(Preference.USER_EMAIL_ID)??"";
    // user_mobile_no= Preference.shared?.getString(Preference.USER_MOBILE)?? "";
    // add_range= Preference.shared?.getString(Preference.ADD_RANGE)??"";
    // cap_distance= Preference.shared?.getString(Preference. CAP_DISTANCE)??"";
    // userVehicaleImage= Preference.shared?.getString(Preference. USER_VEHICALE_IMAGE)??"";
    //
    //




    //
    // timeZone.value= Preference.shared?.getString(Preference.TIME_ZONE)??"";
    //
    // countryCode.value= Preference.shared?.getString(Preference.COUNTRY_CODE)??"";

  ///  print(countryCode);








  }


  void otp_verfica_fun()  async{

    isLoading(true);
    update();




    Map<String, String> map =Map<String, String>();



    //  "phoneNumber": "+918449211042"




    map =   {
      "phoneNumber": '+91${phoneController.text}',
      "otp": otpController.text,

    };








    print("My data ${map}");

    isLoading(true);


    update();


    api.otpVeriAPI(map) .then((value)
    async {

      rxRequestStatus.value=Status.COMPLETED;
      otpVerificationResponse.value=value;


      isLoading(false);
      update();


      if(otpVerificationResponse.value.statusCode==200)
      {


         await storageService.saveAccessToken(otpVerificationResponse.value?.result?.token??"");




         await storageService.saveUserId(otpVerificationResponse.value?.result?.user?.sId??"");


        // Get.offNamed('/dashboard', arguments: {'refresh': true});



         Preference.shared?.setString(Preference.USER_ID, otpVerificationResponse.value?.result?.user?.sId??"");



       var  userId=  Preference?.shared?.getString(Preference.USER_ID)??"";
         //
         //
         // print("useriD ${userId}");
         //
         // print("user ID ");
         //
         // print(otpVerificationResponse.value?.result?.user?.sId??"");

        Get.to(() => ProfileSetupScreen());



      }


      //   print("my final response ${loginResponse.value.data?.data.firstName }");


    }


    ).onError((error, stackTrace)
    {

      isLoading(false);
      update();



      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }






  @override
  void onClose() {




    super.onClose();
  }



  @override
  void dispose() {

    super.dispose();


  }




  bool isInputValid( String phone, String password ) {
    return  phone.isNotEmpty && (password.isNotEmpty) ;
  }



  void showInputError( String phone, String password  ) {
    if (phone.isEmpty) {
      showToastBar("Please enter your phone/ Email id");
    }


    else
        if (password.isEmpty) {
          showToastBar("Please enter your password");
        }




        // else   if (phone.length<10) {
    //   showToastBar("Please enter a 10-digit phone number.");
    // }



  }


  void showToastBar(String message){


    //
    // Fluttertoast.showToast(
    //   msg: message,
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.BOTTOM,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: Colors.black,
    //   textColor: Colors.white,
    //   fontSize: 13.0,
    // );
    //









    Get.snackbar(
      // user_login_response.value.message.toString(),
      message,
"",
    //  "Please enter your phone/ Email id",
      backgroundColor:AppColor.appColor,




      colorText:AppColor.whiteColor ,


      forwardAnimationCurve: Curves.easeOutBack,
      snackPosition: SnackPosition.BOTTOM,



    );



  }


  //
  // void showLanguageDialog() {
  //   showDialog(
  //     context: Get .context!,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Select Language'.tr),
  //         content: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //
  //
  //
  //
  //
  //
  //
  //             ListTile(
  //               contentPadding: EdgeInsets.zero,
  //
  //
  //               title: Text('English'),
  //               onTap: () {
  //                 _translationService.changeLanguage('en');
  //
  //
  //
  //                 Navigator.pop(context);
  //               },
  //             ),
  //                ListTile(
  //                  contentPadding: EdgeInsets.zero,
  //
  //
  //                  title: Text('French'),
  //               onTap: () {
  //                 _translationService.changeLanguage('fr');
  //                 Navigator.pop(context);
  //               },
  //             ),
  //
  //
  //             ListTile(
  //
  //               contentPadding: EdgeInsets.zero,
  //
  //               title: Text('French'),
  //               onTap: () {
  //                 _translationService.changeLanguage('fr');
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             ListTile(
  //               contentPadding: EdgeInsets.zero,
  //
  //               title: Text('French'),
  //               onTap: () {
  //                 _translationService.changeLanguage('fr');
  //                 Navigator.pop(context);
  //               },
  //             ),
  //
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  //





  final List<Map<String, String>> languages = [
    {'code': 'en', 'name': 'English'},
    {'code': 'fr', 'name': 'French'},
    {'code': 'de', 'name': 'German'},
    {'code': 'id', 'name': 'Indonesian'},
    {'code': 'it', 'name': 'Italian'},
    {'code': 'ja', 'name': 'Japanese'},
    {'code': 'ko', 'name': 'Korean'},
    {'code': 'pl', 'name': 'Polish'},
    {'code': 'pt', 'name': 'Portuguese'},
    {'code': 'es', 'name': 'Spanish'},
    {'code': 'th', 'name': 'Thai'},
    {'code': 'zh', 'name': 'Chinese (Simplified)'},
    {'code': 'nl', 'name': 'Dutch'},
    {'code': 'vi', 'name': 'Vietnamese'},
    {'code': 'ph', 'name': 'Filipino (Tagalog)'}
  ];





  bool isValidPhoneNumber(String phoneNumber) {
    final RegExp regex = RegExp(r'^[6-9]\d{9}$'); // Matches Indian phone numbers
    return regex.hasMatch(phoneNumber);
  }





  // Function to show the language selection dialog
  void showLanguageDialog() {
  showDialog(
  context: Get.context!,
  builder: (BuildContext context) {
  return AlertDialog(
  title: Text('Select Language'.tr),
  content: Column(
  mainAxisSize: MainAxisSize.min,
  children: languages.map((lang) {
  return




      InkWell(
        onTap: (){

          _translationService.changeLanguage(lang['code']!);
          Navigator.pop(context);

        },
        child: Container

          (

          padding: EdgeInsets.all(5),
          alignment: Alignment.centerLeft,


          child: Text(lang['name']!),),
      );


  //   ListTile(
  // contentPadding: EdgeInsets.zero,
  // title: Text(lang['name']!),
  // onTap: () {
  // _translationService.changeLanguage(lang['code']!);
  // Navigator.pop(context);
  // },
  // );
  }).toList(),
  ),
  );
  },
  );
  }
  }












