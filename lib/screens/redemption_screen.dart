import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:locksee/utils/AppColors.dart';

import '../controller/redemption_request_controller.dart';
import '../utils/app_text_styles.dart';


class RedemptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
      backgroundColor: AppColor.whiteColor,


      appBar: AppBar(

        title: Text(

          'Redemption Request',
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:



    GetBuilder<RedemptionRequestController>(
    init: RedemptionRequestController(),
      builder: (s) =>


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "You don't have enough balance for redemption.",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Remaining Balance",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
            '₹${s.getRewardsResponse.value.data?.data?.first?.remainingBalance.toString()??""}',
             // "₹100.00",
              style: TextStyle(color: Colors.pink, fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              "Redeemable amount",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              '₹${s.getRewardsResponse.value.data?.data?.first?.remainingBalance.toString()??""}',
              //"₹0.00",
              style: TextStyle(color: Colors.pink, fontSize: 18),
            ),
            SizedBox(height: 5),
            Text(
              "(Min. threshold limit ₹250.00)",
              style: TextStyle(color: Colors.green, fontSize: 14),
            ),
            SizedBox(height: 20),
            Text(
              "Option",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 10),
            DropdownContainer(),
            SizedBox(height: 20),
            Text(
              "Amount",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            SizedBox(height: 10),
            DropdownContainer(),
            Spacer(),
            Center(
              child:


              //
              // ElevatedButton(
              //   onPressed: null, // Disable button
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Colors.green,
              //     minimumSize: Size(double.infinity, 50),
              //     disabledBackgroundColor: Colors.green,
              //   ),
              //   child: Text(
              //     "Submit",
              //     style: TextStyle(color: Colors.white, fontSize: 16),
              //   ),
              // ),
              //
              //





              ElevatedButton(
                onPressed: () {


















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
                  'Submit',
                  style: TextStyle(fontSize: 18,color: AppColor.whiteColor),
                ),
              ),



            ),
          ],
        ),
      ),

      )
    );
  }
}

class DropdownContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.black,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          isExpanded: true,
          hint: Text(
            "Select an item",
            style: TextStyle(color: Colors.grey),
          ),
          items: [],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
