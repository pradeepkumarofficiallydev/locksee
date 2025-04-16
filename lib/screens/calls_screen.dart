










import 'package:flutter/material.dart';


class CallsScreen extends StatefulWidget {
  @override
  _CallsScreenState createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  bool isMissedSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Calls",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search chats",
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Tab Selector
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildTabButton("All", !isMissedSelected),
                const SizedBox(width: 10),
                _buildTabButton("Missed", isMissedSelected),
              ],
            ),
          ),

          // Call List
          Expanded(
            child: ListView(
              children: [
                _buildCallItem(
                  imageUrl: "assets/user1.jpg",
                  name: "Oliver Bennett",
                  callType: "Missed video call",
                  callTypeIcon: Icons.videocam_off,
                  callTypeColor: Colors.red,
                  date: "Yesterday",
                ),
                _buildCallItem(
                  imageUrl: "assets/user2.jpg",
                  name: "Emma Harrison",
                  callType: "Incoming video call",
                  callTypeIcon: Icons.videocam,
                  callTypeColor: Colors.green,
                  date: "24/03/2024",
                ),
                _buildCallItem(
                  imageUrl: "assets/user3.jpg",
                  name: "Benjamin Clarke",
                  callType: "Outgoing audio call",
                  callTypeIcon: Icons.call_made,
                  callTypeColor: Colors.green,
                  date: "24/03/2024",
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 1, // Calls tab selected
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.grey,
      //   showUnselectedLabels: true,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      //     BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
      //     BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: "Chats"),
      //     BottomNavigationBarItem(icon: Icon(Icons.qr_code), label: "Connect"),
      //   ],
      // ),


    );
  }

  Widget _buildTabButton(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMissedSelected = (label == "Missed");
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }

  Widget _buildCallItem({
    required String imageUrl,
    required String name,
    required String callType,
    required IconData callTypeIcon,
    required Color callTypeColor,
    required String date,
  }) {
    return ListTile(
      leading: CircleAvatar(radius: 25, backgroundImage: AssetImage(imageUrl)),
      title: Text(name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          Icon(callTypeIcon, size: 16, color: callTypeColor),
          const SizedBox(width: 4),
          Text(callType, style: const TextStyle(color: Colors.grey)),
        ],
      ),
      trailing: Text(date, style: const TextStyle(color: Colors.grey)),
    );
  }
}



