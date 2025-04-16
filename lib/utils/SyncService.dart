import 'dart:async';
import 'ApiService.dart';
import 'LocalDatabase.dart';
import 'connectivity_service.dart';

class SyncService {
  final LocalDatabase _localDatabase = LocalDatabase();
  final ConnectivityService _connectivityService = ConnectivityService();
  final ApiService apiService = ApiService();

  Timer? _syncTimer;

  void startSyncing() {
    _syncTimer = Timer.periodic(Duration(seconds: 10), (timer) async {
      if (await _connectivityService.isOnline()) {
        await _syncUnsyncedData();
      }
    });
  }

  Future<void> _syncUnsyncedData() async {
    final unsyncedData = await _localDatabase.fetchUnsyncedData();
    for (var data in unsyncedData) {
      try {


        await apiService.sendDataToServer(data);
        await _localDatabase.markAsSynced(data['id']);


        print('Data with ID ${data['id']} synced');
      } catch (e) {
        print('Error syncing data with ID ${data['id']}: $e');
      }
    }
  }

  void stopSyncing() {
    _syncTimer?.cancel();
  }
}
