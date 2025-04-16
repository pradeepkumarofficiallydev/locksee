// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';
//
// import 'package:locksee/screens/home_screen.dart';
//
// class ProfileSetupScreen extends StatefulWidget {
//   @override
//   _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
// }
//
// class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
//   File? _image;
//   final TextEditingController _nameController = TextEditingController(text: "Someone");
//   final String uniqueId = "234812483";
//
//   DateTime? _selectedDate;
//
//
//   Future<void> _pickDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime(2000), // Default date
//       firstDate: DateTime(1900), // Minimum age limit
//       lastDate: DateTime.now(), // Maximum date is today
//     );
//
//     if (pickedDate != null && pickedDate != _selectedDate) {
//       setState(() {
//         _selectedDate = pickedDate;
//       });
//     }
//   }
//
//
//
//
//
//   Future<void> _pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Container(
//
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/Welcome.png"),
//               fit: BoxFit.cover,
//               colorFilter: ColorFilter.mode(
//                 Colors.white.withOpacity(0.8),
//                 BlendMode.dstATop,
//               ),
//             ),
//           ),
//
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Profile Image Picker
//                 GestureDetector(
//                   onTap: _pickImage,
//                   child: Column(
//                     children: [
//                       Container(
//                         width: 100,
//                         height: 100,
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: _image == null
//                             ? Icon(Icons.add, size: 40, color: Colors.black54)
//                             : ClipRRect(
//                           borderRadius: BorderRadius.circular(12),
//                           child: Image.file(_image!, fit: BoxFit.cover),
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text("Set profile image", style: TextStyle(fontSize: 14, color: Colors.black)),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 24),
//                 // Name Field
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text("Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 ),
//
//
//                 SizedBox(height: 8),
//                 TextField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[300],
//                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
//                   ),
//                 ),
//                 SizedBox(height: 24),
//
//
//                 InkWell(
//
//                   onTap: () => _pickDate(context),
//
//                   child: Container(
//
//                     alignment: Alignment.center,
//                     child:Text(
//
//                         _selectedDate == null
//                             ? "Date of birth"
//                             : "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}",
//
//
//
//                         style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
//
//
//                     ),
//                        // "Date of birth", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//
//
//
//                     width: 200,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       color: Colors.grey[300],
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                 ),
//
//
//                 SizedBox(height: 30),
//
//                 // Unique ID
//                 Text("Unique ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 2),
//                 Text(uniqueId, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 SizedBox(height: 40),
//                 // Done Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Get.to(HomeScreen());
//
//
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.black,
//                       foregroundColor: Colors.white,
//                       padding: EdgeInsets.symmetric(vertical: 14),
//                     ),
//                     child: Text("Done", style: TextStyle(fontSize: 16)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




/////////////////



////////////////////////////// /    //////

//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:locksee/controller/profile_setup_controller.dart';
// import 'dart:io';
//
// import '../utils/AppColors.dart';
// import '../utils/custom_widgets.dart';
// import 'home_screen.dart';
//
//
//
// class ProfileSetupScreen extends StatelessWidget {
//   final ProfileSetupController controller = Get.put(ProfileSetupController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      // backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Stack(
//           children
//               :
//               [Container(
//                  decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage("assets/images/Welcome.png"),
//                       fit: BoxFit.cover,
//                       colorFilter: ColorFilter.mode(
//                         Colors.white.withOpacity(0.8),
//                         BlendMode.dstATop,
//                       ),
//                     ),
//                   ),
//                 ),
//
//
//
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//
//
//                       SizedBox(height: 40),
//
//                       Text(
//                         "Complete Profile",
//                         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 20),
//
//                       GestureDetector(
//                         onTap: controller.pickImage,
//                         child: Stack(
//                           alignment: Alignment.bottomCenter,
//                           children: [
//                             Obx(() => CircleAvatar(
//                               radius: 50,
//                               backgroundImage: controller.profileImage.value != null
//                                   ? FileImage(controller.profileImage.value!)
//                                   : AssetImage("assets/images/userImage.jpg") as ImageProvider,
//                             )),
//                             Container(
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Colors.orange,
//                               ),
//                               padding: EdgeInsets.all(6),
//                               child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text("Unique ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//                       Text("234812483", style: TextStyle(fontSize: 14, color: Colors.black54)),
//                       SizedBox(height: 40),
//
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text("Enter Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//                       ),
//                       SizedBox(height: 8),
//
//                       TextField(
//                         controller: controller.nameController,
//                         onChanged: (value) => controller.checkFormValidity(), // ✅ Update form validity
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//                           hintText: "Enter your name",
//                         ),
//                       ),
//                       SizedBox(height: 20),
//
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Text("Enter Date of birth", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//                       ),
//                       SizedBox(height: 8),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Obx(() => Container(
//
//
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             decoration: BoxDecoration(
//                                 color: AppColor.whitecolor,
//
//                                 border: Border.all()
//                                 ,borderRadius: BorderRadius.circular(20)
//
//                             ),
//                             child: DropdownButton<String>(
//                               underline: SizedBox(), // Removes the underline
//
//                               value: controller.selectedDay.value,
//                               items: List.generate(31, (index) {
//                                 String day = (index + 1).toString().padLeft(2, '0');
//                                 return DropdownMenuItem(value: day, child: Text(day));
//                               }),
//                               onChanged: (value) => controller.selectedDay.value = value!,
//                             ),
//                           )),
//                           Obx(() => Container(
//
//
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             decoration: BoxDecoration(
//                                 color: AppColor.whitecolor,
//
//                                 border: Border.all()
//                                 ,borderRadius: BorderRadius.circular(20)
//
//                             ),
//                             child: DropdownButton<String>(
//                               underline: SizedBox(), // Removes the underline
//
//                               value: controller.selectedMonth.value,
//                               items: List.generate(12, (index) {
//                                 String month = (index + 1).toString().padLeft(2, '0');
//                                 return DropdownMenuItem(value: month, child: Text(month));
//                               }),
//                               onChanged: (value) => controller.selectedMonth.value = value!,
//                             ),
//                           )),
//                           Obx(() =>
//
//
//                               Container(
//
//
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             decoration: BoxDecoration(
//                                 color: AppColor.whitecolor,
//
//                                 border: Border.all()
//                                 ,borderRadius: BorderRadius.circular(20)
//
//                             ),
//                             child: DropdownButton<String>(
//                               underline: SizedBox(), // Removes the underline
//
//                               value: controller.selectedYear.value,
//                               items: List.generate(50, (index) {
//                                 String year = (1975 + index).toString();
//                                 return DropdownMenuItem(value: year, child: Text(year));
//                               }),
//                               onChanged: (value) => controller.selectedYear.value = value!,
//                             ),
//                           )),
//                         ],
//                       ),
//                       SizedBox(height: 30),
//

//                       // Obx(() => ElevatedButton(
//                       //
//                       //
//                       //   onPressed: controller.isFormValid.value ? () {} : null,
//                       //   style: ElevatedButton.styleFrom(
//                       //     backgroundColor: AppColor.appColor,
//                       //     minimumSize: Size(double.infinity, 50),
//                       //     shape: RoundedRectangleBorder(
//                       //       borderRadius: BorderRadius.circular(25),
//                       //     ),
//                       //   ),
//                       //   child: Text("Submit", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//                       // )),
//                       //
//                       //
//
//                   Obx(() =>
//
//                       controller.isLoadingImage.value
//                           ? CustomWidgets.showCircularIndicator1(context, 30, AppColor.appColor)
//                           :
//
//                       Padding(
//                         padding: const EdgeInsets.all(13.0),
//                         child: ElevatedButton(
//                           onPressed: () {
//
//
//                            // Get.to(HomeScreen());
//
//                             controller.submitInquiry();
//
//
//
//
//                            },
//
//
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColor.appColor,
//                             foregroundColor: Colors.white,
//                             minimumSize: Size(double.infinity, 50),
//                           ),
//                           child: Text("Submit"),
//                         ),
//                       ),
//
//                   )
//
//
//
//                     ],
//                   ),
//                 ),
//
//
//
//
//
//               ]
//
//
//
//         ),
//       ),
//     );
//   }
// }
//
//////////////////////






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../controller/profile_setup_controller.dart';
import '../utils/AppColors.dart';
import '../utils/custom_widgets.dart';
import 'home_screen.dart';

class ProfileSetupScreen extends StatelessWidget {
  final ProfileSetupController controller = Get.put(ProfileSetupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Background Image
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

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40),

                  // Title
                  Text(
                    "Complete Profile",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),

                  // Profile Picture with Validation
                  GestureDetector(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: Obx(() => Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage: controller.profileImage.value != null
                                  ? FileImage(controller.profileImage.value!) as ImageProvider
                                  : AssetImage("assets/images/userImage.jpg"),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.orange,
                              ),
                              padding: EdgeInsets.all(6),
                              child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),

                        // Show error message if image is not selected
                        if (controller.isImageError.value)
                          Text(
                            "Please select a profile image",
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                      ],
                    )),
                  ),
                  SizedBox(height: 10),

                  // Unique ID
                  Text("Unique ID", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),


              Obx(() =>
                  Text( controller. userId.value , style: TextStyle(fontSize: 14, color: Colors.black54)),

              ),


                  SizedBox(height: 40),

                  // Name Input Field
                  Align(


                    alignment: Alignment.centerLeft,
                    child: Text("Enter Name", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 8),
                  TextField(
                    controller: controller.nameController,
                    onChanged: (value) => controller.checkFormValidity(),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: "Enter your name",
                    ),
                  ),
                  SizedBox(height: 20),

                  // Date of Birth Dropdowns
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Enter Date of Birth", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildDropdown(controller.selectedDay, List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'))),
                      _buildDropdown(controller.selectedMonth, List.generate(12, (index) => (index + 1).toString().padLeft(2, '0'))),
                      _buildDropdown(controller.selectedYear, List.generate(50, (index) => (1975 + index).toString())),
                    ],
                  ),
                  SizedBox(height: 30),

                  // Submit Button with Validation


                  Obx(() => Padding(
                    padding: const EdgeInsets.all(13.0),
                    child:


                    controller.isLoadingImage.value

                        ? CustomWidgets.showCircularIndicator1(context, 35, AppColor.appColor)
                        :


                    ElevatedButton(
                      onPressed: controller.isFormValid.value
                          ? controller.submitInquiry
                          : null, // Disabled if form is invalid
                      style: ElevatedButton.styleFrom(
                        backgroundColor: controller.isFormValid.value ? AppColor.appColor : Colors.grey,
                        foregroundColor: Colors.white,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      child: Text("Submit"),
                    ),
                  )),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(RxString selectedValue, List<String> items) {
    return Obx(() => Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColor.whitecolor,
        border: Border.all(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        underline: SizedBox(),
        value: selectedValue.value,
        items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
        onChanged: (value) => selectedValue.value = value!,
      ),
    ));
  }
}





