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
      BuildContext context, String email, String password) async {
    final myProvider = Provider.of<MyProvider>(context, listen: false);
    Provider.of<MyProvider>(context, listen: false)
        .updateLoging(!myProvider.myLoging);
    Map<String, dynamic> data = {
      'email': email.toString(),
      'password': password.toString(),
    };
    final response = await api.post(context, 'login', data);

    if (response.statusCode == '200') {
      AppSnackbar(
        isError: false,
        response: response.body.message,
      ).show(context);
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('email', email);
        await prefs.setString('id', response.body.id.toString());
        // Navigator.pushNamedAndRemoveUntil(
        //     context, RouteNames.bottomNavigationBar, (_) => false);
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
