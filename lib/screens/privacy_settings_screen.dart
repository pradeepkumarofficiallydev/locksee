import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/controller/privacy_setting_controller.dart';
import 'package:locksee/screens/polls/latest_polls_screen.dart';
import 'package:locksee/utils/AppColors.dart';

import '../utils/app_text_styles.dart';
import 'home_screen.dart';

class PrivacySettingsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PrivacySettingsScreen(),
    );
  }
}


class PrivacySettingsScreen extends StatefulWidget {
  @override
  _PrivacySettingsScreenState createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
        backgroundColor: AppColor.whitecolor,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(
              left: height * .5,
            ),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                  size: height * .5,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),

          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.pinkAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          title: Text(
            "Privacy & Settings",
            style: AppTextStyles.normalopenSans1(Colors.black, height * .47),
          ),
          backgroundColor: Colors.white,
          elevation: 1,

          // leading: IconButton(

          //   icon: Icon(Icons.menu, color: Colors.black),
          //   onPressed: () {},
          // ),   // leading: IconButton(
          //   icon: Icon(Icons.menu, color: Colors.black),
          //   onPressed: () {},
          // ),

          actions: [
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: GetBuilder<PrivacySettingController>(
          init: PrivacySettingController(),
          builder: (s) => Column(
            children: [
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    _buildSectionTitle("Privacy", Icons.lock),

                    s.isLoading.value

                        //  true
                        ? ShimmerEffect(
                            width: double.infinity, height: height * 6.4)
                        : _buildPrivacyCard(s, height),

                    _buildSectionTitle("Settings", Icons.settings),

                    Divider(
                      height: 1,
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //
                    // _buildSurveyPreferences(),

                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: s.surveyPreferencesQuestionResponse.value?.data
                              ?.questions?.length ??
                          0,
                      itemBuilder: (context, index) {
                        var question = s.surveyPreferencesQuestionResponse.value
                            ?.data?.questions![index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                //   question["question"],
                                question?.question ?? "",


                            style: AppTextStyles
                                .normaNoSpacingboldlopenSans(
                                AppColor.blackColor,
                                height * .41)

                              ),
                              //...question["items"].

                              ...question!.items!.map<Widget>((item) {
                                return
                                    //
                                    // Obx(() =>
                                    //
                                    //
                                    RadioListTile<int>(
                                  title: Text(

                                      //  item["answer"]

                                      item.answer ?? ""),

                                  //
                                  //    value: item!.questionAnswerId!,
                                  //    // item["question_answer_id"]
                                  //    groupValue:
                                  //    // controller.selectedAnswers[question["question_id"]]
                                  //    s. selectedAnswers[question.questionId], // Set default value

                                  // //   selectedAnswers[question?.questionId],
                                  //         onChanged: (value) {
                                  //     selectAnswer(question!.questionId!, value!);
                                  //
                                  //     },
                                  //

                                  /////  this is my change



                                  value: item.questionAnswerId!,
                                  groupValue:
                                      s.selectedAnswers[question.questionId],
                                  // Set current selected value
                                  onChanged: (value) {
                                    if (value != null) {
                                      s.selectedAnswers[question.questionId!] =
                                          value;
                                      s.updateAnswer(
                                          question.questionId!, value);
                                    }
                                  },
                                );

                                // );
                              }).toList(),
                              Divider()
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          s.getSelectedAnswers();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.appColor,
                          minimumSize: Size(150, 48),
                        ),
                        child: Text(
                          'Submit',
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
                        child: Text(
                          'Reset',
                          style: AppTextStyles.normalopenSans1(
                              AppColor.blackColor, height * .45),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.pink),
          SizedBox(width: 8),
          Text(title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPrivacyCard(PrivacySettingController s, double height) {
    return Card(
      color: Colors.grey[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Password",


                  style: AppTextStyles
                      .normaNoSpacingboldlopenSans(
                      AppColor.blackColor,
                       height * .45),),

                Text("Edit",

                  style: AppTextStyles
                      .normaNoSpacingboldlopenSans(
                      Colors.blue,

                      height * .40) ,),


              ],
            ),
            SizedBox(height: 8),
            Text("**********",


              style: AppTextStyles
                  .normalopenSans1(
                  AppColor.blackColor,
                  height * .38),),




            SizedBox(height: height*.1),
            Text(
                "Privacy policy updated on ${s.formatDate(s.privacySettingAcceptedResponse.value.data?.data?.updatedOn ?? "")}\nAccepted on ${s.formatDate(s.privacySettingAcceptedResponse.value.data?.data?.acceptedOn ?? "") ?? ""}",


              style: AppTextStyles
                  .normalopenSans1(
                  AppColor.grayColor1,
                  height * .32),),




            SizedBox(height: height*.2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Account Status",
                  style: AppTextStyles
                      .boldOpenSans(
                      AppColor.blackColor,
                      height * .42),),





                SizedBox(height: height*.42) ,
                Text(((s.privacySettingAcceptedResponse.value.data?.data
                                    ?.adminApprovalStatus ??
                                "") ==
                            "A")
                        ? "Approved"
                        : "Pending",
                  style: AppTextStyles
                      .boldOpenSans(
                      AppColor.blackColor,
                      height * .42),),
              ],
            ),



            SizedBox(height: height*.2),

            Row(


              crossAxisAlignment: CrossAxisAlignment.start,


              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Container(
                  height: height*.5,width: height*.5,


                  alignment: Alignment.center,



                 // /   color: Colors.red,

                  child: Checkbox(


                    visualDensity: VisualDensity.compact, // Removes extra padding

                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    // Removes extra tap padding

                    value: s.isChecked.value,
                    onChanged: (value) {
                      setState(() {
                        s.isChecked.value = value!;
                      });
                    },
                  ),
                ),

                SizedBox(width: height*.23) ,

                sectionTitle(
                    "Don't share PII information with third party", height),
              ],
            ),
            SizedBox(height: height*.23) ,


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: ()

                  {



                  },
                  child: Text("Unsubscribe",


                    style: AppTextStyles.normalopenSans1(Colors.blue, height * .34),


                  ),
                ),
                InkWell(
                  onTap: ()
                  {



                  },
                  child: Text("Privacy Policy",


                    style: AppTextStyles.normalopenSans1(Colors.blue, height * .34),




                  ),
                ),
                InkWell(

                   onTap:  ()
                  {



                  },
                  child: Text("Terms & conditions",
                    style: AppTextStyles.normalopenSans1(Colors.blue, height * .34),

                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title, double height) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        title,
        style: AppTextStyles.normalopenSans1(Colors.blue, height * .34),

       ),
    );
  }
}
