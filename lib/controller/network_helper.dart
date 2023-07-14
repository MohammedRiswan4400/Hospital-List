import 'dart:developer';

import 'package:http/http.dart' as http;

import '../model/model.dart';

class NetworkHelper {
  static Future<Hospitals> fetchDataFromApi() async {
    const api =
        "https://manyatechnosys.com/a2sfoundation.in/newdev/index.php/MobileApi/HospitalList?state=2&district=5&taluk=12";
    final url = Uri.parse(api);
    final response = await http.post(url);
    final json = hospitalsFromJson(response.body);
    if (response.statusCode == 200) {
      // log(response.body);
      return json;
    } else if (response.statusCode == 400) {
      log("BackEnt Error");
    }
    return json;
  }
}
