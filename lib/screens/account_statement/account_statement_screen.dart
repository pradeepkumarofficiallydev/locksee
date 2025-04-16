import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:locksee/screens/account_statement/points_tab.dart';
import 'package:locksee/screens/account_statement/rewards_tab.dart';
import 'package:locksee/screens/account_statement/survey_history_tab.dart';
import 'package:locksee/utils/AppColors.dart';
import '../../utils/app_text_styles.dart';

class AccountStatementScreen extends StatefulWidget {
  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<AccountStatementScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }



  @override
  void dispose() {
    _tabController.dispose(); // Dispose TabController when done
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.24; // Responsive width
    double height = width * 0.4; // Maintain aspect ratio

    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(




          leading: Padding(
            padding:  EdgeInsets.only(left:  height*.5, top: height*.2),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconButton(
                icon:  Icon(Icons.arrow_back, color: Colors.black,size:  height*.5,),
                onPressed: () {


                  Get.back();




                },
              ),
            ),
          ),

          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text(
            'Account Statement',

            style:
            AppTextStyles.normalopenSans1(AppColor.whiteColor, height * .5),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            // Adjust the preferred size
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.zero,
              // Remove default padding (left and right)
              child: TabBar(
                controller: _tabController,
                // Assign the controller here
                indicatorColor: Colors.pink,
                indicatorWeight: 3.0,
                labelColor: Colors.pink,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                tabAlignment: TabAlignment.center,
                // add this line

                indicatorSize: TabBarIndicatorSize.label,

                padding: EdgeInsets.zero,

                // indicatorPadding: EdgeInsets.zero,
                //  labelPadding: EdgeInsets.zero,

                // Allow scrolling if tabs overflow
                labelStyle: AppTextStyles.normalopenSans1(
                    AppColor.whiteColor, height * .34),

                unselectedLabelStyle: AppTextStyles.normalopenSans1(
                    AppColor.whiteColor, height * .3),

                tabs: [
                  Tab(text: "Rewards",
                  ),
                   Tab(text: "Point"),
                  // //
                   Tab(text: "Survey History"),
                  //
                  // Tab(text: "Redemption"),
                  //



                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [



            RewardsTab(),

            PointsTab(),
            SurveyHistoryTab(),
            //
            // HouseHoldTab(),





          ],
        ),
      ),
    );
  }
}

// Household Tab
class HouseholdTab extends StatefulWidget {
  @override
  _HouseholdTabState createState() => _HouseholdTabState();
}

class _HouseholdTabState extends State<HouseholdTab> {
  String _apiData = "Loading Household Data...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchApiData();
  }

  // Simulate API call
  Future<void> _fetchApiData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    setState(() {
      _isLoading = false;
      _apiData = "Household Content Loaded";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator() // Show loading spinner while fetching data
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _apiData, // Show the fetched API data
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text('Household Content'),
        ],
      ),
    );
  }
}

// Finance Tab
class FinanceTab extends StatefulWidget {
  @override
  _FinanceTabState createState() => _FinanceTabState();
}

class _FinanceTabState extends State<FinanceTab> {
  String _apiData = "Loading Finance Data...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchApiData();
  }

  // Simulate API call
  Future<void> _fetchApiData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    setState(() {
      _isLoading = false;
      _apiData = "Finance Content Loaded";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator() // Show loading spinner while fetching data
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _apiData, // Show the fetched API data
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text('Finance Content'),
        ],
      ),
    );
  }
}

// Automotive Tab
class AutomotiveTab extends StatefulWidget {
  @override
  _AutomotiveTabState createState() => _AutomotiveTabState();
}

class _AutomotiveTabState extends State<AutomotiveTab> {
  String _apiData = "Loading Automotive Data...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchApiData();
  }

  // Simulate API call
  Future<void> _fetchApiData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    setState(() {
      _isLoading = false;
      _apiData = "Automotive Content Loaded";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator() // Show loading spinner while fetching data
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _apiData, // Show the fetched API data
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text('Automotive Content'),
        ],
      ),
    );
  }
}






// Shopping Tab
class ShoppingTab extends StatefulWidget {
  @override
  _ShoppingTabState createState() => _ShoppingTabState();
}

class _ShoppingTabState extends State<ShoppingTab> {
  String _apiData = "Loading Shopping Data...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
   // _fetchApiData();
  }

  // Simulate API call
  Future<void> _fetchApiData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    setState(() {
      _isLoading = false;
      _apiData = "Shopping Content Loaded";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator() // Show loading spinner while fetching data
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _apiData, // Show the fetched API data
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text('Shopping Content'),
        ],
      ),
    );
  }
}

// Food Tab
class FoodTab extends StatefulWidget {
  @override
  _FoodTabState createState() => _FoodTabState();
}

class _FoodTabState extends State<FoodTab> {
  String _apiData = "Loading Food Data...";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchApiData();
  }

  // Simulate API call
  Future<void> _fetchApiData() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    setState(() {
      _isLoading = false;
      _apiData = "Food Content Loaded";
    });
  }



  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? CircularProgressIndicator() // Show loading spinner while fetching data
          : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            _apiData, // Show the fetched API data
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          Text('Food Content'),
        ],
      ),
    );
  }
}
