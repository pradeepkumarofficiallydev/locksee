// import 'dart:async';
// import 'dart:io';
// import 'dart:math';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:locksee/controller/login_controller.dart';
//
// import '../Utils/Strings.dart';
// import '../data/response/status.dart';
// import '../model_view/auth_repository.dart';
// import '../models/LoginResponse.dart';
// import '../models/RegisterResponse.dart';
// import '../models/SendOTPResponse.dart';
// import '../models/SignUpEmailMobileVerificationResponse.dart';
// import '../screens/home_screen.dart';
// import '../utils/AppColors.dart';
// import '../utils/Preference.dart';
// import '../utils/SecureStorageService.dart';
// import '../utils/SecureStorageService.dart';
// import 'package:http/http.dart' as http;
//
//
//
//
// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:locksee/utils/AppColors.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../Utils/Strings.dart';
// import '../data/response/status.dart';
// import '../model_view/other_repository.dart';
// import '../models/LoginResponse.dart';
// import '../utils/SecureStorageService.dart';
// import 'package:http/http.dart' as http;
//
//
// import 'dart:io';
// import 'package:http/http.dart' as http;
// import 'package:path/path.dart';
// import 'package:mime/mime.dart';
//
// import 'package:http_parser/http_parser.dart';
//
//
// class  ProfileSetupController extends GetxController
// {
//   var isLoading = false.obs;
//
//   var isLoadingImage = false.obs;
//
//
//
//
//   final api =AuthRepository();
//   final  rxRequestStatus=Status.LOADING.obs;
//   final RxString  Error=''.obs;
//   final registerResponse=RegisterResponse().obs;
//
//
//
//
//
//   final SecureStorageService storageService = SecureStorageService();
//   final signUpEmailMobileVerificationResponse=SignUpEmailMobileVerificationResponse().obs;
//   final sendOTPResponse=SendOTPResponse().obs;
//   TextEditingController firstNameController = TextEditingController();
//
//
//
//   String? accessToken="";
//
//
//   var data = Get.arguments;
//   //UserDetailsController( this.data);
//
//   // File? imageFile;
//   final picker = ImagePicker();
//   var phone="";
//
//   @override
//   Future<void> onInit() async {
//     super.onInit();
//
//
//     phone=    Preference.shared?.getString(Preference.USER_MOBILE)?? "";
//
//
// print("phone data ${phone}");
//
//
//
//
//
//
//
//     final SecureStorageService storageService = SecureStorageService();
//     accessToken = await storageService.getAccessToken();
//     print("Stored Token: $accessToken");
//
//
//   }
//
//
//
//
//
//
//
//   var nameController = TextEditingController();
//   var selectedDay = "01".obs;
//   var selectedMonth = "01".obs;
//   var selectedYear = "2000".obs;
//   var profileImage = Rx<File?>(null);
//   var isFormValid = false.obs; // ✅ Make it observable
//
//   void pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       profileImage.value = File(pickedFile.path);
//     }
//   }
//
//   void checkFormValidity() {
//     isFormValid.value = nameController.text.isNotEmpty;
//   }
//
//
//
//
//
//   //
//   // void _getSharedPreferences()
//   // {
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //   country_id  = Preference.shared?.getInt(Preference.COUNTRY_ID)??0;
//   //
//   //   culture_id  = Preference.shared?.getInt(Preference.CULTURE_ID)??0;
//   //
//   //
//   //
//   //   timeZone.value= Preference.shared?.getString(Preference.TIME_ZONE)??"";
//   //
//   //   // user_email=Preference.shared?.getString(Preference.USER_EMAIL_ID)??"";
//   //   // user_mobile_no= Preference.shared?.getString(Preference.USER_MOBILE)?? "";
//   //   // add_range= Preference.shared?.getString(Preference.ADD_RANGE)??"";
//   //   // cap_distance= Preference.shared?.getString(Preference. CAP_DISTANCE)??"";
//   //   // userVehicaleImage= Preference.shared?.getString(Preference. USER_VEHICALE_IMAGE)??"";
//   //   //
//   //   //
//   //   // userVehicaleName= Preference.shared?.getString(Preference. USER_VEHICALE_NAME)??"";
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   //
//   // }
//   //
//   //
//   //
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
//   submitInquiry() async {
//     isLoadingImage(true);
//     update();
//
//
//     var requestInfo;
//
//     Stopwatch stopwatch = Stopwatch();
//
//     var map = new Map<String, dynamic>();
//
//
//
//
//
//     try {
//       var request = http.MultipartRequest(
//         'POST',
//         Uri.parse('${Strings.Url}user/create'),
//       );
//
//       request.headers.addAll({
//
//        // "Authorization": "Bearer $accessToken",
//         "Authorization": "Bearer $accessToken",
//
//         "Content-Type": "multipart/form-data",
//         //'x-access-token': accessToken!,
//       });
//
//       // Adding form fields
//       request.fields['phoneNumber'] = phone ?? "";
//       request.fields['username'] = nameController.text ?? "";
//       request.fields['bio'] = "No";
//       request.fields['dob'] = "${selectedDay}/${selectedMonth}/${selectedYear}";
//
//
//
//       // var selectedDay = "01".obs;
//       // var selectedMonth = "01".obs;
//       // var selectedYear = "2000".obs;
//       //
//
//       // ✅ Attach image only if the user has selected one
//       if ( profileImage.value != null && await  profileImage.value!.exists()) {
//         print("🔹 File Exists → ${ profileImage.value!.path}");
//
//
//         request.files.add(
//           await http.MultipartFile.fromPath(
//             'profilePicture',
//             profileImage.value!.path,
//             filename: basename( profileImage.value!.path),
//
//           ),
//         );
//       } else {
//         print("⚠️ No File Selected, Proceeding Without Attachment");
//       }
//
//
//       // Send request
//       var response = await request.send().timeout(
//         Duration(seconds: 30),
//         onTimeout: () {
//           isLoadingImage(false);
//           update();
//           print("❌ Request timed out!");
//           throw Exception("Request timeout");
//         },
//       );
//
//       var responseBody = await http.Response.fromStream(response);
//
//       if (response.statusCode == 201) {
//
//
//         //
//         // Get.snackbar(
//         //   'emailSentSuccessfully'.tr,
//         //   "",
//         //   backgroundColor: AppColor.appColor,
//         //   colorText: AppColor.whitecolor,
//         //   forwardAnimationCurve: Curves.easeOutBack,
//         //   snackPosition: SnackPosition.BOTTOM,
//         // );
//
//
//
//
//           Preference.shared?.setBool(Preference.IS_USER_FIRSTTIME,false );
//           print(Preference.shared.getBool(Preference.IS_USER_FIRSTTIME));
//
//
//
//
//
//           Get.offAll(HomeScreen());
//           print("✅ Inquiry submitted successfully: ${responseBody.body}");
//
//
//
//
//       } else {
//
//
//
//
//
//
//         print("❌ Failed to submit inquiry: ${response.reasonPhrase}");
//       }
//
//
//
//     } catch (e) {
//       print("🚨 Error: $e");
//     } finally {
//       isLoadingImage(false);
//       update();
//     }
//   }
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
//   @override
//   void onClose() {
//
//
//
//
//     super.onClose();
//   }
//
//
//
//   @override
//   void dispose() {
//
//     super.dispose();
//
//
//   }
//
// }
//
//
//
//
//








import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../model_view/auth_repository.dart';
import '../models/RegisterResponse.dart';
import '../models/SendOTPResponse.dart';
import '../models/SignUpEmailMobileVerificationResponse.dart';
import '../screens/home_screen.dart';
import '../utils/Preference.dart';
import '../utils/SecureStorageService.dart';
import '../Utils/Strings.dart';

class ProfileSetupController extends GetxController {
  var isLoading = false.obs;
  var isLoadingImage = false.obs;
  var isFormValid = false.obs;

  final AuthRepository api = AuthRepository();
  final registerResponse = RegisterResponse().obs;
  final sendOTPResponse = SendOTPResponse().obs;
  final signUpEmailMobileVerificationResponse = SignUpEmailMobileVerificationResponse().obs;

  final SecureStorageService storageService = SecureStorageService();
  final nameController = TextEditingController();
  final picker = ImagePicker();

  var phone = "";
  String? accessToken = "";
  RxString  userId = "".obs;

  var selectedDay = "01".obs;
  var selectedMonth = "01".obs;
  var selectedYear = "2000".obs;
  var profileImage = Rx<File?>(null);

  @override

  Future<void> onInit() async {
    super.onInit();
    phone = Preference.shared?.getString(Preference.USER_MOBILE) ?? "";
    accessToken = await storageService.getAccessToken();

    userId  .value= (await storageService.getUserId())!;

    print("📱 Phone: $phone");
    print("🔑 Stored Token: $accessToken");

    print("🔑  userId: $userId");


    update();



    nameController.addListener(() {
      checkFormValidity();
    });
  }








  var isImageError = false.obs; // ✅ New variable to track image validation

  // void pickImage() async {
  //   final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     profileImage.value = File(pickedFile.path);
  //     isImageError.value = false; // ✅ Remove error when an image is selected
  //   }
  // }
  //
  // void checkFormValidity() {
  //   // ✅ Ensure form validity includes image check
  //   isFormValid.value = nameController.text.isNotEmpty && profileImage.value != null;
  // }
  //









  var isNameError = false.obs; // ✅ Name validation



  void pickImage() async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
  profileImage.value = File(pickedFile.path);
  isImageError.value = false; // ✅ Remove error when image is selected
  checkFormValidity(); // ✅ Re-check form validity
  }
  }

  void checkFormValidity() {
  bool nameValid = nameController.text.trim().isNotEmpty;
  bool imageValid = profileImage.value != null;

  isNameError.value = !nameValid; // ✅ Show error if name is empty
  isImageError.value = !imageValid; // ✅ Show error if image is missing

  isFormValid.value = nameValid && imageValid;
  update();

  }


  // void submitInquiry() {
  // checkFormValidity(); // ✅ Ensure all fields are checked
  //
  // if (!isFormValid.value) {
  // return;
  //
  // // ✅ Proceed with form submission logic
  // print("Form Submitted Successfully!");
  // }
  //







  Future<void> submitInquiry() async {

    checkFormValidity(); // ✅ Ensure all fields are checked

    if (!isFormValid.value) {
      return;
    }
    isLoadingImage(true);
    update();




   // print("❌ Submission failed: ");

    try {
      var request = http.MultipartRequest('POST', Uri.parse('${Strings.Url}user/create'));

      request.headers.addAll({
        "Authorization": "Bearer $accessToken",
        "Content-Type": "multipart/form-data",
      });

      request.fields['phoneNumber'] = phone;
      request.fields['username'] = nameController.text;
      request.fields['bio'] = "No";
      request.fields['dob'] = "${selectedDay}/${selectedMonth}/${selectedYear}";

      if (profileImage.value != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'profilePicture',
            profileImage.value!.path,
            filename: basename(profileImage.value!.path),
          ),
        );
      }

      var response = await request.send().timeout(
        Duration(seconds: 30),
        onTimeout: () {
          print("❌ Request timed out!");
          throw TimeoutException("Request timeout");
        },
      );

      var responseBody = await http.Response.fromStream(response);

      if (response.statusCode == 201) {
        Preference.shared?.setBool(Preference.IS_USER_FIRSTTIME, false);
        Get.offAll(HomeScreen());
        print("✅ Inquiry submitted successfully: ${responseBody.body}");
      } else {
        print("❌ Submission failed: ${response.statusCode} → ${responseBody.body}");
      }
    } catch (e) {
      print("🚨 Error: $e");
    } finally {
      isLoadingImage(false);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}


