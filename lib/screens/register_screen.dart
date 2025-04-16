

////

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locksee/screens/user_details_screen.dart';
import 'package:locksee/utils/AppColors.dart';

import '../controller/user_details_controller.dart';
import '../utils/custom_widgets.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  bool isChecked = false;
  bool _obscureText = true; // Password visibility toggle

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


          Form(
          key: _formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        height: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.pink, Colors.purple],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 100,
                    child: Container(
                      margin: EdgeInsets.only(top: 19),
                      child: Image.asset('assets/images/logo.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    _buildTextField(
                      controller:s. firstNameController,
                      hintText: 'Enter your First name',
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'First name is required';
                        }
                        if (value.length < 2) {
                          return 'At least 2 characters required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller:s. lastNameController,
                      hintText: 'Enter your Last name',
                      icon: Icons.person,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Last name is required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller: s.emailIdController,
                      hintText: 'Enter your email id',
                      icon: Icons.email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    _buildTextField(
                      controller:s. mobileController,
                      hintText: 'Enter your mobile no.',
                      icon: Icons.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mobile number is required';
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Enter a valid 10-digit number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    // Password Field with Show/Hide Feature
                    _buildTextField(
                      controller: s.passwordController,
                      hintText: 'Enter your password',
                      icon: _obscureText ? Icons.visibility : Icons.visibility_off,
                      isPassword: true,
                      onIconTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).+$').hasMatch(value)) {
                          return 'Must include uppercase, lowercase & number';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            'I agree with terms conditions and privacy policy',
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'MontserratAlternates'
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),




                    s. isLoading1.value ?

                    CustomWidgets.showCircularIndicator1(context,height*.9,AppColor.appColor):


                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (!isChecked) {
                            Get.snackbar(

                              'Please accept terms & conditions',

                                '',
                                snackPosition: SnackPosition.BOTTOM,

                              colorText: AppColor.whitecolor,

                              backgroundColor: AppColor.appColor


                            );
                            return;
                          }

                          else
                            {


                              s.signUpEmailMobileVerificationFun();





                            }










                        }
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
                        'Sign Up',
                        style: TextStyle(fontSize: 18, color: AppColor.whiteColor),
                      ),
                    ),
                    SizedBox(height: 15),
                    // Row(
                    //
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //
                    //   children: [
                    //     Text('Already have an account? '),
                    //     GestureDetector(
                    //       onTap: () => Get.back(),
                    //       child: Text(
                    //         'Sign In',
                    //         style: TextStyle(
                    //           color: Colors.pink,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),


                  ],
                ),
              ),
            ],
          ),
        ),
        )
      ),
    );
  }



  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    required String? Function(String?)? validator,
    bool isPassword = false,
    VoidCallback? onIconTap,
  }) {
    return Container(
      child: TextFormField(
        controller: controller,
        obscureText: isPassword ? _obscureText : false, // Toggle obscureText
        validator: validator,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 30, top: 15, bottom: 15),
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey[200],
          suffixIcon: isPassword
              ? IconButton(
            icon: Icon(icon),
            onPressed: onIconTap,
          )
              : null, // Show/hide icon only for password fields
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double offset = 90.0;

    Path path = Path();
    path.lineTo(0, height - offset);
    path.quadraticBezierTo(
      1 * width / 4,
      height - (2 * offset),
      width,
      height - offset,
    );
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}












