import 'package:finance_app/services/api_utils.dart';
import 'package:finance_app/models/user.dart';

Future<User> getUser(int id) async {
  String apiURL = "http://10.0.2.2:8000/api/users/$id";
  try {
    Map<String, dynamic> data = await ApiUtils.getDataAsMap(apiURL) as Map<String, dynamic>;
    return User.fromJson(data);
  } catch (e) {
    throw Exception("Erro durante a chamada de API: $e");
  }
}


