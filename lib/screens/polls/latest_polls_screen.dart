import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locksee/controller/polls_controller.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/AppColors.dart';
import '../../utils/app_text_styles.dart';
import '../../utils/custom_widgets.dart';
import '../home_screen.dart';

class PollScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24;
    double height = width * 0.4;

    return Scaffold(


      backgroundColor: AppColor.whitecolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor:
        AppColor.whiteColor,
        elevation: 0,
        toolbarHeight: 70,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: height * .7,
          ),
        ),
        title: Text(
          "Latest Polls & Trends",
          style: AppTextStyles.normaNoSpacingboldlopenSans(
              AppColor.blackColor, height * .55),
        ),
      ),
      body: GetBuilder<PollsController>(
        init: PollsController(),
        builder: (s) =>



        // s.isLoading.value
        //     ? Center(
        //   child: CustomWidgets.showCircularIndicator1(
        //       context, height * 1, AppColor.appColor),
        // ):



        s.isLoading.value
            ? ShimmerEffect(width: double.infinity, height:  height):


        (s.getPollQuestionAnswerResponse.value.data?.totalCount??0)>0?



         ListView.builder(


          shrinkWrap: true,
          itemCount: s.getPollQuestionAnswerResponse.value.data?.data?.length ?? 0,
          itemBuilder: (context, index) {
            final pollItem =
            s.getPollQuestionAnswerResponse.value.data?.data?[index];

            return GestureDetector(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [



                    Image.network(
                      pollItem?.imageName ?? "",
                      width: double.infinity,
                      height: height * 5.6,
                      fit: BoxFit.cover,
                    ),



                    Padding(
                      padding: EdgeInsets.all(height * .4),
                      child: Text(
                        pollItem?.questionInLocal ?? "",
                        style: AppTextStyles.normalopenSans1(
                            AppColor.blackColor, height * .5),
                      ),
                    ),






                    Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: pollItem?.options?.length ?? 0,
                          itemBuilder: (context, optionIndex) {
                            final option = pollItem?.options?[optionIndex];
                            bool isSelected = s.selectedOptions.containsKey(pollItem?.pollId) &&
                                s.selectedOptions[pollItem?.pollId]?["poll_answer_id"] == option?.pollAnswerId;

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: height * .4, vertical: height * .13),
                              child: GestureDetector(
                                onTap: () {
                                  s.selectOption(
                                    pollItem?.pollId ?? 0,
                                    pollItem?.pollQuestionId ?? 0,
                                    option?.pollAnswerId ?? 0,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.pink.shade100
                                        : Colors.white,
                                    border: Border.all(
                                        color: isSelected
                                            ? Colors.pink
                                            : Colors.grey.shade400),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ListTile(
                                    title:


                                    Text(
                                      option?.pollOptionInLocalLanguage ?? "",
                                      style: AppTextStyles.normalopenSans(
                                          Colors.grey.shade800, height * .4),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * .5, horizontal: height * .9),
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.pink,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(height * .9)),
                                padding: EdgeInsets.symmetric(
                                    horizontal: height * 2, vertical: height * .2),
                              ),
                              onPressed: () {
                                s.submitVote(pollItem?.pollId ?? 0);
                              },
                              child: Text(
                                'Vote',
                                style: AppTextStyles.normalopenSans1(
                                    Colors.white, height * .5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),






                  ],
                ),
              ),
            );
          },
        )

              :


        Center(
          child: Text(
            "No record found", style: AppTextStyles.normaNoSpacingboldlopenSans(
                AppColor.grayColor1, height * .6),
          ),
        ),



      ),
    );
  }
}


class ShimmerEffect extends StatelessWidget {
  final double width;
  final double height;

  const ShimmerEffect({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return


      Column(
        children: [
          Shimmer.fromColors(
          baseColor: Colors.grey[350]!,
          highlightColor: Colors.grey[100]!,

          child: Container(
            width: width,
            height: height*6,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
              ),

          SizedBox(height: height*1,),



          Shimmer.fromColors(
            baseColor: Colors.grey[350]!,
            highlightColor: Colors.grey[100]!,

            child: Container(
              width: width,
              height: height*1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: height*.6,),


          Shimmer.fromColors(
            baseColor: Colors.grey[350]!,
            highlightColor: Colors.grey[100]!,

            child: Container(
              width: width,
              height: height*7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),

          SizedBox(height: height*.5,),




        ],
      );
  }
}
