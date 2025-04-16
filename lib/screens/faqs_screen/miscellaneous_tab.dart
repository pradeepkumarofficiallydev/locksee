import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/utils/AppColors.dart';

import '../../utils/app_text_styles.dart';

class MiscellaneousTab extends StatefulWidget {
  @override
  _PrivacyPolicyScreenState createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<MiscellaneousTab> {
  Map<String, bool> _expandedSections = {};
  late var querstion_answer_list = [];

  @override
  void initState() {
    querstion_answer_list = [
      {
        "title": 'faqMiscellaneousQuestionOne'.tr,
        "des": 'faqMiscellaneousQuestionOneAnswer'.tr,
      },
    ];

    //  }

    super.initState();
  }

  void _toggleSection(String title) {
    setState(() {
      _expandedSections[title] = !(_expandedSections[title] ?? false);
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return Scaffold(
      backgroundColor: AppColor.whitecolor,
      body: Padding(
        padding: EdgeInsets.all(height * .6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                "Question",
                style:
                    AppTextStyles.normalopenSans1(Colors.black, height * .52),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * .3, bottom: height * .1),
              alignment: Alignment.centerLeft,
              child: Text(
                "Frequently asked",
                style:
                    AppTextStyles.normalopenSans1(Colors.black26, height * .4),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: querstion_answer_list?.length ?? 0,
                itemBuilder: (context, index) {
                  var items = querstion_answer_list[index];

                  return buildPrivacySection(
                      items["title"], items["des"], height);
                },
              ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.1, end: 0.0),
            ),
            GestureDetector(
              onTap: () {
                //  Get.to(DeepLink());
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: height * .2),
                margin: EdgeInsets.symmetric(
                    vertical: height * .6, horizontal: height * .9),
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(width: 2, color: AppColor.purple),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  "Still need help",
                  style: AppTextStyles.normaNoSpacingboldlopenSans(
                      AppColor.whiteColor, height * .4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPrivacySection(String? title, String? content, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Theme(
          data:
              Theme.of(Get.context!).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            tilePadding: EdgeInsets.zero,
            title: Text(
              title!,
              style: AppTextStyles.normalopenSans1(
                  AppColor.blackColor, height * .42),
            ),
            children: [
              Text(
                content!,
                style:
                    AppTextStyles.normalopenSans1(Colors.black38, height * .39),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.grey[500],
          thickness: 1,
          height: 0,
        ),
      ],
    );
  }
}
