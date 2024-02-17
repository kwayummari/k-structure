import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/apis.dart';
import '../provider/login-provider.dart';
import '../utils/routes/route-names.dart';
import '../widgets/app_snackbar.dart';

class loginService {
  final Api api = Api();

  Future<void> login(
      BuildContext context, String phoneNumber, String password) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    myProvider.updateLoging(!myProvider.myLoging);
    Map<String, dynamic> data = {
      'phone_number': phoneNumber,
      'password': password,
    };

    final response = await api.post(context, 'login', data);
    final newResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      myProvider.updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: false,
        response: newResponse['message'],
      ).show(context);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('phone_number', phoneNumber);
      await prefs.setString('id', newResponse['userId'].toString());

      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.bottomNavigationBar,
        (_) => false,
      );
    } else {
      myProvider.updateLoging(!myProvider.myLoging);
      AppSnackbar(
        isError: true,
        response: newResponse['message'],
      ).show(context);
    }
  }
}
