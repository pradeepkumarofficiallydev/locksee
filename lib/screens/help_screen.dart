import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locksee/controller/other_controller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/AppColors.dart';
import '../utils/app_text_styles.dart';

// class NeedHelpScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//
//     double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
//     double height = width * 0.4; // Maintain aspect ratio
//
//     return Scaffold(
//
//       appBar:
//
//
//
//       AppBar(
//
//         title: Text(
//
//           'Need help?',
//           style: TextStyle(color: AppColor.whiteColor),
//
//         ),
//         titleTextStyle:
//
//          AppTextStyles.normaNoSpacingboldlopenSans(AppColor.grayColor1,height*.45),
//
//
//
//         leading: IconButton(
//           icon: Icon(
//             size: 30,
//
//             Icons.arrow_back_ios_rounded, // You can replace this with any icon you want
//             color: AppColor.whiteColor,
//
//             // Custom color for the back button
//           ),
//           onPressed: () {
//             // You can define any action here, like navigating back
//             Navigator.pop(context); // This will pop the current screen off the stack
//           },
//         ),
//
//
//
//         backgroundColor: Colors.pinkAccent
//         ,
//
//
//
//
//
//
//         centerTitle: true,
//         elevation: 0,
//       ),
//
//
//
//
//       body:
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
//     Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//
//
//
//           // Container(
//           //
//           //   height: 90,
//           //
//           //
//           //   decoration: const BoxDecoration(
//           //     gradient: LinearGradient(
//           //       colors: [Colors.white, Colors.pinkAccent],
//           //       begin: Alignment.topCenter,
//           //       end: Alignment.bottomCenter,
//           //     ),
//           //   ),
//           //
//           //
//           //
//           //
//           //   child: Row(
//           //
//           //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //     children: [
//           //
//           //
//           //       IconButton(
//           //         icon: const Icon(Icons.arrow_back_ios_rounded ,
//           //             color: Colors.black),
//           //         onPressed: () {
//           //
//           //
//           //           Get.back();
//           //
//           //
//           //
//           //
//           //         },
//           //       ),
//           //
//           //
//           //
//           //
//           //       Text(
//           //         "Need help?",
//           //         style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           //       ),
//           //
//           //
//           //     ],
//           //   ),
//           // )
//           // ,
//
//
//
//     GetBuilder<OtherController>(
//     init: OtherController(),
//       builder: (s) =>
//
//           Padding(
//
//
//
//             padding: const EdgeInsets.all(20.0),
//
//             child: Column(
//               children: [
//                 Text(
//                   'Share your query with us and we’d reach out as soon as possible!',
//
//                   style: AppTextStyles.normaNoSpacingboldlopenSans(AppColor.grayColor1,height*.45),
//
//
//
//                 ),
//                 SizedBox(height: 20),
//                 Text(
//                   'Query Type *',
//                   style: TextStyle(color: Colors.grey[300], fontSize: 14),
//                 ),
//                 SizedBox(height: 8),
//
//
//
//
//
//


//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                   ),
//                   items: ['General Query', 'Feedback', 'Complaint']
//                       .map((item) => DropdownMenuItem(
//                     value: item,
//                     child: Text(item),
//                   ))
//                       .toList(),
//                   onChanged: (value) {},
//                 ),
//
//
//
//
//
//                 SizedBox(height: 16),
//                 Text(
//                   'Subject *',
//                   style: TextStyle(color: Colors.grey[300], fontSize: 14),
//                 ),
//                 SizedBox(height: 8),
//                 TextField(
//                   decoration: InputDecoration(
//                     hintText: 'Please enter subject',
//                     hintStyle: TextStyle(color: Colors.grey),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Message *',
//                   style: TextStyle(color: Colors.grey[300], fontSize: 14),
//                 ),
//                 SizedBox(height: 8),
//                 TextField(
//                   maxLines: 5,
//                   decoration: InputDecoration(
//                     hintText: 'Please enter message',
//                     hintStyle: TextStyle(color: Colors.grey),
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'Attachment',
//                   style: TextStyle(color: Colors.grey[300], fontSize: 14),
//                 ),
//                 SizedBox(height: 8),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                     minimumSize: Size(double.infinity, 48),
//                   ),
//                   child: Text('Browse file'),
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.green,
//                         minimumSize: Size(150, 48),
//                       ),
//                       child: Text('Submit'),
//                     ),
//                     OutlinedButton(
//                       onPressed: () {},
//                       style: OutlinedButton.styleFrom(
//                         minimumSize: Size(150, 48),
//                         side: BorderSide(color: Colors.green),
//                       ),
//                       child: Text(
//                         'Reset',
//                         style: TextStyle(color: Colors.green),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//
//     )
//
//
//         ],
//       ),
//       backgroundColor: Colors.white,
//
//
//     );
//   }
// }

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

class NeedHelpScreen extends StatefulWidget {
  const NeedHelpScreen({super.key});

  @override
  _NeedHelpScreenState createState() => _NeedHelpScreenState();
}

class _NeedHelpScreenState extends State<NeedHelpScreen> {
  // final _formKey = GlobalKey<FormState>();
  // String? _selectedCategory;
  // String _subject = '';
  // String _message = '';
  // File? _attachment;
  // bool _isLoading = false;
  // String _successMessage = '';
  // Timer? _timer;
  // int _seconds = 0;

  @override
  void dispose() {
   // _timer?.cancel();
    super.dispose();
  }

  // void _startTimer() {
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (_seconds > 0) {
  //       setState(() => _seconds--);
  //     } else {
  //       _timer?.cancel();
  //       setState(() => _successMessage = '');
  //     }
  //   });
  // }
  //
  // Future<void> _pickFile() async {
  //
  //
  //
  //   final result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     setState(() => _attachment = File(result.files.single.path!));
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
  // }
  //
  // Future<void> _submitForm() async {
  //   if (!_formKey.currentState!.validate()) return;
  //
  //   setState(() => _isLoading = true);
  //
  //   final request = http.MultipartRequest(
  //     'POST',
  //     Uri.parse('YOUR_API_ENDPOINT'),
  //   );
  //
  //   request.fields.addAll({
  //     'inquiry_type': _selectedCategory!,
  //     'subject': _subject,
  //     'message': _message,
  //   });
  //
  //   if (_attachment != null) {
  //     request.files.add(await http.MultipartFile.fromPath(
  //       'attachment',
  //       _attachment!.path,
  //       filename: path.basename(_attachment!.path),
  //     ));
  //   }
  //
  //   try {
  //     final response = await request.send();
  //     if (response.statusCode == 200) {
  //       setState(() {
  //         _successMessage = 'Email sent successfully';
  //         _seconds = 7;
  //         _startTimer();
  //       });
  //       _resetForm();
  //     }
  //   } catch (e) {
  //     // Handle error
  //   } finally {
  //     setState(() => _isLoading = false);
  //   }
  // }
  //
  // void _resetForm() {
  //   _formKey.currentState!.reset();
  //   setState(() {
  //     _selectedCategory = null;
  //     _attachment = null;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(

      backgroundColor:AppColor.whitecolor,

        appBar:


            AppBar(


              title: Text(
            'Need help?',
            style: TextStyle(color: AppColor.whiteColor),
          ),
          titleTextStyle: AppTextStyles.normaNoSpacingboldlopenSans(
              AppColor.grayColor1, height * .45),
          leading: IconButton(
            icon: Icon(
              size: 30,

              Icons.arrow_back_ios_rounded,
              // You can replace this with any icon you want
              color: AppColor.whiteColor,

              // Custom color for the back button
            ),
            onPressed: () {
              // You can define any action here, like navigating back
              Navigator.pop(
                  context); // This will pop the current screen off the stack
            },
          ),
          backgroundColor: Colors.pinkAccent,
          centerTitle: true,
          elevation: 0,
        ),
        body: GetBuilder<OtherController>(
          init: OtherController(),
          builder: (s) => Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: s.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (s.successMessage.isNotEmpty)
                        _SuccessMessage(s.successMessage),
                      Text(
                        'Share your query with us and we’d reach out as soon as possible!',
                        style: AppTextStyles.normaNoSpacingboldlopenSans(
                            AppColor.grayColor1, height * .45),
                      ),
                       SizedBox(height: height * .45),
                      DropdownButtonFormField<String>(
                        value: s.selectedCategory,
                        decoration:  InputDecoration(
                          labelStyle:


                           AppTextStyles.normalopenSans1(

                            AppColor.grayColor1, height * .34),

                          labelText: 'Query Type *',
                          border: OutlineInputBorder(),
                        ),
                        items: s.queryTypes.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['name'],
                            child: Text(item['name']),
                          );
                        }).toList(),
                        onChanged: (value) =>
                            setState(() => s.selectedCategory = value),
                        validator: (value) =>
                            value == null ? 'Please select a query type' : null,
                      ),





                       SizedBox(height: height * .5),
                      TextFormField(
                        decoration:  InputDecoration(
                          labelText: 'Subject *',

                          labelStyle:
                          AppTextStyles.normalopenSans1(

                              AppColor.grayColor1, height * .34),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter subject' : null,

                         onChanged: (value) => s.subject = value,


                      ),
                      SizedBox(height: height * .5),
                      TextFormField(
                        decoration:  InputDecoration(
                          labelText: 'Message *',


                          labelStyle:  AppTextStyles.normalopenSans1(

                              AppColor.grayColor1, height * .34),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(vertical: 40),
                        ),
                        maxLines: 3,
                        validator: (value) =>
                            value!.isEmpty ? 'Please enter message' : null,
                        onChanged: (value) => s.message = value,
                      ),
                      SizedBox(height: height * .5),


                      s.  imageFile == null ?

                      Text('Attachment',


                          style:  AppTextStyles.normalopenSans1(

                              AppColor.blackColor, height * .34),

                      ):SizedBox(),

                      s.  imageFile == null ?

                      OutlinedButton(
                        onPressed: ()
                        async {



                          Map<Permission, PermissionStatus> statuses =
                          await [Permission.camera, Permission.photos]
                            .request();
                        if (statuses[Permission.photos]!.isGranted &&
                        statuses[Permission.camera]!.isGranted) {
                        s. showImagePicker(context,height);
                        } else {
                        print('no permission provided');
                        }
                          s.showImagePicker(context,height);



                          },
                        child:  Text('Browse File',

                          style:  AppTextStyles.normalopenSans1(

                              AppColor.blackColor, height * .34),


                        ),
                      )


:

                      Container(

                        //  width: 120,
                        height: 100,

                        //   color: Colors.red,

                        alignment: Alignment.centerLeft,


                        child: Stack(

                          alignment: Alignment.topRight

                          ,

                          children: [




                            Container(
                              alignment: Alignment.center,


                              width: 100,
                              height: 100,

                              child:



                              Image.file(
                                s.imageFile!,
                                fit: BoxFit.fill,
                                width: 100,
                                height: 100,

                              ),
                            ),






                            InkWell(

                                onTap: ()

                                {



                                  setState(() {
                                    s. imageFile=null;
                                  });


                                },


                                child: Icon(Icons.close,color: Colors.black,)),


                          ],
                        ),
                      ),







                      if (s.attachment != null)
                        Text(path.basename(s.attachment!.path)),
                      SizedBox(height: height * .9),
                      Row(
                        children: [
                          Expanded(
                            child:

                            //
                            // ElevatedButton(
                            //
                            //   onPressed: _submitForm,
                            //   child:  Text('Submit',
                            //
                            //
                            //
                            //     style: AppTextStyles.normalopenSans(
                            //         AppColor.blackColor, height * .45),
                            //   ),
                            // ),
                            //




                       ElevatedButton(
                      onPressed: () {

                        s.uploadImage();


                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.appColor,

                         minimumSize: Size(150, 48),
                      ),
                      child: Text('Submit',
                        style: AppTextStyles.normalopenSans1(
                            AppColor.whitecolor, height * .45),

                      ),
                    ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: OutlinedButton(

                              style: ElevatedButton.styleFrom(
                             //   backgroundColor: AppColor.appColor,
//
                                minimumSize: Size(150, 48),
                              ),
                              onPressed: null,
                              child:  Text('Reset',



                                style: AppTextStyles.normalopenSans1(
                                    AppColor.blackColor, height * .45),


                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
               // if (s.isLoading.value) const CustomLoader(),
            ],
          ),
        ));
  }
}

class _SuccessMessage extends StatelessWidget {
  final String message;

  const _SuccessMessage(this.message);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(message),
    );
  }
}

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
