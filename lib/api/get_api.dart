import 'dart:convert';

import 'package:http/http.dart' as http;

class GetApi{
  getTopProducts() async {
    final response = await http.get(Uri.parse('http://216.250.9.29:5003/public/products/top'));
    if(response.statusCode == 200){
      final res = jsonDecode(response.body) as Map;
      final json = res['rows'] as List;
      return json;
    } else{
      throw Exception(response.reasonPhrase);
    }
  }
  getBestProducts() async {
    final response = await http.get(Uri.parse('http://216.250.9.29:5003/public/products/action'));
    if(response.statusCode == 200){
      final res = jsonDecode(response.body) as Map;
      final json = res['action_products'] as Map;
      final json2 = json['rows'] as List;
      return json2;
    } else{
      throw Exception(response.reasonPhrase);
    }
  }
  getNewProducts() async {
    final response = await http.get(Uri.parse('http://216.250.9.29:5003/public/products/new'));
    if(response.statusCode == 200){
      final res = jsonDecode(response.body) as Map;
      final json = res['new_products'] as List;
      return json;
    } else{
      throw Exception(response.reasonPhrase);
    }
  }
}