import 'dart:convert';

import 'package:kstructure/src/api/apis.dart';
import 'package:flutter/material.dart';

class categoriesServices {
  Api api = Api();

  Future getCategories(BuildContext context) async {
    Map<String, dynamic> data = {
    };
    final response = await api.post(context, 'categories', data);
    return jsonDecode(response.body);
  }
}
