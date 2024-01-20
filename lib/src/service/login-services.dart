import 'dart:convert';

import 'package:kstructure/src/provider/login-provider.dart';
import 'package:kstructure/src/utils/routes/route-names.dart';
import 'package:kstructure/src/widgets/app_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../api/apis.dart';

class loginService {
  Api api = Api();

  Future<void> login(
      BuildContext context, String phone_number, String password) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    Provider.of<MyProvider>(context, listen: false)
        .updateLoging(!myProvider.myLoging);
    Map<String, dynamic> data = {
      'phone_number': phone_number.toString(),
      'password': password.toString(),
    };
    final response = await api.post(context, 'login', data);
    final newResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      Provider.of<MyProvider>(context, listen: false)
          .updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: false,
        response: newResponse['message'],
      ).show(context);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone_number', phone_number);
      await prefs.setString('id', newResponse['userId'].toString());
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.bottomNavigationBar, (_) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.bottomNavigationBar, (_) => false);
      Provider.of<MyProvider>(context, listen: false)
          .updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: true,
        response: response.body.message,
      ).show(context);
    }
  }
}
