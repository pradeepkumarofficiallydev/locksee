import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
import 'package:locksee/utils/AppColors.dart';

import '../Utils/Strings.dart';
import '../data/response/status.dart';
import '../model_view/other_repository.dart';
import '../models/LoginResponse.dart';
import '../utils/SecureStorageService.dart';
import 'package:http/http.dart' as http;

class OtherController extends GetxController {
  final SecureStorageService storageService = SecureStorageService();
  final api = OtherRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final RxString Error = ''.obs;
  final loginResponse = LoginResponse().obs;

  File? imageFile;
  final picker = ImagePicker();
  String user_mobile_no = "";
  late var queryTypes = [];
  @override
  void onInit() {
    super.onInit();
    _getSharedPreferences();
  }

  final formKey = GlobalKey<FormState>();
  String? selectedCategory;
  String subject = '';
  String message = '';
  File? attachment;

  // bool isLoading = false;
  String successMessage = '';
  Timer? timer;


  String? accessToken="";

  void _getSharedPreferences()  async{

    queryTypes = [
      {
        "name": '_myAccount'.tr,
      },
      {
        "name": '_surveyInvitation'.tr,
      },
      {
        "name": '_profiles'.tr,
      },
      {
        "name": '_surveyExperience'.tr,
      },
      {
        "name": '_polls'.tr,
      },
      {
        "name": '_rewardCredits'.tr,
      },
      {
        "name": '_rewardRedemption'.tr,
      },
      {
        "name": '_contentAbuse'.tr,
      },
    ];


    final SecureStorageService storageService = SecureStorageService();
    accessToken = await storageService.getAccessToken();
    print("Stored Token: $accessToken");






  }

  void showImagePicker(BuildContext context, double height) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (builder) {
          return Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5.2,
              margin: EdgeInsets.only(top: height * 1, bottom: height * 1),
              padding: EdgeInsets.all(height * .3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: InkWell(
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          size: 60.0,
                        ),
                        SizedBox(height: height * .1),
                        Text(
                          "Gallery",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: height * .4, color: Colors.black),
                        ),
                        //    SizedBox(height:  height*.4),
                      ],
                    ),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.pop(context);
                    },
                  )),
                  Expanded(
                      child: InkWell(
                    child: SizedBox(
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 60.0,
                          ),
                          SizedBox(height: height * .1),
                          Text(
                            "Camera",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height * .4, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.pop(context);
                    },
                  ))
                ],
              ));
        });
  }

  _imgFromGallery() async {
    await picker
        .pickImage(source: ImageSource.gallery, imageQuality: 50)
        .then((value) {
      if (value != null) {
        // _cropImage(File(value.path));
        imageFile = File(value.path);

        update();
      }
    });
  }





  void showToastBar(String message) {
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
      backgroundColor: AppColor.appColor,

      forwardAnimationCurve: Curves.easeOutBack,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        // _cropImage(File(value.path));

        imageFile = File(value.path);
        update();
      }
    });
  }

  Future<void> uploadImage() async {
    if (!formKey.currentState!.validate()) return;

    if (imageFile == null) {
      ScaffoldMessenger.of(Get.context!!).showSnackBar(
        SnackBar(content: Text("Please select an image first!")),
      );
      return;
    }

    print("mdk cd");

    // try {
      var request = http.MultipartRequest(


        'POST',
//Uri.parse('${Strings.Url}needHelp'),

          Uri.parse('https://obiapp.locksee.com/api/needHelp/'),

        // Replace with your server URL
      );

      request.fields['inquiry_type'] = selectedCategory!; // Add 'name' field
      request.fields['subject'] = subject; // Add 'name' field
      request.fields['message'] = message; // Add 'name' field


      request.headers.addAll({
        'x-access-token': accessToken!,
        'Content-Type': 'multipart/form-data', // This is usually set automatically
      });



    //  request.files.add(await http.MultipartFile.fromPath(
        //       'attachment',
        //       _attachment!.path,
        //       filename: path.basename(_attachment!.path),
        //     ))


      request.files.add(await http.MultipartFile.fromPath(
        'attachment', // Field name expected by the server
        imageFile!.path,
           //  filename: path.basename(_attachment!.path),


      ));





      var response = await request.send();



    var responseBody = await http.Response.fromStream(response);
    print('Response body: ${responseBody.body}');


      print(response.statusCode.toString());

      if (response.statusCode == 200) {

          ScaffoldMessenger.of(Get.context!!).showSnackBar(
            SnackBar(content: Text("Upload successful!")),
          );
        } else {
          ScaffoldMessenger.of(Get.context!!).showSnackBar(
            SnackBar(content: Text("Upload failed!")),


          );
        }
    // } catch (e) {
     //// print(e);
      ScaffoldMessenger.of(Get.context!!).showSnackBar(
        SnackBar(content: Text("An error occurred!")),
      );
    //}



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
