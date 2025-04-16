import 'package:flutter/material.dart';

class DateOfBirthSelectionScreen extends StatefulWidget {
  @override
  _DateOfBirthSelectionScreenState createState() =>
      _DateOfBirthSelectionScreenState();
}

class _DateOfBirthSelectionScreenState
    extends State<DateOfBirthSelectionScreen> {
  String selectedMonth = 'Jun';
  String selectedDay = '17';
  String selectedYear = '1952';

  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final List<String> years = List.generate(50, (index) => (1950 + index).toString());

  // Days for each month
  final Map<String, int> daysInMonth = {
    'Jan': 31, 'Feb': 28, 'Mar': 31, 'Apr': 30, 'May': 31, 'Jun': 30,
    'Jul': 31, 'Aug': 31, 'Sep': 30, 'Oct': 31, 'Nov': 30, 'Dec': 31,
  };

  // Controllers for each wheel
  final FixedExtentScrollController _monthController =
  FixedExtentScrollController(initialItem: 5); // Default to 'Jun'
  final FixedExtentScrollController _dayController =
  FixedExtentScrollController(initialItem: 16); // Default to '17'
  final FixedExtentScrollController _yearController =
  FixedExtentScrollController(initialItem: 2); // Default to '1982'

  @override
  void initState() {
    super.initState();
    // Ensure that the days list is updated based on the selected month
    _updateDays();
  }

  void _updateDays() {
    // Check if the selected month is February and if it's a leap year
    if (selectedMonth == 'Feb' && _isLeapYear(int.parse(selectedYear))) {
      setState(() {
        daysInMonth['Feb'] = 29;
      });
    } else if (selectedMonth == 'Feb') {
      setState(() {
        daysInMonth['Feb'] = 28;
      });
    }
    // Ensure that the selected day is valid for the updated month
    if (int.parse(selectedDay) > daysInMonth[selectedMonth]!) {
      setState(() {
        selectedDay = daysInMonth[selectedMonth]!.toString();
      });
    }
  }

  bool _isLeapYear(int year) {
    return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Date of Birth")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "What's your date of birth?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildWheelSelector(months, selectedMonth, (value) {
                  setState(() {
                    selectedMonth = value;
                    _updateDays();
                  });
                }, _monthController),
                _buildWheelSelector(List.generate(daysInMonth[selectedMonth]!, (index) => (index + 1).toString()), selectedDay, (value) {
                  setState(() {
                    selectedDay = value;
                  });
                }, _dayController),
                _buildWheelSelector(years, selectedYear, (value) {
                  setState(() {
                    selectedYear = value;
                    _updateDays();
                  });
                }, _yearController),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text("Date of Birth"),
                    content: Text(
                        "Month: $selectedMonth\nDay: $selectedDay\nYear: $selectedYear"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWheelSelector(List<String> items, String selectedItem, ValueChanged<String> onItemSelected, FixedExtentScrollController controller) {
    return Container(
      width: 80,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5, offset: Offset(0, 5)),
        ],
      ),
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 50,
        onSelectedItemChanged: (index) {
          onItemSelected(items[index]);
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return Center(
              child: Text(
                items[index],
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: items[index] == selectedItem ? Colors.white : Colors.black,
                  backgroundColor: items[index] == selectedItem ? Colors.purple : Colors.transparent,
                ),
              ),
            );
          },
          childCount: items.length,
        ),
      ),
    );
  }
}
