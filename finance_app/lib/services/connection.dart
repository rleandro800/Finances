import 'package:connectivity/connectivity.dart';

Future<void> checkInternetConnection() async {
  /// Checks the internet connection and returns a Future<bool>.
  ///
  /// This function verifies the presence of an internet connection using the
  /// `Connectivity` library. If a connection exists, it not returns;
  /// otherwise, it throws an exception with the message "Sem conexão com a internet".
  var connectivityResult = await Connectivity().checkConnectivity();
  if(!(connectivityResult != ConnectivityResult.none)){
    throw Exception("Sem conexão com a internet");
  }
}