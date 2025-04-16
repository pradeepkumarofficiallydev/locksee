import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:locksee/controller/login_controller.dart';

import '../data/response/status.dart';
import '../model_view/auth_repository.dart';
import '../models/LoginResponse.dart';
import '../models/RegisterResponse.dart';
import '../models/SendOTPResponse.dart';
import '../models/SignUpEmailMobileVerificationResponse.dart';
import '../utils/AppColors.dart';
import '../utils/Preference.dart';
import '../utils/SecureStorageService.dart';

class  UserDetailsController extends GetxController
{
  var isLoading = false.obs;

  var  isLoadingSignUp= false.obs;

  var isLoading1 = false.obs;

  final api =AuthRepository();
  final  rxRequestStatus=Status.LOADING.obs;
  final RxString  Error=''.obs;
  final registerResponse=RegisterResponse().obs;


  var country_id;
  var culture_id;



  String firstName = '';
  String lastName = '';
  String selectedGender = 'Male'; // Default selection



  var deviceID = "Unknown".obs;
  var deviceName = "Unknown".obs;
  var deviceType = (Platform.isAndroid ? "android" : "ios").obs;
  var ipAddress = "192.168.0.1".obs; // Default
  var countryCode = "IN".obs; // Default
  var timeZone = "Asia/Kolkata".obs;
  var googleAdvId = "Unknown".obs;



  String selectedMonth = 'Jun';
  String selectedDay = '17';
  String selectedYear = '1952';

  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final List<String> years = List.generate(50, (index) => (1950 + index).toString());

  // Days for each month
  final Map<String, int> daysInMonth = {
    'Jan': 31, 'Feb': 28, 'Mar': 31, 'Apr': 30, 'May': 31, 'Jun': 30,
    'Jul': 31, 'Aug': 31, 'Sep': 30, 'Oct': 31, 'Nov': 30, 'Dec': 31,
  };



  final SecureStorageService storageService = SecureStorageService();
  final signUpEmailMobileVerificationResponse=SignUpEmailMobileVerificationResponse().obs;
  final sendOTPResponse=SendOTPResponse().obs;

  final loginResponse=LoginResponse().obs;




  String otp_by_email="";
  String otp_by_mobile="";


  String user_mobile_no="";


  String emailId="";
  String mobile="";
  String password="";



  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController passwordController = TextEditingController();





  var data = Get.arguments;
  //UserDetailsController( this.data);



  @override
  void onInit() {
    super.onInit();


    _getSharedPreferences();

    fetchDeviceDetails();

    updateDays();

    //  print(" argument ${data['firstName']}");
     //
     // firstName=data['firstName'];
     // lastName=data['lastName'];
     // emailId=data['emailId'];
     // mobile=data['mobile'];
     // password=data['password'];




  }







  // Worked on integrated the /api/login/img_buffer API for handling image buffer in the login process.
  // Implemented the /api/polls/poll_answer_list API to fetch and display poll answers dynamically.
  // Integrated the /api/content_page API to retrieve and manage content pages within the application.
  // UI Data Integration:
  //
  // Successfully mapped and displayed all retrieved data in the UI.
  // Ensured real-time data updates and optimized API response handling.
  // Applied necessary validations and error handling for a smooth user experience.
  //
  //




  Future<void> fetchDeviceDetails() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceID.value = androidInfo.id;
      deviceName.value = androidInfo.model;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceID.value = iosInfo.identifierForVendor ?? "Unknown";
      deviceName.value = iosInfo.utsname.machine ?? "iPhone";




    }




    // Fetch Time Zone

    // Fetch Google Advertising ID (GAID)
    // await fetchGoogleAdvertisingId();
  }






  void send_sms_by_otp(int culture_id)  async{

    isLoading(true);
    update();
    String  otp= await  generateRandomOtp();
    this.otp_by_mobile=otp;


    print("first otp");

    print(otp);


    var map= {
      "phone_no": mobileController.text,
      "verificationCode": otp,
      "country_code": "IN",
      "first_name": firstNameController.text,
      "culture_id":'4',
      "deviceId": "clcelpe"

    };

    api.send_otp(map) .then((value)
    {

      rxRequestStatus.value=Status.COMPLETED;
      sendOTPResponse.value=value;


      // isLoading(false);
      // update();

      if(sendOTPResponse.value.success==true)
      {




      }


      print("my final response ${sendOTPResponse.value.success}");



    }


    ).onError((error, stackTrace)
    {

      isLoading(false);
      update();



      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });








  }

  void send_sms_by_email(int culture_id)  async{

    // isLoading(true);
    // update();
    String  otp= await  generateRandomOtp();
    this.otp_by_email=otp;

    print("first otp");

    print(otp);


    var map= {
      "email": emailIdController.text,
      "verificationCode": otp,
      "country_code": "IN",
      "first_name": "User",
      "culture_id": '4',
      "deviceId": "clcelpe"

    };

    api.send_otp(map) .then((value)
    {

      rxRequestStatus.value=Status.COMPLETED;
      sendOTPResponse.value=value;
      isLoading(false);
      update();

      if(sendOTPResponse.value.success==true)
      {


        print("myhh response ${sendOTPResponse.value.success}");



        Get.toNamed('/verification_screen', arguments: data);




      }





    }


    ).onError((error, stackTrace)
    {

      isLoading(false);
      update();



      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });








  }



  void register_fun()  async{

    isLoadingSignUp(true);
    update();



    print('${selectedYear}-${selectedDay}-${selectedMonth}');

    var map =   {
      "email": emailIdController.text ,
      "phone_number": mobileController.text,
      "password": passwordController.text,
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      // "dob": "1997-12-22",

      "dob":'${selectedYear}-${(daysInMonth.keys.toList().indexOf(selectedMonth!) + 1).toString().padLeft(2, '0')}-${selectedDay}',
      "gender": selectedGender=="Male"?"M": selectedGender=="Female"?"F":'Others',

      "country_id": country_id,
      "device_id": deviceID.value   ,
      "device_type": deviceType.value,
      "device_name": deviceName.value,
      "idfa_gaid": "GoogleAdvID",
      "language_id": 0,
      "ip_address": ipAddress.value,
      "source": 1,
      "verification_method": 4,
      "referer_url": "string",
      "vid": "",
      "gdpr_status": 0,
      "last_form_submit": 1,
      "visiting_ip": "114.143.228.126",
      "registration_ip": "114.143.228.126",
      "login_with": 1,
      "reference": 0,
      "source_user_id2": 0,
      "time_to_complete_reg_form": "3.09",
      "timeZone": timeZone.value


    };



    api.registerAPI(map) .then((value)
    async {



      rxRequestStatus.value=Status.COMPLETED;
      registerResponse.value=value;





      isLoadingSignUp(false);
      update();



      if(registerResponse.value.success==true)
        {



        //  await storageService.saveAccessToken(loginResponse.value.data?.token??"");

          // final LoginController controller=LoginController();
          // if (Get.isRegistered<LoginController>()) {
          //   final LoginController controller = Get.find<LoginController>();
          //
          //
          //
          //   controller.login_fun();
          //   print("Controller found!");
          // } else {
          //
          //
          //
          //   controller.login_fun();
          //   print("Controller not found.");
          //
          // }
          //
          //
          //



        //  Get.offAllNamed('/dashboard');





        }

      else

      {



        Get.snackbar(
          registerResponse.value.message??"",
          "",
          backgroundColor:AppColor.appColor,
          colorText:AppColor.whiteColor ,
          forwardAnimationCurve: Curves.easeOutBack,
          snackPosition: SnackPosition.BOTTOM,);



        }






      print("my final response ${registerResponse.value }");

      // print( "myfinalResponsesss:${registerResponse?.value!.??""}");






    }


    ).onError((error, stackTrace)
    {

      isLoadingSignUp(false);
      update();



      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();




    });


  }

  void signUpEmailMobileVerificationFun()  async{

    isLoading1(true);
    update();

    var map =   {

        "email": emailIdController.text,
        "phone_number": mobileController.text,
        "country_id": country_id,



  };



    api.signUpEmailMobileVerificationApi(map) .then((value)
    {
      rxRequestStatus.value=Status.COMPLETED;
      signUpEmailMobileVerificationResponse.value=value;


      isLoading1(false);
      update();





      var data = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "emailId": emailIdController.text,
        "mobile": mobileController.text,
        "password": passwordController.text,

        "dateOfBrith": passwordController.text,

        "gender": passwordController.text,



      };


      print(signUpEmailMobileVerificationResponse.value.data?.phoneNumber);




      if(signUpEmailMobileVerificationResponse.value.data?.email=="success"&&  signUpEmailMobileVerificationResponse.value.data?.phoneNumber=="success")
      {


        Get.toNamed('/user_details_screen', arguments: data);


        print("my final ${registerResponse.value }");


      }
      else

      {


        if(signUpEmailMobileVerificationResponse.value.data?.email!="success")
        {


          Get.snackbar(
            signUpEmailMobileVerificationResponse.value.data?.email??"",
            "", backgroundColor:AppColor.appColor,
            colorText:AppColor.whiteColor ,
            forwardAnimationCurve: Curves.easeOutBack,
            snackPosition: SnackPosition.BOTTOM,
          );
        }


   else if(signUpEmailMobileVerificationResponse.value.data?.phoneNumber!="success")

          {



            Get.snackbar(
              signUpEmailMobileVerificationResponse.value.data?.phoneNumber??"",
              "",
              backgroundColor:AppColor.appColor,
              colorText:AppColor.whiteColor ,


              forwardAnimationCurve: Curves.easeOutBack,
              snackPosition: SnackPosition.BOTTOM,

            );


          }


        }






    }


    ).onError((error, stackTrace)
    {

      isLoading1(false);
      update();



      rxRequestStatus.value=Status.ERROR;
      Error.value=error.toString();


    });


  }




  void _getSharedPreferences()
  {







   country_id  = Preference.shared?.getInt(Preference.COUNTRY_ID)??0;

   culture_id  = Preference.shared?.getInt(Preference.CULTURE_ID)??0;



   timeZone.value= Preference.shared?.getString(Preference.TIME_ZONE)??"";

    // user_email=Preference.shared?.getString(Preference.USER_EMAIL_ID)??"";
    // user_mobile_no= Preference.shared?.getString(Preference.USER_MOBILE)?? "";
    // add_range= Preference.shared?.getString(Preference.ADD_RANGE)??"";
    // cap_distance= Preference.shared?.getString(Preference. CAP_DISTANCE)??"";
    // userVehicaleImage= Preference.shared?.getString(Preference. USER_VEHICALE_IMAGE)??"";
    //
    //
    // userVehicaleName= Preference.shared?.getString(Preference. USER_VEHICALE_NAME)??"";










  }




  static Future<String> generateOtp() async {
    final Random random = Random();
    String otp = '';
    for (int i = 0; i < 4; i++) {
      otp += random.nextInt(10).toString(); // Generate digits (0-9)
    }
    return otp;
  }

  // Generate OTP and store it in SharedPreferences
  static Future<String> generateRandomOtp() async {
    String otp = await generateOtp();
    Preference.shared?.setString(Preference.OTP ,otp);


    print("OTP Saved: $otp");


    return otp;
// Debugging purpose
  }







  void updateDays() {
    // Check if the selected month is February and if it's a leap year
    if (selectedMonth == 'Feb' && _isLeapYear(int.parse(selectedYear))) {
      // setState(() {
        daysInMonth['Feb'] = 29;

        update();

      // });
    } else if (selectedMonth == 'Feb') {
      // setState(() {
        daysInMonth['Feb'] = 28;
        update();

      // });
    }
    // Ensure that the selected day is valid for the updated month
    if (int.parse(selectedDay) > daysInMonth[selectedMonth]!) {
      // setState(() {
        selectedDay = daysInMonth[selectedMonth]!.toString();

        update();

      // });
    }
  }

  bool _isLeapYear(int year) {
    return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
  }



  @override
  void onClose() {




    super.onClose();
  }



  @override
  void dispose() {

    super.dispose();


  }

}





