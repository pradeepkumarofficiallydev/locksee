// import 'package:flutter/material.dart';
//
// class Onboardingscreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.lock_outline, size: 80, color: Colors.black),
//               SizedBox(height: 10),
//               Text(
//                 'Welcome to LockSee',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Where Privacy Meets Communication',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 20),
//               Transform(
//                 alignment: Alignment.center,
//                 transform: Matrix4.rotationZ(-0.05),
//                 child: _chatCard(
//                   "Sophia Turner",
//                   "Hi William, is the sales report ready fo...",
//                   "12:12",
//                   "assets/sophia.jpg",
//                   true,
//                 ),
//               ),
//               Transform(
//                 alignment: Alignment.center,
//                 transform: Matrix4.rotationZ(0.03),
//                 child: _chatCard(
//                   "William Foster",
//                   "Yes, Sophia, I'll send it over shortly.",
//                   "12:13",
//                   "assets/william.jpg",
//                   false,
//                 ),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white,
//                   minimumSize: Size(double.infinity, 50),
//                 ),
//                 child: Text("Sign Up"),
//               ),
//               SizedBox(height: 10),
//               RichText(
//                 text: TextSpan(
//                   text: "Already have an account? ",
//                   style: TextStyle(color: Colors.black, fontSize: 16),
//                   children: [
//                     TextSpan(
//                       text: "Login",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _chatCard(
//       String name, String message, String time, String imagePath, bool rotated) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       elevation: 4,
//       child: ListTile(
//         leading: CircleAvatar(
//           backgroundImage: AssetImage(imagePath),
//         ),
//         title: Text(
//           name,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(time, style: TextStyle(fontSize: 12)),
//             Icon(Icons.circle, size: 10, color: Colors.orange),
//           ],
//         ),
//       ),
//     );
//   }
//
// }
//



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/screens/login_screen.dart';
import 'package:locksee/utils/AppColors.dart';

class Onboardingscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(



        child: Container(

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Welcome.png"),
               // Add your image path
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),









          child: Column(



            mainAxisAlignment: MainAxisAlignment.center,
            children: [



              Container(

                 child: Image.asset("assets/images/lock_image.png",height: 60,),
              ),



              SizedBox(height: 20),


              Text(
                'Welcome to LockSee',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              Text(
                'Where Privacy Meets \n Communication',
                textAlign: TextAlign.center,

                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),

                ),
              SizedBox(height: 90),




              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(0.02), // Increased tilt
                child: _chatCard(
                  "Sophia Turner",
                  "Hi William, is the sales report ready fo...",
                  "12:12 AM",
                  "assets/images/ellipse.png",
                  true,
                ),
              ),

              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(-0.03), // Adjusted tilt
                child: _chatCard(
                  "William Foster",
                  "Yes, Sophia, I'll send it over shortly.",
                  "12:13 AM",
                  "assets/images/Ellipse2.png",
                  false,
                ),
              ),
              SizedBox(height: 70),



              // Padding(
              //   padding: const EdgeInsets.all(13.0),
              //   child: ElevatedButton(
              //     onPressed: () {
              //
              //
              //       Get.to(LoginScreen());
              //
              //     },
              //
              //
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: AppColor.appColor,
              //       foregroundColor: Colors.white,
              //       minimumSize: Size(double.infinity, 50),
              //     ),
              //     child: Text("Sign Up"),
              //   ),
              // ),
              // SizedBox(height: 10),
              // RichText(
              //   text: TextSpan(
              //     text: "Already have an account? ",
              //     style: TextStyle(color: Colors.black, fontSize: 16),
              //     children: [
              //       TextSpan(
              //         text: "Login",
              //         style: TextStyle(fontWeight: FontWeight.bold),
              //       ),
              //     ],
              //   ),
              // ),
              //










        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Language Selector
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.language, color: Colors.orange),
                  SizedBox(width: 5),
                  Text(
                    "English",
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.orange),
                ],
              ),
              SizedBox(height: 20),

              // Agree and Continue Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  onPressed: () {


                    Get.to(LoginScreen());

                  },
                  child: Text(
                    "Agree and continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Privacy Policy and Terms of Service Text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  children: [
                    TextSpan(text: "Read our "),
                    TextSpan(
                      text: "Privacy Policy",
                      style: TextStyle(color: Colors.orange),
                    ),
                    TextSpan(text: ". Tap “Agree and continue” to accept the "),
                    TextSpan(
                      text: "Terms of Service",
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
















            ],
          ),
        ),
      ),
    );
  }

  Widget _chatCard(
      String name, String message, String time, String imagePath, bool rotated) {
    return Card(
      color: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 8),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2),
                  Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: AppColor.appColor,)),
                Icon(Icons.circle, size: 10, color: Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


