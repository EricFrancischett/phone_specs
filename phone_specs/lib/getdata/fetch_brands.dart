import 'package:dio/dio.dart';

import '../models/brands.dart';

Future<List<BrandModel>> fetchBrands() async {
  
    var url = 'https://api-mobilespecs.azharimm.site/v2/brands';
    final response = await Dio().get(url);
    if(response.statusCode != 200) {
      return [];
    }
    final parsedResponse = Brands.fromJson(response.data);
    return parsedResponse.data!;
}