import 'package:dio/dio.dart';

import '../models/phones.dart';

Future<List<PhoneModel>> fetchSearch(String input) async {
  
    var url = 'http://api-mobilespecs.azharimm.site/v2/search?query=$input';
    final response = await Dio().get(url);
    if(response.statusCode != 200) {
      return [];
    }
    final parsedResponse = Phones.fromJson(response.data);
    return parsedResponse.data!.phones!;
}