// import 'package:flutter/material.dart';
// import '../utils/LocalDatabase.dart';
// import '../utils/SyncService.dart';
//
// import '../utils/ApiService.dart';
// import '../utils/connectivity_service.dart';
//
// class sync_data_screen extends StatelessWidget {
//   final SyncService _syncService = SyncService();
//   final LocalDatabase _localDatabase = LocalDatabase();
//   final ConnectivityService _connectivityService = ConnectivityService();
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Local Database Sync',
//       home: Scaffold(
//         appBar: AppBar(title: Text('Sync with Local Database')),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               ElevatedButton(
//                 onPressed: () async {
//                   // Example: Add data when offline or online
//                   if (await _connectivityService.isOnline()) {
//                     // Send data immediately if online
//
//
//                     await _syncService.apiService.sendDataToServer({
//                       'title': 'Online Data',
//                       'content': 'This data was sent while online.'
//                     });
//
//
//
//
//
//
//
//                   } else {
//
//
//                     // Store data locally if offline
//
//                     await _localDatabase.insertData('Offline Data', 'This data is stored locally.');
//                     print('Data stored locally.');
//
//
//                   }
//                 },
//                 child: Text('Add Data'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Start background syncing
//                   _syncService.startSyncing();
//                 },
//                 child: Text('Start Syncing'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Stop syncing
//                   _syncService.stopSyncing();
//                 },
//                 child: Text('Stop Syncing'),
//               ),
//
//
//
//
//
//
//
//
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }










import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import '../utils/LocalDatabase.dart';

// 1. Define the LocalDatabase class (as per your code)
// class LocalDatabase {
//   static final LocalDatabase _instance = LocalDatabase._internal();
//   factory LocalDatabase() => _instance;
//   static Database? _database;
//
//   LocalDatabase._internal();
//
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB();
//     return _database!;
//   }
//
//   Future<Database> _initDB() async {
//     final documentsDirectory = await getApplicationDocumentsDirectory();
//     final path = join(documentsDirectory.path, 'app_data.db');
//     return await openDatabase(path, version: 1, onCreate: (db, version) async {
//       await db.execute('''
//         CREATE TABLE data (
//           id INTEGER PRIMARY KEY AUTOINCREMENT,
//           title TEXT,
//           content TEXT,
//           isSynced INTEGER DEFAULT 0
//         );
//       ''');
//     });
//   }
//
//   Future<void> insertData(String title, String content) async {
//     final db = await database;
//     await db.insert('data', {'title': title, 'content': content, 'isSynced': 0});
//   }
//
//   Future<List<Map<String, dynamic>>> fetchUnsyncedData() async {
//     final db = await database;
//     return await db.query('data', where: 'isSynced = ?', whereArgs: [0]);
//   }
//
//   Future<void> markAsSynced(int id) async {
//     final db = await database;
//     await db.update('data', {'isSynced': 1}, where: 'id = ?', whereArgs: [id]);
//   }
// }




class sync_data_screen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<sync_data_screen> {
  final LocalDatabase _localDatabase = LocalDatabase();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  late Future<List<Map<String, dynamic>>> _unsyncedData;



  @override
  void initState() {
    super.initState();
    _unsyncedData = _localDatabase.fetchUnsyncedData1(); // Fetch unsynced data initially
  }



  void _addData() async {
    if (_titleController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      await _localDatabase.insertData(_titleController.text, _contentController.text);
      setState(() {


        _unsyncedData = _localDatabase.fetchUnsyncedData(); // Refresh data


      });


      _titleController.clear();
      _contentController.clear();


    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('SQLite with Flutter')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: _contentController,
                decoration: InputDecoration(labelText: 'Content'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addData,
                child: Text('Add Data'),
              ),
              SizedBox(height: 16),
              Text('Unsynced Data:', style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              FutureBuilder<List<Map<String, dynamic>>>(
                future: _unsyncedData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasError) {
                    print('Error: ${snapshot.error}');





                    return Text('Error: ${snapshot.error}');
                  }

                  final unsyncedData = snapshot.data ?? [];

                  if (unsyncedData.isEmpty) {
                    return Text('No unsynced data.');
                  }

                  return Expanded(


                    child: ListView.builder(
                      itemCount: unsyncedData.length,
                      itemBuilder: (context, index) {
                        final data = unsyncedData[index];
                        return ListTile(
                          title: Text(data['title']),
                          subtitle: Text(data['content']),
                          trailing: IconButton(
                            icon: Icon(Icons.sync),
                            onPressed: () async {

                              await _localDatabase.markAsSynced(data['id']);

                              setState(() {


                                _unsyncedData = _localDatabase.fetchUnsyncedData();

                                // Refresh data
                              });
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



