import 'package:dio/dio.dart';

import '../models/specs.dart';

Future<InfoData> fetchSpecs(String slug) async {
  
    var url = 'https://api-mobilespecs.azharimm.site/v2/$slug';
    final response = await Dio().get(url);
    if(response.statusCode != 200) {
      return InfoData();
    }
    final parsedResponse = Specifications.fromJson(response.data);
    final infoData = parsedResponse.data!;
    return infoData;
}