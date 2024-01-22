import 'dart:convert';

import 'package:kstructure/src/api/apis.dart';
import 'package:flutter/material.dart';

class categoriesServices {
  Api api = Api();

  Future getCategories(BuildContext context, int categoryId) async {
    Map<String, dynamic> data = {
      'phone_number': categoryId.toString(),
    };
    final response = await api.post(context, 'categories', data);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }
}
