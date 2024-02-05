import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:connectivity/connectivity.dart';

const username = 'Vilas';
const password = '--senha--';
final basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';

Future<Map<String, dynamic>> getUser() async {
  String apiURL = "http://10.0.2.2:8000/api/users/3";
  bool isConnected = await checkInternetConnection();

  try {
    if (!isConnected) {
      throw Exception("Sem conexão com a internet");
    }

    final response = await http.get(
      Uri.parse(apiURL),
      headers: {'Authorization': basicAuth},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Erro ao carregar os dados da API: ${response.statusCode}");
    }
  } catch (e) {
    print("----------------------------------------------------------");
    print('$e');
    print("----------------------------------------------------------");
    throw Exception("Erro durante a chamada de API: $e");
  }
}

Future<bool> checkInternetConnection() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}