import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'connection.dart';
import 'package:http/http.dart' as http;

class ApiUtils {

  static final _basicAuth = dotenv.env['API_BASIC'];
  /// Fetches data from an API endpoint and returns it as a map.
  ///
  /// Usage:
  /// ```
  /// var data = await ApiUtils.getDataAsMap(url);
  /// ```
  ///
  /// [url]: The URL of the API endpoint to fetch data from.
  static Future<Map<String, dynamic>?> getDataAsMap(String url) async {
    try {
      await checkInternetConnection();

      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Basic $_basicAuth'},
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        throw Exception(
            "Error loading API data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error during API call: $e");
    }
  }


  /// Sends data to an API endpoint via HTTP POST request.
  ///
  /// Usage:
  /// ```
  /// var statusCode = await ApiUtils.postData(url, body);
  /// ```
  ///
  /// [url]: The URL of the API endpoint to send data to.
  /// [body]: The data to be sent as the request body, encoded as a JSON map.
  static Future<int> postData(String url, Map<String, dynamic> body) async {
    try {
      await checkInternetConnection();
      final response = await http.post(
        Uri.parse(url),
        headers:{
          'Authorization': 'Basic $_basicAuth',
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(body),
      );
      return response.statusCode;
    } catch (e) {
      throw Exception("An error occurred: $e");
    }
  }

  static Future<int> deleteData(String url) async {
     final basicAuth = dotenv.env['API_BASIC'];
    try {

      await checkInternetConnection();
      final response = await http.delete(
        Uri.parse(url),
        headers: <String, String> {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Basic $basicAuth',
        }
      );
      print(response.headersSplitValues);
      return response.statusCode;
    }catch(e) {
      throw Exception("An error occurred: $e");
    }
  }

}
