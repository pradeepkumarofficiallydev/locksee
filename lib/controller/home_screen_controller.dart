import 'dart:async';
import 'dart:convert';
import 'dart:io';

// import 'package:chat_messenger/controllers/app_controller.dart';
// import 'package:chat_messenger/screens/contacts/controllers/contact_controller.dart';
// import 'package:chat_messenger/tabs/calls/controller/call_history_controller.dart';
// import 'package:chat_messenger/tabs/chats/controllers/chat_controller.dart';
// import 'package:chat_messenger/tabs/connect/screens/connect_screen.dart';
// import 'package:chat_messenger/tabs/groups/controllers/group_controller.dart';
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:locksee/screens/ProfileSetupScreen.dart';
import 'package:locksee/screens/login_screen.dart';
// import 'package:chat_messenger/tabs/calls/call_hsitory_screen.dart';
// import 'package:chat_messenger/tabs/groups/screens/groups_screen.dart';
// import 'package:chat_messenger/tabs/profile/profile_screen.dart';
// import 'package:get/get.dart';
// import 'package:chat_messenger/tabs/chats/chats_screen.dart';
// import 'package:phone_state/phone_state.dart';
// import 'package:receive_sharing_intent/receive_sharing_intent.dart';
//
// import '../../../api/chat_api.dart';
// import '../../../api/contact_api.dart';
// import '../../../api/group_api.dart';
// import '../../../api/message_api.dart';
// import '../../../controllers/auth_controller.dart';
// import '../../../database_operations/message_repo.dart';
// import '../../../helpers/app_helper.dart';
// import '../../../helpers/routes_helper.dart';
// import '../../../media/helpers/media_helper.dart';
// import '../../../models/group.dart';
// import '../../../models/message.dart';
// import '../../../models/user.dart';
// import '../../../routes/app_routes.dart';
// import '../../../tabs/connect/controllers/connect_controller.dart';
// import '../../calling/controller/call_controller.dart';
import '../screens/calls_screen.dart';
import '../screens/chats_screen.dart';
import '../screens/connect_screen.dart';
import '../screens/profiles_screen.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  // Vars
  final RxInt pageIndex = 0.obs;
  final RxBool isMinimized = false.obs;
  // PhoneState callStatus = PhoneState.nothing();
  late StreamSubscription _intentSub;
  // final _sharedFiles = <SharedMediaFile>[];
  RxInt chatCount = 0.obs;

  // List of tab pages
  final List<Widget> pages = [
     ChatsScreen(),
     CallsScreen(),


    CallsScreen(),


    ConnectScreen(),
     AccountScreen(),


  ];

  @override
  void onInit() {
    // Start listening to phone call state changes
    // Listen to the phone state stream
    //
    //
    //   PhoneState.stream.listen((event) {
    //     callStatus = event;
    //   });
    //
    //   Get.put(GroupController(), permanent: true);
    //   Get.put(ContactController(), permanent: true);
    //   Get.put(ChatController(), permanent: true);
    //
    //   Get.put(CallHistoryController(), permanent: true);
    //   Get.put(ConnectController(), permanent: true);
    //   Get.put(CallController(), permanent: true);
    //
    //   // Listen to media sharing coming from outside the app while the app is in the memory.
    //   _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((value) {
    //     _sharedFiles.clear();
    //     _sharedFiles.addAll(value);
    //     if (_sharedFiles.isNotEmpty) {
    //       sendMedias();
    //     }
    //
    //     print(_sharedFiles.map((f) => f.toMap()));
    //   }, onError: (err) {
    //     print("getIntentDataStream error: $err");
    //   });
    //   // Get the media sharing coming from outside the app while the app is closed.
    //   ReceiveSharingIntent.instance.getInitialMedia().then((value) {
    //     _sharedFiles.clear();
    //     _sharedFiles.addAll(value);
    //     if (_sharedFiles.isNotEmpty) {
    //       sendMedias();
    //     }
    //     print(_sharedFiles.map((f) => f.toMap()));
    //
    //     // Tell the library that we are done processing the intent.
    //     ReceiveSharingIntent.instance.reset();
    //   });
    //   super.onInit();
    // }
    //
    // sendMedias() async {
    //   final List? contacts = await RoutesHelper.toSelectContacts(
    //       title: 'share'.tr, showGroups: true, isBroadcast: false);
    //   if (contacts == null) {
    //     _sharedFiles.clear();
    //     return;
    //   }
    //   String? textMsg;
    //   for (var contact in contacts) {
    //     String? nickNameFromUser;
    //     if (contact is User) {
    //       ContactApi.getContactName(contact!.userId).then((String? nickName) {
    //         nickNameFromUser = nickName;
    //       });
    //     }
    //     var type = MessageType.image;
    //     File? file;
    //     for (SharedMediaFile sharedFile in _sharedFiles) {
    //       if (sharedFile.type == SharedMediaType.text ||
    //           sharedFile.type == SharedMediaType.url) {
    //         type = MessageType.text;
    //         textMsg = sharedFile.path;
    //       } else {
    //         file = File(sharedFile.path);
    //       }
    //
    //       // <--- Build message --->
    //       final Message message = Message(
    //           msgId: AppHelper.generateID,
    //           type: type,
    //           textMsg: textMsg ?? "",
    //           fileUrl: '',
    //           gifUrl: '',
    //           location: null,
    //           videoThumbnail: '',
    //           senderId: AuthController.instance.currentUser.userId,
    //           isRead: false,
    //           isDelivered: false,
    //           isRecAudio: false,
    //           replyMessage: null,
    //           contact: null,
    //           sentAt: DateTime.now());
    //       if (file != null) {
    //         if (type == MessageType.video) {
    //           // final File thumbnail =
    //           //     await MediaHelper.getVideoThumbnail(sharedFile.path);
    //           //
    //           //
    //           //  message.localVideoThumbnail = thumbnail.path;
    //           // message.localFilePath = sharedFile.path;
    //         } else {
    //           final String? thumbnail =
    //           await MediaHelper.copyFileToExternalAppDir(file);
    //           message.localFilePath = thumbnail ?? file.path;
    //         }
    //       }
    //
    //       if (contact is User) {
    //         User? userTmpData = contact;
    //         if (AuthController.instance.currentUser.isPremimum) {
    //           // Only check the recipient's greenLightOn status for premium members
    //           if (userTmpData.isPremimum) {
    //             if (userTmpData.greenLightOn) {
    //               message.isReadReciptOn = true;
    //             } else {
    //               message.isReadReciptOn = false; // Enable read receipt
    //             }
    //           } else {
    //             message.isReadReciptOn = true;
    //           }
    //         } else {
    //           // For non-premium members, check both users' greenLightOn statuses
    //           if (!userTmpData.greenLightOn ||
    //               !AuthController.instance.currentUser.greenLightOn) {
    //             message.isReadReciptOn = false;
    //           } else {
    //             message.isReadReciptOn = true; // Enable read receipt
    //           }
    //         }
    //       }
    //
    //       MessageRepository().insertMessage(message,
    //           isGroup: contact is Group,
    //           userId: contact is User ? contact.userId : "",
    //           groupId: contact is Group ? contact.groupId : "");
    //
    //       if (AppController.instance.isNetConnectivity.isFalse) {
    //         // Send message
    //         if (contact is Group) {
    //           final Group group = contact!;
    //           // Check broadcast
    //           if (group.isBroadcast) {
    //             // MessageApi.sendBroadcastMessage(group: group, message: message);
    //           } else {
    //             group.lastMsg = message;
    //             group.lastMsg!.sendedTo = group.participants
    //                 .map((participant) => participant.userId)
    //                 .toList();
    //             GroupApi.groupsRef.doc(group.groupId).update(group.toUpdateMap());
    //             // MessageApi.sendGroupMessage(group: group, message: message);
    //           }
    //         } else {
    //           // Save the last chat
    //           ChatApi.saveChat(
    //             userId1: AuthController.instance.currentUser.userId,
    //             userId2: contact!.userId,
    //             message: message,
    //           );
    //         }
    //         return;
    //       }
    //       if (file != null) {
    //         message.fileUrl = await AppHelper.uploadFile(
    //           file: file,
    //           userId: AuthController.instance.currentUser.userId,
    //         );
    //       }
    //
    //       // Send message
    //       if (contact is Group) {
    //         final Group group = contact!;
    //         // Check broadcast
    //         if (group.isBroadcast) {
    //           MessageApi.sendBroadcastMessage(group: group, message: message);
    //         } else {
    //           MessageApi.sendGroupMessage(group: group, message: message);
    //         }
    //       } else {
    //         MessageApi.sendMessage(
    //             message: message,
    //             receiver: contact!,
    //             currentUserNickname: nickNameFromUser)
    //             .then((res) {
    //           print("message published");
    //         });
    //       }
    //     }
    //   }
    //
    //
    //
    //
    //
    //
    //
    //
    //   // RoutesHelper.toMessages(user: us);
    // }


  }
}
