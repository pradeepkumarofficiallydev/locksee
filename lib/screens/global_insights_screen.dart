import 'package:flutter/material.dart';
import 'package:locksee/utils/AppColors.dart';

import '../utils/app_text_styles.dart';


class global_insights_creen extends StatelessWidget {
  const global_insights_creen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    final List<String> questions = [
      "Which of the following do you think is the best Ed-tech company relevant...",
      "Which of the following things have you purchased in the past 12 months?",
      "If Activewear/sportswear, then which brands did you purchase?",
      "Do you feel you are financially better or worse off now than you were a ...",
      "Would you consider having more than one full-time job?",
      "What's on top of your career resolution list this year?",
      "How often do you order food online?",
      "What is the longest you've ever stayed in one job?",
      "Do you recycle waste at your house?",
      "Should Elon Musk resign from Twitter?"
    ];


    final List<String> images = [
      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths


      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

      'assets/images/240_F_265112153_8lGXScm1j6UA4SfHtV6oSVVwJnpnvBEu.jpg', // Example: Replace with real image paths

    ];

    return Scaffold(

      appBar: AppBar(

        title: Text(

          'Global Insights',
          style: TextStyle(color: AppColor.whiteColor),

        ),
        titleTextStyle:

        AppTextStyles.normaNoSpacingboldlopenSans(AppColor.grayColor1,height*.45),



        leading: IconButton(
          icon: Icon(
            size: 30,

            Icons.arrow_back_ios_rounded, // You can replace this with any icon you want
            color: AppColor.whiteColor,

            // Custom color for the back button
          ),
          onPressed: () {
            // You can define any action here, like navigating back
            Navigator.pop(context); // This will pop the current screen off the stack
          },
        ),



        backgroundColor: Colors.pinkAccent
        ,






        centerTitle: true,
        elevation: 0,
      ),




      backgroundColor: AppColor.whiteColor,

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.9,
          ),
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle onTap if needed
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      questions[index],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
