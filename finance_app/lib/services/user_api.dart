import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:finance_app/services/connection.dart';
import 'package:finance_app/models/user.dart';



Future<User> getUser(int id) async {
  String apiURL = "http://10.0.2.2:8000/api/users/$id";
  try {
    final basicAuth = dotenv.env['API_BASIC'];
    await checkInternetConnection();

    final response = await http.get(
      Uri.parse(apiURL),
      headers: {'Authorization': 'Basic $basicAuth'},
    );
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception(
          "Erro ao carregar os dados da API: ${response.statusCode}");
    }
  } catch (e) {
    throw Exception("Erro durante a chamada de API: $e");
  }
}
