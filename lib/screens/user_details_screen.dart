import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/screens/register_screen.dart';
import 'package:locksee/screens/testing2_screen.dart';
import 'package:locksee/screens/verification_screen.dart';

import '../controller/user_details_controller.dart';
import '../utils/AppColors.dart';
import '../utils/custom_widgets.dart';



class UserDetailsScreen extends StatefulWidget {

  // var data;
 // UserDetailsScreen({});

  @override
  _GenderSelectionScreenState createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<UserDetailsScreen> {





  // Controllers for each wheel
  final FixedExtentScrollController _monthController =
  FixedExtentScrollController(initialItem: 5); // Default to 'Jun'
  final FixedExtentScrollController _dayController =
  FixedExtentScrollController(initialItem: 16); // Default to '17'
  final FixedExtentScrollController _yearController =
  FixedExtentScrollController(initialItem: 2); // Default to '1982'

  @override
  void initState() {
    super.initState();
    // Ensure that the days list is updated based on the selected month

    ;


   // print("userdata ${widget.data.toString()} ");




  }












  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio





    return Scaffold(
      backgroundColor: AppColor.whiteColor,


       body: SingleChildScrollView(


        child:

        GetBuilder<UserDetailsController>(

        init: UserDetailsController(),
       builder: (s) =>



    Column(
          children: [

                        Stack(
              children: [
                Container(
                  //  color:Colors.pink,

                  child: ClipPath(
                    clipper: MyCustomClipper(),
                    child:




                    Container(
                      height: 250,
                      // Adjust the height to fit your design

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.pink, Colors.purple],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        // borderRadius: BorderRadius.vertical(
                        //   bottom: Radius.circular(30),
                        // ),
                      ),








                    ),
                  ),



                ),

                Positioned(child:


                Container(margin: EdgeInsets.only(top: 19),

                    child: Image.asset('assets/images/logo.png')),

                  top: 120,
                  left: 100,

                ),

              ],
            ),
        //







            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),


              child: Column(
                children: [
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //
                  //
                  //   child: Text(
                  //     "What is your Name?",
                  //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  //   ),
                  // ),





                  /// this name container












                  Container(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "What's your date of birth?",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,


                    mainAxisAlignment: MainAxisAlignment.spaceBetween,


                    children: [


                      Container(),

                      _buildWheelSelector(s.months, s.selectedMonth, (value) {
                        setState(() {
                          s.selectedMonth = value;
                         s. updateDays();
                        });
                      }, _monthController),
                      _buildWheelSelector(List.generate(s.daysInMonth[s.selectedMonth]!, (index) => (index + 1).toString()),s. selectedDay, (value) {
                        setState(() {
                          s.selectedDay = value;
                        });
                      }, _dayController),
                      _buildWheelSelector(s.years, s.selectedYear, (value) {
                        setState(() {
                          s.selectedYear = value;
                          s.updateDays();
                        });
                      }, _yearController),
                    ],
                  ),
                  SizedBox(height: 20),


                  // ElevatedButton(
                  //   onPressed: () {
                  //     showDialog(
                  //       context: context,
                  //       builder: (context) => AlertDialog(
                  //         title: Text("Date of Birth"),
                  //         content: Text(
                  //             "Month: $selectedMonth\nDay: $selectedDay\nYear: $selectedYear"),
                  //         actions: [
                  //           TextButton(
                  //             onPressed: () {
                  //               Navigator.pop(context);
                  //             },
                  //             child: Text("OK"),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },
                  //   child: Text("Submit"),
                  // ),



                  SizedBox(height: 20),



                  Container(
                    alignment: Alignment.centerLeft,

                    child: Text(
                      "What is your Gender?",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),



                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GenderOption(
                        gender: 'Male',
                        isSelected: s.selectedGender == 'Male',
                        onTap: () {
                          setState(() {
                            s.selectedGender = 'Male';
                          });
                        },
                      ),
                      GenderOption(
                        gender: 'Female',
                        isSelected: s.selectedGender == 'Female',
                        onTap: () {
                          setState(() {
                            s.selectedGender = 'Female';
                          });
                        },
                      ),
                      GenderOption(
                        gender: 'Others',
                        isSelected: s.selectedGender == 'Others',
                        onTap: () {
                          setState(() {
                            s.selectedGender = 'Others';
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 70),




                  s. isLoading.value ?

                  CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor):

                  ElevatedButton(
                    onPressed: () {

                 //  s.sendDataToApi();



                        s.send_sms_by_otp(s.culture_id);
                        s.send_sms_by_email(s.culture_id);







                      /// Get.to(OTPVerificationScreen());



                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text(
                      'NEXT',


                      style: TextStyle(fontSize: 18,color: AppColor.whiteColor),
                    ),
                  ),

                  SizedBox(height: 20),

                ],
              ),
            ),







          ],
        ),


        )
      ),
    );
  }




  Widget _buildTextField({
    required String hintText,
    required IconData icon,
    bool isPassword = false,
  })

  {
    return


      Container(
        // padding: EdgeInsets.only(left: 10),

        child: TextField(


          obscureText: isPassword,
          decoration: InputDecoration(

            contentPadding: EdgeInsets.only(left: 30,top: 15,bottom: 15)


            ,

            hintText: hintText,
            filled: true,
            fillColor: Colors.grey[200],
            ///  suffixIcon: Icon(icon),



            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 30),
              // Padding around the suffix icon
              child: Icon(icon)

              ,
            ),

            // You can also adjust the constraints of the suffix icon
            suffixIconConstraints: BoxConstraints(
              minWidth: 24, // Minimum width for the icon
              minHeight: 24, // Minimum height for the icon
            ),


            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      );
  }

  Widget _buildWheelSelector(List<String> items, String selectedItem, ValueChanged<String> onItemSelected, FixedExtentScrollController controller) {
    return Container(
      width: 100,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 5)),
        ],
      ),
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 50,
        onSelectedItemChanged: (index) {
          onItemSelected(items[index]);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Center(
              child: Container(
                alignment: Alignment.center,

                width: 70,
                height: 30,




                color: items[index] == selectedItem ? Colors.purple : Colors.transparent,

                child: Text(
                  items[index],
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: items[index] == selectedItem ? Colors.white : Colors.black,
                    backgroundColor: items[index] == selectedItem ? Colors.purple : Colors.transparent,
                  ),
                ),
              ),
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }

}



class GenderOption extends StatelessWidget {
  final String gender;
  final bool isSelected;
  final VoidCallback onTap;

  GenderOption({required this.gender, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(30),



        decoration: BoxDecoration(

                         color: isSelected ? Colors.purple : Colors.white,

            borderRadius: BorderRadius.circular(20),



           border: Border.all(color: Colors.black,width: 2)







        ),
        child: Column(
          children: [
            Icon(
              gender == 'Male'
                  ? Icons.male
                  : gender == 'Female'
                  ? Icons.female
                  : Icons.transgender,
              size: 40,
              color: isSelected ? Colors.white : Colors.black,
            ),
            Text(
              gender,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black),
            ),
          ],
        ),
      ),
    );
  }




}
