import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:flutter/cupertino.dart';



import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/utils/AppColors.dart';

import '../../utils/app_text_styles.dart';
import '../TestingScreen.dart';

class FinanceTab  extends StatefulWidget {
  @override
  _BasicProfileTab createState() => _BasicProfileTab();
}

class _BasicProfileTab extends State<FinanceTab>


    with SingleTickerProviderStateMixin
{
  String _apiData = "Loading Household Data...";
  bool _isLoading = true;




  String? currentStudy = 'Yes';
  String? educationCompletion;
  String? higherEducationPlan;
  final List<String> completionTimes = ['Select an item'];
  final List<String> educationPlans = [
    'Select an item',
    'Yes, from a national College/University',
    'Yes, from a foreign College/ University',
    'I am not planning for higher education currently'
  ];




  TextEditingController emailController=TextEditingController();



  @override
  void initState() {
    super.initState();
    _fetchApiData();



    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300), // Animation duration
    );

    _heightAnimation = Tween<double>(begin: 0, end: 200).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );







  }

  // Simulate API call
  Future<void> _fetchApiData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    setState(() {
      _isLoading = false;
      _apiData = "Household Content Loaded";
    });
  }

  String? selectedValue;
  final List<String> items = ['Option 1', 'Option 2', 'Option 3'];



  // String? selectedValue;
  bool isDropdownOpen = false;
  //
  // final List<String> items = [
  //   'Option 1',
  //   'Option 2',
  //   'Option 3',
  //   'Option 4',
  //   'Option 5',
  // ];

  late AnimationController _animationController;
  late Animation<double> _heightAnimation;







  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void toggleDropdown() {
    if (isDropdownOpen) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      isDropdownOpen = !isDropdownOpen;
    });
  }


  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Center(
      child: _isLoading
          ? CircularProgressIndicator() // Show loading spinner while fetching data
          :

      Container(

        margin:  EdgeInsets.symmetric(vertical:height*.9,horizontal: height*.5,),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          mainAxisAlignment: MainAxisAlignment.start ,

          children: [





















            sectionTitle('Highest Level of Education',height),
            CustomDropdown(
              items: ['Full time employed', 'Part time employed', ''],
              hintText: 'Pick a fruit',
              dropdownHeight: 150,
              buttonDecoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                //   border: Border.all(color: Colors.green, width: 1.5),

              ),
              dropdownDecoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple, width: 1.5),
              ),
              textStyle:


              AppTextStyles.normalopenSans1(AppColor.blackColor,height*.26),
              onItemSelected: (value) {
                print('Fruit selected: $value');
              },
            ),



            SizedBox(height:  height*.4),






            sectionTitle('Which year did you complete your highest leve of education',height),

            CustomDropdown(
              items: ['Full time employed', 'Part time employed', ''],
              hintText: 'Pick a fruit',
              dropdownHeight: 150,
              buttonDecoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                //   border: Border.all(color: Colors.green, width: 1.5),

              ),
              dropdownDecoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple, width: 1.5),
              ),
              textStyle:


              AppTextStyles.normalopenSans1(AppColor.blackColor,height*.26),
              onItemSelected: (value) {
                print('Fruit selected: $value');
              },
            ),


            SizedBox(height:  height*.4),





            sectionTitle('Which is the specialization/major in your highest level of education?',height),

            CustomDropdown(
              items: ['Full time employed', 'Part time employed', ''],
              hintText: 'Pick a fruit',
              dropdownHeight: 150,
              buttonDecoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                //   border: Border.all(color: Colors.green, width: 1.5),

              ),
              dropdownDecoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple, width: 1.5),
              ),
              textStyle:


              AppTextStyles.normalopenSans1(AppColor.blackColor,height*.26),
              onItemSelected: (value) {
                print('Fruit selected: $value');
              },
            ),



            SizedBox(height:  height*.4),


            sectionTitle('Are you currently studying?',height),

            Column(

              children: [
                _buildRadio('Yes', 'Yes'),
                SizedBox(width: 20),
                _buildRadio('No', 'No'),
              ],
            ),




            SizedBox(height:  height*.4),





            sectionTitle('Are you planning for higher education in next 2-3 years',height),

            CustomDropdown(
              items: ['Full time employed', 'Part time employed', ''],
              hintText: 'Pick a fruit',
              dropdownHeight: 150,
              buttonDecoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
                //   border: Border.all(color: Colors.green, width: 1.5),

              ),
              dropdownDecoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.purple, width: 1.5),
              ),
              textStyle:


              AppTextStyles.normalopenSans1(AppColor.blackColor,height*.26),
              onItemSelected: (value) {
                print('Fruit selected: $value');
              },
            ),





            SizedBox(height:  height*.4),






          ],
        ),
      ),











    );





  }





  Widget _buildRadio(String value, String groupValue) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: currentStudy,
          onChanged: (val) => setState(() => currentStudy = val),
        ),
        Text(value),
      ],
    );
  }
  Widget tabItem(String label,  bool isActive) {
    return Text(
      label,
      style: TextStyle(
        color: isActive ? Colors.pink : Colors.white,
        fontSize: 14,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget sectionTitle(String title,double height)  {
    return Text(
      title,

      style:

      AppTextStyles.normalopenSans1(AppColor.blackColor,height*.3),

    );
  }



  // Widget customTextField(String label, String hintText, String value) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
  //     child: TextFormField(
  //
  //       initialValue: value,
  //       style: TextStyle(color: Colors.white),
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.only(left: 20),
  //
  //         hintText: hintText,
  //        // labelText: label,
  //
  //
  //
  //         // focusedBorder: OutlineInputBorder(
  //         //   borderSide: BorderSide(color: Colors.green, width: 2.0), // Border color when focused
  //         //   borderRadius: BorderRadius.circular(10.0),
  //         // ),
  //         errorBorder: OutlineInputBorder(
  //           borderSide: BorderSide(color: Colors.red), // Border color when error
  //           borderRadius: BorderRadius.circular(10.0),
  //         ),
  //   // Background color
  //
  //
  //         hintStyle:
  //
  //         TextStyle(color: Colors.white54),
  //         filled: true,
  //         fillColor: Colors.black26,
  //         border: OutlineInputBorder(
  //
  //           borderRadius: BorderRadius.circular(5),
  //           borderSide: BorderSide( color: AppColor.purple,
  //
  //
  //               width: 4.0),
  //
  //
  //
  //
  //
  //         ),
  //
  //
  //
  //       ),
  //     ),
  //   );
  // }


  Widget customDropDown({
    required String label,
    required String hintText,
    required String value,
    required DropListModel dropListModel,
    required Function(OptionItem) onOptionSelected,
    required OptionItem selectedItem,
    bool showIcon = true,
    bool showArrowIcon = true,
    bool showBorder = true,

    Icon? leadingIcon,
    double paddingTop = 20.0,
    Color borderColor = AppColor.purple,
    // double borderWidth = 1.0,
    // double borderRadius = 8.0,
  }) {
    return SelectDropList(

      itemSelected: selectedItem,
      dropListModel: dropListModel,
      showIcon: showIcon, // Show icon in dropdown title
      showArrowIcon: showArrowIcon, // Show arrow icon in dropdown
      showBorder: true,


      paddingTop: 0,
      icon: leadingIcon ?? const Icon(Icons.person, color: Colors.black),
      onOptionSelected: onOptionSelected,
      borderColor: AppColor.purple,

      dropboxborderColor: AppColor.purple,
      //   dropboxColor: AppColor.purple,












      //  borderColor: Colors.blue, // Set border color
      //   borderWidth: 2.0,         // Set border width
      //   borderRadius: 12.0,       // Set border radius for rounded corners
      //   backgroundColor: Colors.lightBlue[50],


      // borderWidth: borderWidth,
      // borderRadius: borderRadius,
    );
  }






  Widget _buildTextField({

    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    required double height,


  })
  {


    return


      Container(
        // padding: EdgeInsets.only(left: 10),

        //padding: const EdgeInsets.symmetric(horizontal: 10.0),



        child: TextField(
          controller: controller,

          obscureText: isPassword,




          style:       AppTextStyles.normalopenSans1(AppColor.blackColor,height*.3),

          // decoration: InputDecoration(
          //   contentPadding: EdgeInsets.only(left: 20),
          //
          //   hintText: hintText,
          //  // labelText: label,
          //
          //
          //
          //   // focusedBorder: OutlineInputBorder(
          //   //   borderSide: BorderSide(color: Colors.green, width: 2.0), // Border color when focused
          //   //   borderRadius: BorderRadius.circular(10.0),
          //   // ),
          //   errorBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.red), // Border color when error
          //     borderRadius: BorderRadius.circular(10.0),
          //   ),

          decoration: InputDecoration(

            contentPadding: EdgeInsets.only(left: height*.7 ,top: height*.3 ,bottom:height*.3 )


            ,





            //       style: TextStyle(color: Colors.white),
            //       decoration: InputDecoration(
            //         contentPadding: EdgeInsets.only(left: 20),
            //
            //         hintText: hintText,
            //        // labelText: label,
            //
            //
            //
            //         // focusedBorder: OutlineInputBorder(
            //         //   borderSide: BorderSide(color: Colors.green, width: 2.0), // Border color when focused
            //         //   borderRadius: BorderRadius.circular(10.0),
            //         // ),
            //         errorBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.red), // Border color when error
            //           borderRadius: BorderRadius.circular(10.0),
            //         ),

            hintText: hintText,
            filled: true,

            hintStyle:  AppTextStyles.normalopenSans1(Colors.grey,height*.3),

            fillColor: Colors.grey[300],
            ///  suffixIcon: Icon(icon),



            // suffixIcon: Padding(
            //   padding:  EdgeInsets.only(right:height*.6 ),
            //   // Padding around the suffix icon
            //   child: Icon(icon)
            //
            //   ,
            // ),







            // You can also adjust the constraints of the suffix icon
            suffixIconConstraints: BoxConstraints(
              minWidth: 24, // Minimum width for the icon
              minHeight: 24, // Minimum height for the icon
            ),



            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none,





            ),
          ),
        ),
      );
  }





}


