import 'dart:convert';

import 'package:kstructure/src/api/apis.dart';
import 'package:flutter/material.dart';

class contentsByCategoriesServices {
  Api api = Api();

  Future getContents(BuildContext context, int categoryId) async {
    Map<String, dynamic> data = {
      'id': categoryId.toString(),
    };
    final response = await api.post(context, 'contents_by_id', data);
    final decodedResponse = jsonDecode(response.body);
    return decodedResponse;
  }
}
