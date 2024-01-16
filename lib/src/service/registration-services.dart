import 'package:kstructure/src/api/apis.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/utils/routes/route-names.dart';
import 'package:kstructure/src/widgets/app_snackbar.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class registrationService {
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  Api api = Api();

  Future<void> registration(BuildContext context, String password,
      String rpassword, String fullname, String phone) async {
    if (password.toString() == rpassword.toString()) {
      Map<String, dynamic> data = {
        'fullname': fullname.toString(),
        'password': password.toString(),
        'phone': phone.toString(),
      };
      final response = await api.post(context, 'register_user', data);
      if (response.toString() == 'success') {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('id', response.body.id);
        Fluttertoast.showToast(
          msg: response.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: AppConst.primary,
          textColor: Colors.white,
          fontSize: 15.0,
        );
        // Navigator.pushNamed(context, RouteNames.login);
      } else {
        AppSnackbar(
          isError: true,
          response: response.toString(),
        ).show(context);
      }
    } else {
      AppSnackbar(
        isError: true,
        response: 'Passwords do not match!',
      ).show(context);
    }
  }
}
