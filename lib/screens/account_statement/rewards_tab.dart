import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_model_list/drop_down/select_drop_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:locksee/controller/accounts_statement_controller.dart';
import 'package:locksee/utils/AppColors.dart';
import '../../models/RewardsTagsResponse.dart';
import '../../utils/app_text_styles.dart';

class RewardsTab extends StatefulWidget {
  @override
  _BasicProfileTab createState() => _BasicProfileTab();
}

class _BasicProfileTab extends State<RewardsTab>
    with SingleTickerProviderStateMixin {
  String _apiData = "Loading Household Data...";

  bool _isLoading = true;

  String? currentStudy = 'Yes';

  int? _selectedListingCultureId = 0;

  TextEditingController emailController = TextEditingController();

  List<String> selectedValues =
      List.filled(1, ""); // Adjust based on dropdown count

  // Callback to update selected value at a specific index
  void onDropdownItemSelected(int index, String value) {
    setState(() {
      selectedValues[index] = value;
    });
  }

  final controller = Get.put(AccountsStatementController());

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

  String? selectedTag;
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(2000);

    // DateTime lastDate = DateTime(2100);

    DateTime lastDate = DateTime(
        initialDate.year, initialDate.month, initialDate.day, 23, 59, 59);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked != null) {
      setState(() {
        if (isStartDate) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }

    controller.rewardsAllListDataFun(
        _selectedListingCultureId!,
        0,
        '${startDate?.day}-${startDate?.month}-${startDate?.year}',
        '${endDate?.day}-${endDate?.month}-${endDate?.year}');
    print('${startDate?.day}-${startDate?.month}-${startDate?.year}');
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
  bool isDropdownOpen = false;

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

    return GetBuilder<AccountsStatementController>(
      init: AccountsStatementController(),
      builder: (s) => Center(
        child: _isLoading
            ? CircularProgressIndicator() // Show loading spinner while fetching data
            : Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                  vertical: height * .5,
                  horizontal: height * .3,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: AppColor.whitecolor,
                                // Set the background color of the dropdown

                                isExpanded: true,
                                // Ensures dropdown expands properly

                                hint: Text(
                                  "Tags",
                                  style: AppTextStyles.normalopenSans1(
                                      AppColor.grayColor1, height * .26),
                                ),

                                value: selectedTag,
                                icon: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.arrow_drop_down),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedTag = newValue;

                                    print("category ${selectedTag}");

                                    try {
                                      _selectedListingCultureId = s
                                              .rewardsTagsResponse
                                              .value
                                              .data
                                              ?.data
                                              ?.firstWhere(
                                                (survey) =>
                                                    survey.options == newValue,
                                                orElse: () => CultureData(
                                                    listingCultureId:
                                                        0), // Return null if not found
                                              )
                                              ?.listingCultureId ??
                                          0; // Default to 0 if null

                                      print(
                                          "category1 $_selectedListingCultureId");
                                    } catch (e) {
                                      print("Error: $e");
                                    }

                                    print(
                                        "categ1 ${_selectedListingCultureId}");

                                    s.rewardsAllListDataFun(
                                        _selectedListingCultureId!, 0, "", "");
                                  });
                                },







                                items:

                                    // ["Tag 1", "Tag 2", "Tag 3"].
                                    s.reward_tags_list.map((String tag) {
                                  return DropdownMenuItem<String>(
                                    value: tag,
                                    child: Container(
                                        child: Text(tag,
                                            style:
                                                AppTextStyles.normalopenSans1(
                                                    AppColor.blackColor,
                                                    height * .26))),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: height * .8),
                        Expanded(
                            child: _buildDatePicker(
                                context, startDate, true, "Form", height)),
                        SizedBox(width: height * .2),
                        Expanded(
                            child: _buildDatePicker(
                                context, endDate, false, "To", height)),
                      ],
                    ),
                    SizedBox(height: height * .5),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey[200]),
                        child: Column(
                          children: [
                            (s.rewardsAllListDataResponse.value.data
                                            ?.totalCount !=
                                        null) &&
                                    s.rewardsAllListDataResponse.value.data
                                            ?.totalCount >
                                        0
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Description',
                                        style: AppTextStyles.normalopenSans1(
                                            AppColor.grayColor1, height * .23),
                                      ),
                                      Text(
                                        'Earned',
                                        style: AppTextStyles.normalopenSans1(
                                            AppColor.grayColor1, height * .23),
                                      ),
                                      Text(
                                        'Redeemed',
                                        style: AppTextStyles.normalopenSans1(
                                            AppColor.grayColor1, height * .23),
                                      ),
                                      Text(
                                        'Remaining Balance',
                                        style: AppTextStyles.normalopenSans1(
                                            AppColor.grayColor1, height * .23),
                                      ),
                                      Text(
                                        'Date',
                                        style: AppTextStyles.normalopenSans1(
                                            AppColor.grayColor1, height * .23),
                                      ),
                                    ],
                                  )
                                : SizedBox(),
                            s.isLoading.value
                                ? Center(child: CircularProgressIndicator())
                                : Container(
                                    child: Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,

                                        // physics: NeverScrollableScrollPhysics(), // Disables scrolling

                                        // padding: EdgeInsets.all(16),
                                        itemCount: s.rewardsAllListDataResponse
                                                .value.data?.data?.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          final rewardsInstance = s
                                              .rewardsAllListDataResponse
                                              .value
                                              .data
                                              ?.data![index];

                                          return GestureDetector(
                                            onTap: () {
                                              //     Get.to(Agendasingledatascreen(data: task,));
                                            },
                                            child: Container(
                                              //height: 200,
                                              //
                                              //
                                              // padding: const EdgeInsets.all(15),
                                              //
                                              // margin: const EdgeInsets.all(5),
                                              //
                                              //

                                              width: double.infinity,

                                              // decoration: BoxDecoration(
                                              //
                                              //     borderRadius: BorderRadius.circular(20),
                                              //
                                              //     color:Colors.grey[300]
                                              //
                                              //
                                              //
                                              //   // gradient: LinearGradient(
                                              //   //   colors: [Colors.pink, Colors.purple],
                                              //   //   begin: Alignment.topLeft,
                                              //   //   end: Alignment.bottomRight,
                                              //   //
                                              //   //
                                              //   // ),
                                              //
                                              //   // borderRadius: BorderRadius.vertical(
                                              //   //   bottom: Radius.circular(30),
                                              //   // ),
                                              // ),

                                              child: Column(
                                                children: [
                                                  // Row(
                                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  //   children: [
                                                  //     Text(
                                                  //       'Description',
                                                  //
                                                  //       style: AppTextStyles.normalopenSans1(AppColor.grayColor1,height*.23),
                                                  //
                                                  //
                                                  //
                                                  //      ),
                                                  //     Text(
                                                  //       'Earned',
                                                  //       style: AppTextStyles.normalopenSans1(AppColor.grayColor1,height*.23),
                                                  //     ),
                                                  //     Text(
                                                  //       'Redeemed',
                                                  //       style: AppTextStyles.normalopenSans1(AppColor.grayColor1,height*.23),
                                                  //     ),
                                                  //     Text(
                                                  //       'Remaining Balance',
                                                  //       style: AppTextStyles.normalopenSans1(AppColor.grayColor1,height*.23),
                                                  //     ),
                                                  //     Text(
                                                  //       'Date',
                                                  //       style: AppTextStyles.normalopenSans1(AppColor.grayColor1,height*.23),
                                                  //     ),
                                                  //   ],
                                                  // ),

                                                  SizedBox(height: 16),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        rewardsInstance
                                                                ?.bonusType ??
                                                            "",

                                                        //'Joining Bonus',
                                                        style: AppTextStyles
                                                            .normalopenSans1(
                                                                AppColor
                                                                    .blackColor,
                                                                height * .30),
                                                      ),
                                                      Text(
                                                        '₹${rewardsInstance?.earn.toString() ?? ""}',

                                                        // '₹1.0k',
                                                        style: AppTextStyles
                                                            .normalopenSans1(
                                                                AppColor
                                                                    .blackColor,
                                                                height * .30),
                                                      ),
                                                      Text(
                                                        '₹${rewardsInstance?.redemed.toString() ?? ""}',

                                                        //  '₹0',
                                                        style: AppTextStyles
                                                            .normalopenSans1(
                                                                AppColor
                                                                    .blackColor,
                                                                height * .30),
                                                      ),
                                                      Text(
                                                        '₹${rewardsInstance?.remainingBalance.toString() ?? ""}',

                                                        //  '₹1.0k',
                                                        style: AppTextStyles
                                                            .normalopenSans1(
                                                                AppColor
                                                                    .blackColor,
                                                                height * .30),
                                                      ),
                                                      Text(
                                                        '${rewardsInstance?.createdOnn.toString() ?? ""}',

                                                        //'08-01-2025',
                                                        style: AppTextStyles
                                                            .normalopenSans1(
                                                                AppColor
                                                                    .blackColor,
                                                                height * .30),
                                                      ),
                                                    ],
                                                  ),

                                                  Divider(
                                                    color: AppColor.blackColor,
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildDatePicker(BuildContext context, DateTime? date,
      bool isStartDate, String hintText, double height) {
    return GestureDetector(
      onTap: () => _selectDate(context, isStartDate),
      child: Container(
        width: 120,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                  textAlign: TextAlign.start,
                  date != null
                      ? "${date.day}-${date.month}-${date.year}"
                      : hintText,
                  style: date != null
                      ? AppTextStyles.normalopenSans1(
                          AppColor.blackColor, height * .26)
                      : AppTextStyles.normalopenSans1(
                          AppColor.grayColor1, height * .26)),
            ),
            Icon(Icons.calendar_today, size: 18, color: Colors.grey),
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

  Widget tabItem(String label, bool isActive) {
    return Text(
      label,
      style: TextStyle(
        color: isActive ? Colors.pink : Colors.white,
        fontSize: 14,
        fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }

  Widget sectionTitle(String title, double height) {
    return Text(
      title,
      style: AppTextStyles.normalopenSans1(AppColor.blackColor, height * .3),
    );
  }

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
      showIcon: showIcon,
      // Show icon in dropdown title
      showArrowIcon: showArrowIcon,
      // Show arrow icon in dropdown
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
}
