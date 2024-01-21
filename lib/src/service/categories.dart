import 'package:kstructure/src/api/apis.dart';
import 'package:flutter/material.dart';

class categories {
  Api api = Api();

  Future getBusHours(BuildContext context, String id) async {
    Map<String, dynamic> data = {
    };
    final response = await api.post(context, 'categories', data);
    return response;
  }
}
