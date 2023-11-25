import 'package:tugas_akhir/base_network/base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadUsers() {
    return BaseNetwork.get("agents?isPlayableCharacter=true");
  }
}
