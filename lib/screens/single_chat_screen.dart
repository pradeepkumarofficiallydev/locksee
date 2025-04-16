import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../utils/SecureStorageService.dart';
import '../utils/SocketService.dart';


class SingleChatScreen extends StatefulWidget {
  String senderId;
  String userName;


  SingleChatScreen( this.senderId ,this.userName);

  @override
  _SingleChatState createState() => _SingleChatState();
}

class _SingleChatState extends State<SingleChatScreen> {


     late ScrollController _scrollController;

  late IO.Socket socket;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> chatHistory = [];

  String formatTimestamp(String timestamp) {
    try {
      DateTime dateTime = DateTime.parse(timestamp).toLocal(); // Convert to local time
      return DateFormat('h:mm a').format(dateTime); // Format as 1:14 PM
    } catch (e) {
      return 'Invalid Date'; // Handle invalid inputs
    }
  }

  void initSocket() {

    print("cdlc,dcd");

       fetchUserChats();


    socket.on('newMessage', (data) {
      if (!mounted) return;

      print("New Message Received: $data");

      if (data is Map<String, dynamic> && data.containsKey('message')) {
        var message = data['message'];

        if (message is Map<String, dynamic> && message.containsKey('_id')) {
          setState(() {
            int existingIndex = chatHistory.indexWhere(
                  (chat) => chat['_id'] == message['_id'], // Compare with message _id
            );

            if (existingIndex != -1) {
              // Update existing chat message
              chatHistory[existingIndex] = message;
            } else {
              // Insert new message at the bottom
              chatHistory.add(message);
            }
          });
        } else {
          print("Invalid message format inside 'message': $message");
        }
      } else {
        print("Invalid message format: $data");
      }


      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });


    });

    //
    // socket.on('chatHistory', (chats) {
    //   if (!mounted) return; // Prevent updating if widget is disposed
    //
    //   print('Received Chat : $chats');
    //
    //   if (chats is List) {
    //     setState(() {
    //       List<Map<String, dynamic>> newChats = chats.cast<Map<String, dynamic>>();
    //
    //       for (var newMessage in newChats) {
    //         int existingIndex = chatHistory.indexWhere((msg) => msg['_id'] == newMessage['_id']);
    //
    //         if (existingIndex != -1) {
    //           // Update existing message
    //           chatHistory[existingIndex] = newMessage;
    //         } else {
    //           // Append new message at the bottom
    //           chatHistory.add(newMessage);
    //         }
    //       }
    //     });
    //   }
    //
    //
    //
    //   WidgetsBinding.instance.addPostFrameCallback((_) {
    //     if (_scrollController.hasClients) {
    //       _scrollController.animateTo(
    //         _scrollController.position.maxScrollExtent,
    //         duration: Duration(milliseconds: 300),
    //         curve: Curves.easeOut,
    //       );
    //     }
    //   });
    //
    //
    //
    //
    // });
    //
    //




    socket.on('chatHistory', (chats) {
      if (!mounted) return; // Prevent updating if widget is disposed

      print('Received Chat : $chats');

      if (chats is List) {
        setState(() {
          List<Map<String, dynamic>> newChats = chats.cast<Map<String, dynamic>>();

          for (var newMessage in newChats) {
            int existingIndex = chatHistory.indexWhere((msg) => msg['_id'] == newMessage['_id']);

            if (existingIndex != -1) {
              // Update existing message
              chatHistory[existingIndex] = newMessage;
            } else {
              // Insert new message at the top (index 0)
              if (mounted) {
                chatHistory.insert(0, newMessage);
              }
            }
          }
        });
      }
    });




  }


  void fetchUserChats() {
    socket.emit('fetchChatHistory', {


      "senderId":  widget.senderId, "receiverId": userId , "limit": "20"  , "skip": "0"


   //"senderId":userId, "receiverId": widget.senderId, "limit": "20"  , "skip": "0"


    });

  }


  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      String messageText = _controller.text;
      String tempId = DateTime.now().millisecondsSinceEpoch.toString(); // Temporary ID for sorting

      // Emit message to server
      socket.emit('sendMessage', {
        'text': messageText,
        "senderId": userId,
        "receiverId": widget.senderId,
        "status": "pending",
      });



      var map ={ 'text': messageText,
        "senderId": userId,
        "receiverId": widget.senderId,
        "status": "pending"};

      print("map ${map}" );



      _controller.clear();
    }
  }






  final SecureStorageService storageService = SecureStorageService();

  SocketService socketService = SocketService( );

  var userId;
@override

  void initState() {

  _scrollController = ScrollController();

  WidgetsBinding.instance.addPostFrameCallback((_) async {
    userId = await storageService.getUserId();
    print("UserId: $userId");

    socket = socketService.getSocket();


    // userId=  Preference?.shared?.getString(Preference.USER_ID)??"";
    // print("useriD ${storageService.getUserId().toString()}");

    //userId=   "67da7f1da8fbda2fa12c155e";

    initSocket();






  });


  super.initState();
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child:
            ListView.builder(
              controller: _scrollController,




            reverse: false, // Ensures latest messages appear at the bottom
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                var message = chatHistory[index];
                bool isSender = message['senderId'] == userId;

                return Align(
                  alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: isSender ? Colors.orange : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (message.containsKey('text') && message['text'] != null)
                          Text(
                            message['text'],
                            style: TextStyle(color: isSender ? Colors.white : Colors.black),
                          ),
                        Text(
                          "${DateTime.parse(message['createdAt']).hour}:${DateTime.parse(message['createdAt']).minute} ${message['status']}",
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                );
              },
            )


          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      leading: const BackButton(color: Colors.black),
      title: Row(
        children: [
          const CircleAvatar(
          //  backgroundImage: NetworkImage('https://source.unsplash.com/100x100/?face'),

            backgroundImage: AssetImage("assets/images/profiles_icon.png"),


          ),


          const SizedBox(width: 10),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.userName??"", style: TextStyle(color: Colors.black, fontSize: 16)),
              Text('Online', style: TextStyle(color: Colors.green, fontSize: 12)),
            ],
          ),
        ],
      ),
      actions: const [
        Icon(Icons.videocam, color: Colors.black),
        SizedBox(width: 15),
        Icon(Icons.call, color: Colors.black),
        SizedBox(width: 15),
        Icon(Icons.info_outline, color: Colors.black),
        SizedBox(width: 10),
      ],
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    bool isSent = message['isSent'];
    bool hasReplies = message.containsKey('replies');
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisAlignment:    MainAxisAlignment.start,
          crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (message['type'] == 'image')
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(12),
              //   child: Image.network(
              //     message['content'],
              //     width: 250,
              //     fit: BoxFit.cover,
              //   ),
              // )
              SizedBox(height: 10,)



            else
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isSent ? Colors.orange : Colors.grey[300],
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft:
                    isSent ? const Radius.circular(12) : Radius.zero,
                    bottomRight:
                    isSent ? Radius.zero : const Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      message['content'],
                      style: TextStyle(
                        color: isSent ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          message['time'],
                          style: TextStyle(
                            color: isSent ? Colors.white70 : Colors.black54,
                            fontSize: 12,
                          ),
                        ),
                        if (isSent) const SizedBox(width: 5),
                        if (isSent) const Icon(Icons.done_all, size: 16, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),


            if (hasReplies)
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 2),
                child: Row(
                  children: [
                    const Icon(Icons.reply, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(
                      '${message['replies']} Replies',
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    const SizedBox(width: 5),
                    const Icon(Icons.message, size: 16, color: Colors.orange),
                    const SizedBox(width: 2),
                    Text(
                      '${message['replies']}',
                      style: const TextStyle(color: Colors.orange, fontSize: 12),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller:_controller ,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt, color: Colors.grey),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.orange),
            onPressed: () {

              _sendMessage();

              print("c kdkcdcdscd");




            },
          ),
        ],
      ),
    );
  }


  @override
  void dispose() {
   // socket.off('newMessage');

    _scrollController.dispose();
    super.dispose();
  }


}


















//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import '../utils/SecureStorageService.dart';
// import '../utils/SocketService.dart';
//
// class SingleChatScreen extends StatefulWidget {
//   final String senderId;
//
//   SingleChatScreen(this.senderId);
//
//   @override
//   _SingleChatState createState() => _SingleChatState();
// }
//
// class _SingleChatState extends State<SingleChatScreen> {
//   late IO.Socket socket;
//   final TextEditingController _controller = TextEditingController();
//   List<Map<String, dynamic>> chatHistory = [];
//   late ScrollController _scrollController;
//   final SecureStorageService storageService = SecureStorageService();
//   SocketService socketService = SocketService();
//   var userId;
//
//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       userId = await storageService.getUserId();
//       print("UserId: $userId");
//       socket = socketService.getSocket();
//       initSocket();
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     socket.off('newMessage');
//     super.dispose();
//   }
//
//   void initSocket() {
//     fetchUserChats();
//
//     socket.on('newMessage', (data) {
//       if (!mounted) return;
//       // ... [Existing newMessage handling code]
//       // After updating chatHistory, scroll to bottom
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (_scrollController.hasClients) {
//           _scrollController.animateTo(
//             _scrollController.position.maxScrollExtent,
//             duration: Duration(milliseconds: 300),
//             curve: Curves.easeOut,
//           );
//         }
//       });
//     });
//
//     socket.on('chatHistory', (chats) {
//       if (!mounted) return;
//
//
//             print('Received Chat : $chats');
//
//
//
//       setState(() {
//
//       });
//
//       WidgetsBinding.instance.addPostFrameCallback((_) {
//         if (_scrollController.hasClients) {
//           _scrollController.animateTo(
//             _scrollController.position.maxScrollExtent,
//             duration: Duration(milliseconds: 300),
//             curve: Curves.easeOut,
//           );
//         }
//       });
//     });
//   }
//
//   void fetchUserChats() {
//     socket.emit('fetchChatHistory', {
//
//
//       "senderId":userId, "receiverId": widget.senderId , "limit": "20"  , "skip": "0"
//
//
//       //"senderId":userId, "receiverId": widget.senderId, "limit": "20"  , "skip": "0"
//
//
//     });
//
//   }
//
//
//   void _sendMessage() {
//     if (_controller.text.isNotEmpty) {
//       String messageText = _controller.text;
//       String tempId = DateTime.now().millisecondsSinceEpoch.toString(); // Temporary ID for sorting
//
//       // Create a message object
//       // Map<String, dynamic> newMessage = {
//       //   '_id': tempId, // Temporary ID
//       //   'text': messageText,
//       //   'senderId': userId,
//       //   'receiverId': widget.senderId,
//       //   'status': 'pending',
//       //   'createdAt': DateTime.now().toIso8601String(), // Local timestamp
//       // };
//       //
//       // // Update UI immediately
//       // setState(() {
//       //   chatHistory.insert(0, newMessage); // Add message at the top
//       // });
//
//       // Emit message to server
//       socket.emit('sendMessage', {
//         'text': messageText,
//         "senderId": userId,
//         "receiverId": widget.senderId,
//         "status": "pending",
//       });
//
//
//       var map ={ 'text': messageText,
//         "senderId": userId,
//         "receiverId": widget.senderId,
//         "status": "pending"};
//
//       print("map ${map}" );
//
//
//
//       _controller.clear();
//     }
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               controller: _scrollController,
//               reverse: false, // Messages ordered oldest to newest
//               itemCount: chatHistory.length,
//               itemBuilder: (context, index) {
//                 // ... [Existing itemBuilder code]
//               },
//             ),
//           ),
//           _buildMessageInput(),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//
//
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       elevation: 1,
//       leading: const BackButton(color: Colors.black),
//       title: Row(
//         children: [
//           const CircleAvatar(
//             //  backgroundImage: NetworkImage('https://source.unsplash.com/100x100/?face'),
//
//             backgroundImage: AssetImage("assets/images/profiles_icon.png"),
//
//
//           ),
//
//
//           const SizedBox(width: 10),
//           const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('George Alan', style: TextStyle(color: Colors.black, fontSize: 16)),
//               Text('Online', style: TextStyle(color: Colors.green, fontSize: 12)),
//             ],
//           ),
//         ],
//       ),
//       actions: const [
//         Icon(Icons.videocam, color: Colors.black),
//         SizedBox(width: 15),
//         Icon(Icons.call, color: Colors.black),
//         SizedBox(width: 15),
//         Icon(Icons.info_outline, color: Colors.black),
//         SizedBox(width: 10),
//       ],
//     );
//   }
//
//   Widget _buildMessageBubble(Map<String, dynamic> message) {
//     bool isSent = message['isSent'];
//     bool hasReplies = message.containsKey('replies');
//     return Align(
//       alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 5),
//         child: Column(
//           mainAxisAlignment:    MainAxisAlignment.start,
//           crossAxisAlignment: isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//           children: [
//             if (message['type'] == 'image')
//             // ClipRRect(
//             //   borderRadius: BorderRadius.circular(12),
//             //   child: Image.network(
//             //     message['content'],
//             //     width: 250,
//             //     fit: BoxFit.cover,
//             //   ),
//             // )
//               SizedBox(height: 10,)
//
//
//
//             else
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10),
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: isSent ? Colors.orange : Colors.grey[300],
//                   borderRadius: BorderRadius.only(
//                     topLeft: const Radius.circular(12),
//                     topRight: const Radius.circular(12),
//                     bottomLeft:
//                     isSent ? const Radius.circular(12) : Radius.zero,
//                     bottomRight:
//                     isSent ? Radius.zero : const Radius.circular(12),
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       message['content'],
//                       style: TextStyle(
//                         color: isSent ? Colors.white : Colors.black,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           message['time'],
//                           style: TextStyle(
//                             color: isSent ? Colors.white70 : Colors.black54,
//                             fontSize: 12,
//                           ),
//                         ),
//                         if (isSent) const SizedBox(width: 5),
//                         if (isSent) const Icon(Icons.done_all, size: 16, color: Colors.white),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//
//
//             if (hasReplies)
//               Padding(
//                 padding: const EdgeInsets.only(left: 10, top: 2),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.reply, size: 16, color: Colors.grey),
//                     const SizedBox(width: 5),
//                     Text(
//                       '${message['replies']} Replies',
//                       style: const TextStyle(color: Colors.grey, fontSize: 12),
//                     ),
//                     const SizedBox(width: 5),
//                     const Icon(Icons.message, size: 16, color: Colors.orange),
//                     const SizedBox(width: 2),
//                     Text(
//                       '${message['replies']}',
//                       style: const TextStyle(color: Colors.orange, fontSize: 12),
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMessageInput() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(top: BorderSide(color: Colors.grey[300]!)),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller:_controller ,
//               decoration: InputDecoration(
//                 hintText: 'Type your message...',
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.camera_alt, color: Colors.grey),
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.send, color: Colors.orange),
//             onPressed: () {
//
//               _sendMessage();
//
//               print("c kdkcdcdscd");
//
//
//
//
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
// }






















