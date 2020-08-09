import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getNetworkData() async {
    http.Response response = await http.get(url);
    String data = response.body;
    if (response.statusCode == 200)
      return jsonDecode(data);
    else
      print(response.statusCode);
  }
}
