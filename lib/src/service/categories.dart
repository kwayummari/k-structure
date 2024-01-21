import 'dart:convert';

import 'package:kstructure/src/api/apis.dart';
import 'package:flutter/material.dart';

class categoriesServices {
  Api api = Api();

  Future getCategories(BuildContext context) async {
    final response = await api.get(context, 'categories');
    return jsonDecode(response.body);
  }
}
