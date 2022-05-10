import 'package:dio/dio.dart';

import '../models/phones.dart';

Future<List<PhoneModel>> fetchPhones(String brandSlug) async {
  
    var url = 'https://api-mobilespecs.azharimm.site/v2/brands/$brandSlug';
    final response = await Dio().get(url);
    if(response.statusCode != 200) {
      return [];
    }
    final parsedResponse = Phones.fromJson(response.data);
    return parsedResponse.data!.phones!;
}