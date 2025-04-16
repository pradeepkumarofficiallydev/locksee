import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:locksee/screens/single_chat_screen.dart';
import 'package:locksee/utils/AppColors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../Utils/Preference.dart';
import '../utils/SecureStorageService.dart';
import '../utils/SocketService.dart';

class ChatsScreen extends StatefulWidget {
  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  // late IO.Socket socket;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> chatHistory = [];

  String formatTimestamp(String timestamp) {
    try {
      DateTime dateTime =
          DateTime.parse(timestamp).toLocal(); // Convert to local time
      return DateFormat('h:mm a').format(dateTime); // Format as 1:14 PM
    } catch (e) {
      return 'Invalid Date'; // Handle invalid inputs
    }
  }

  var userId;

  final SecureStorageService storageService = SecureStorageService();

  SocketService socketService = SocketService( );

  late IO.Socket socket;


  Future<bool> _isAndroid12OrAbove() async {
    return (await Permission.photos.isGranted || await Permission.videos.isGranted);
  }
  Future<void> request(BuildContext context, double height) async {
    Map<Permission, PermissionStatus> statuses;

    if (Platform.isAndroid) {
      // Check Android version
      if (await _isAndroid12OrAbove()) {
        // For Android 12+ (API 31+), use READ_MEDIA_IMAGES
        statuses = await [
          Permission.camera,
          Permission.videos,
          Permission.photos,
        ].request();
      } else {
        // For Android 11 and below, use READ_EXTERNAL_STORAGE
        statuses = await [
          Permission.camera,
          Permission.storage,
        ].request();



      }

      if (statuses.values.every((status) => status.isGranted)) {
       // showImagePicker(context, height);
      } else {
        print('No permission provided');
        openAppSettings(); // Prompt user to enable permissions manually
      }
    }
  }



  @override
  initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userId = await storageService.getUserId();
      print("UserId: $userId");

      socket = socketService.getSocket();



      // userId=  Preference?.shared?.getString(Preference.USER_ID)??"";
      // print("useriD ${storageService.getUserId().toString()}");

      //userId=   "67da7f1da8fbda2fa12c155e";
      initSocket();
    });
  }

  void darta() {
    userId = Preference?.shared?.getString(Preference.USER_ID) ?? "";

    print("useriD ${userId}");
  }

  void initSocket() {
    // socket = IO.io(
    //   "http://15.207.109.2:8000",
    //   IO.OptionBuilder()
    //       .setTransports(['websocket']).setQuery({'userId': userId}).build(),
    // );






    fetchUserChats();


    // socket.onConnect((_) {
    //   print("Connected to Socket Server");
    //   fetchUserChats();
    // });

    if (!mounted) return; // Prevent calling setState if the widget is disposed

    socket.on('userChats', (chats) {
      print('Received Chat List:   $chats');

      if (chats is List) {
        setState(() {
          chatHistory = chats.cast<Map<String, dynamic>>();
        });
      }
    });

    // socket.on('newMessage', (chats) {
    //   print("New Message: $chats");
    //
    //   setState(() {
    //     chatHistory = chats.cast<Map<String, dynamic>>();
    //   });
    //
    //
    //
    //
    // });

    // socket.on('newMessage', (message) {
    //   print("New Message: $message");
    //
    //   if (message is Map<String, dynamic>) {
    //     setState(() {
    //       chatHistory.insert(0, message); // Insert at the beginning
    //     });
    //   } else {
    //     print("Unexpected message format: $message");
    //   }
    // });
    //

    // socket.on('newMessage', (message) {
    //   print("New Message: $message");
    //
    //   if (message is Map<String, dynamic> && message.containsKey('senderId')) {
    //     setState(() {
    //       // Check if senderId already exists in chatHistory
    //       int existingIndex = chatHistory.indexWhere((chat) =>
    //           chat['_id'] ==
    //           message[
    //               'senderId']); // Matching senderId with existing chat's _id
    //
    //       if (existingIndex != -1) {
    //         // Update existing chat's lastMessage
    //         //chatHistory[existingIndex]['lastMessage'] = message;
    //
    //         var updatedChat = chatHistory[existingIndex];
    //         updatedChat['lastMessage'] = message;
    //         updatedChat['status'] = "updated";
    //
    //         // Remove it from the old position
    //         chatHistory.removeAt(existingIndex);
    //
    //         // Insert at the 0 index (top of the list)
    //         chatHistory.insert(0, updatedChat);
    //       } else {
    //         // If senderId is not found, create a new entry
    //         chatHistory.insert(0, {
    //           '_id': message['senderId'],
    //           'lastMessage': message,
    //           'status': "pending",
    //         });
    //       }
    //     });
    //   } else {
    //     print("Unexpected message format: $message");
    //   }
    // });




    socket.on('newMessage', (data) {
      print("New Message: $data");

      if (!mounted) return; // Prevent updating if widget is disposed




      if (data is Map<String, dynamic> && data.containsKey('message')) {
        var message = data['message']; // Extracting the actual message object

        if (message is Map<String, dynamic> && message.containsKey('senderId')) {
          setState(() {
            // Check if senderId already exists in chatHistory
            int existingIndex = chatHistory.indexWhere(
                  (chat) => chat['_id'] == message['senderId'],
            );

            if (existingIndex != -1) {
              // Update existing chat's lastMessage
              var updatedChat = chatHistory[existingIndex];
              updatedChat['lastMessage'] = message;
              updatedChat['status'] = "pending";


              // Remove from old position
              chatHistory.removeAt(existingIndex);

              // Insert at the top (0 index)
              chatHistory.insert(0, updatedChat);
            } else {
              // If senderId is not found, create a new entry
              chatHistory.insert(0, {
                '_id': message['senderId'],
                'lastMessage': message,
                'status': "pending",
              });
            }
          });
        } else {
          print("Unexpected message format inside 'message': $message");
        }
      } else {
        print("Unexpected message format: $data");
      }
    });





    socket.onDisconnect((_) => print('Disconnected from server'));
    socket.onConnectError((err) => print('Connection error: $err'));
  }

  void fetchUserChats() {
    socket.emit('fetchUserChats', {'userId': userId});
  }



  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      socket.emit('sendMessage', {
        'message': _controller.text,
        'timestamp': DateTime.now().toString(),
      });
      _controller.clear();
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(

        elevation: 0,
        backgroundColor: Colors.white,
        leadingWidth: 0,
        title: const Text(
          "Locksee",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.add, color: Colors.black, size: 26),
        //     onPressed: () {
        //       darta();
        //
        //     },
        //   )
        // ],


      ),
      body: Column(
        children: [
//
//
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: "Search by name or chat",
                hintStyle: TextStyle(color: Colors.grey[500]),
                suffixIcon: const Icon(Icons.mic, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

// Filter Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _filterButton("All", true),
                _filterButton("Unread", false),
                _filterButton("Groups", false),
                _filterButton("+", false),
              ],
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                final chat = chatHistory[index];
                final lastMessage = chat['lastMessage'] ?? {};
                final userDetails = chat['userDetails'] ?? {};

                final username = userDetails['username'] ?? {};
                final status = chat['status'] ?? {};

                print(status);

                final text = lastMessage['text'] ?? 'No message';
                final senderId = lastMessage['senderId'] ?? 'Unknown';
                final receiverId = lastMessage['receiverId'] ?? 'Unknown';

                final createdAt = lastMessage['createdAt'] ?? '';

                return



                    ListTile(
                  onTap: () {
                    // socket.disconnect();
                    // socket.dispose();

                    chat['status']="update";

                    setState(() {

                    });
                    Get.to(
                      SingleChatScreen(senderId,username),

                    );
                  },

                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profiles_icon.png"),
                    radius: 24,
                  ),
                  title: Text(
                    username.toString(),
                    style: TextStyle(
                      color: status == "pending" ? Colors.black : Colors.grey,
                      fontWeight: FontWeight.bold,

                    ),
                  ),
                  //  subtitle: Text(text),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Text(text),

                      Text(formatTimestamp(createdAt)),
                    ],
                  ),

                  subtitle: Row(
                    children: [
                      Expanded(
                        child: Text(
                          style: TextStyle(
                              color: status == "pending"
                                  ? Colors.black
                                  : Colors.grey),
                          text,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

  @override
  void dispose() {

    // socket.disconnect();
    // socket.dispose();


    socket.off('userChats'); // Remove the event listener

    super.dispose();
  }

}

Widget _filterButton(String text, bool isSelected) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    decoration: BoxDecoration(
      color: isSelected ? Colors.amber[100] : Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Text(
      text,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
  );
}

