import 'package:tugas_akhir/base_network/base_network.dart';

class ApiDataSource2 {
  static ApiDataSource2 instance = ApiDataSource2();

  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork.get("maps");
  }

}
