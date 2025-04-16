import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'SecureStorageService.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket socket;
  final SecureStorageService storageService = SecureStorageService();

  factory SocketService() {
    return _instance;
  }

  SocketService._internal() {
    initSocket();
  }

  var  userId;

  Future<void> initSocket() async {

    userId = await storageService.getUserId();

    socket = IO.io(
      "http://15.207.109.2:8000",
    //   IO.OptionBuilder()
    //       .setTransports(['websocket']).setQuery({'userId': userId}).build(),
    // );





        IO.OptionBuilder()
            .setTransports(['websocket']) // Force WebSocket only
            .enableReconnection() // 🔁 Enables reconnection
            .setReconnectionAttempts(5)
            .setReconnectionDelay(3000)
            .enableAutoConnect() // Auto connect on `.io()`
            .setQuery({'userId': userId.toString()}) // Optional stringify
            .build(),
    );


    socket.on('disconnect', (reason) => print("Disconnected: $reason"));


    socket.connect();
    socket.onConnect((_) {

      print('Socket connected');

    });

    socket.onDisconnect((_) {
      print('Socket disconnected');
    });
  }

  IO.Socket getSocket() {
    return socket;
  }
}
