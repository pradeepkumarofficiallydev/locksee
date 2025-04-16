// import 'package:flutter/material.dart';
// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// const String appId = '4fca418f36fc4481ba72d1b7f38870f7'; // Replace with your actual App ID
// const String channelName = 'testchannel';
// const String token = ""; // Replace with a valid token if required
// const int uid = 0;
//
//
//
// class Agorasdk extends StatefulWidget {
//   @override
//   State<Agorasdk> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<Agorasdk> {
//   late final RtcEngine _engine;
//   bool _isJoined = false;
//   int? _remoteUid;
//
//   @override
//   void initState() {
//     super.initState();
//     _initAgora();
//   }
//
//   Future<void> _initAgora() async {
//     await [Permission.camera, Permission.microphone].request();
//
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(RtcEngineContext(appId: appId));
//
//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (connection, elapsed) {
//           setState(() => _isJoined = true);
//           print("Local user joined");
//         },
//         onUserJoined: (connection, remoteUid, elapsed) {
//           setState(() => _remoteUid = remoteUid);
//           print("Remote user joined: $remoteUid");
//         },
//         onUserOffline: (connection, remoteUid, reason) {
//           setState(() => _remoteUid = null);
//           print("Remote user left: $remoteUid");
//         },
//       ),
//     );
//
//     await _engine.enableVideo();
//     await _engine.startPreview();
//     await _engine.joinChannel(
//       token: token,
//       channelId: channelName,
//       uid: uid,
//       options: ChannelMediaOptions(),
//     );
//   }
//
//   @override
//   void dispose() {
//     _engine.leaveChannel();
//     _engine.release();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Agora Video Call')),
//         body: Stack(
//           children: [
//             Center(
//               child: _isJoined
//                   ? AgoraVideoView(
//                 controller: VideoViewController(
//                   rtcEngine: _engine,
//                   canvas: VideoCanvas(uid: uid),
//                 ),
//               )
//                   : CircularProgressIndicator(),
//             ),
//             if (_remoteUid != null)
//               Positioned(
//                 top: 20,
//                 right: 20,
//                 child: SizedBox(
//                   width: 120,
//                   height: 160,
//                   child: AgoraVideoView(
//                     controller: VideoViewController.remote(
//                       rtcEngine: _engine,
//                       canvas: VideoCanvas(uid: _remoteUid),
//                       connection: RtcConnection(channelId: channelName),
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
