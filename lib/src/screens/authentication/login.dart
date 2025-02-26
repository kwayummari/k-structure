import 'package:erp/src/provider/login-provider.dart';
import 'package:erp/src/utils/app_const.dart';
import 'package:erp/src/utils/routes/route-names.dart';
import 'package:erp/src/widgets/app_button.dart';
import 'package:erp/src/widgets/app_input_text.dart';
import 'package:erp/src/widgets/socialMedia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:erp/src/gateway/login-services.dart';
import 'package:erp/src/widgets/app_base_screen.dart';
import 'package:erp/src/widgets/app_text.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController phone_number = TextEditingController();
  TextEditingController password = TextEditingController();
  bool marked = false;
  bool dont_show_password = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final myProvider = Provider.of<MyProvider>(context);
    return AppBaseScreen(
      bgcolor: AppConst.white,
      isvisible: false,
      backgroundImage: false,
      backgroundAuth: false,
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Image.asset('assets/icon.png'),
              SizedBox(
                height: 45,
              ),
              AppInputText(
                textsColor: AppConst.black,
                textfieldcontroller: phone_number,
                ispassword: false,
                fillcolor: AppConst.white,
                label: 'Phone',
                obscure: false,
                icon: Icon(
                  Icons.phone_android,
                  color: AppConst.black,
                ),
                isemail: false,
                isPhone: true,
              ),
              AppInputText(
                textsColor: AppConst.black,
                isemail: false,
                textfieldcontroller: password,
                ispassword: dont_show_password,
                fillcolor: AppConst.white,
                label: 'Password',
                obscure: dont_show_password,
                icon: Icon(
                  Icons.lock,
                  color: AppConst.black,
                ),
                suffixicon: IconButton(
                    onPressed: () {
                      setState(() {
                        dont_show_password = !dont_show_password;
                      });
                    },
                    icon: Icon(dont_show_password
                        ? Icons.visibility_off
                        : Icons.visibility)),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 20),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AppText(
                    txt: 'Forgot password?',
                    size: 15,
                    color: AppConst.primary,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              myProvider.myLoging == true
                  ? SpinKitCircle(
                      color: AppConst.primary,
                    )
                  : Container(
                      width: 350,
                      height: 55,
                      child: AppButton(
                        onPress: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          loginService()
                              .login(context, phone_number.text, password.text);
                        },
                        label: 'LOGIN',
                        borderRadius: 5,
                        textColor: AppConst.white,
                        bcolor: AppConst.primary,
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              socialMedia(),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, RouteNames.registration),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: AppConst.grey),
                      ),
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          color: AppConst.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Divider(
                  color: AppConst.grey,
                ),
              ),
              AppText(
                txt:
                    'By continuing you agree to K Structure \n               Terms and Condition',
                size: 15,
                color: AppConst.primary,
              )
            ],
          )),
    );
  }
}
