




import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items; // List of items to display in the dropdown
  final String hintText; // Placeholder text
  final ValueChanged<String> onItemSelected; // Callback when an item is selected
  final double dropdownHeight; // Height of the dropdown menu
  final TextStyle? textStyle; // Text style for selected item
  final BoxDecoration? dropdownDecoration; // Decoration for dropdown menu
  final BoxDecoration? buttonDecoration; // Decoration for dropdown button

  const CustomDropdown({
    Key? key,
   required this.items,
    required this.hintText,
    required this.onItemSelected,
    this.dropdownHeight = 200,
    this.textStyle,
    this.dropdownDecoration,
    this.buttonDecoration,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown>
    with SingleTickerProviderStateMixin {
  String? selectedValue;
  bool isDropdownOpen = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );



    WidgetsBinding.instance.addPostFrameCallback((_) {

        if (widget.hintText.isNotEmpty) {

          widget.onItemSelected(widget.hintText!); // Notify parent about the default selection
        }


    });




  }

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


    return Column(
      children: [
        GestureDetector(
          onTap: toggleDropdown,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            decoration: widget.buttonDecoration ??


                BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${selectedValue ?? widget.hintText}',

                  style: widget.textStyle ??
                      const TextStyle(fontSize: 16, color: Colors.black),
                ),
                Icon(
                  isDropdownOpen ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
        SizeTransition(
          sizeFactor: _animationController,
          axisAlignment: -1.0,
          child: Container(
            height: widget.dropdownHeight,
            decoration: widget.dropdownDecoration ??
                BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.blue, width: 1.5),
                ),
            child: ListView.builder(
              itemCount: widget.items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedValue = widget.items[index];
                      isDropdownOpen = false;
                      _animationController.reverse();
                    });
                    widget.onItemSelected(widget.items[index]);
                  },
                  child: Container(


                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: index == widget.items.length - 1
                              ? Colors.transparent
                              : Colors.grey[300]!,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      widget.items[index],
                      style: widget.textStyle ??
                          const TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

