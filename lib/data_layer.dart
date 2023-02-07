import 'package:e_com/electronics.dart';
import 'package:http/http.dart' as http;

Future<List<Electronics>> getElectronics() async {
  try {
    var url = Uri.parse('http://127.0.0.1:8000/items/');
    var response = await http.get(url);
    List<Electronics> items = electronicModelFromJson(response.body);
    return items;
  } catch (e) {
    print(e);
    return [];
  }
}
