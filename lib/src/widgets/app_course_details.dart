import 'package:flutter/material.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/widgets/app_text.dart';

class AppCourseDetails extends StatelessWidget {
  final Icon icon;
  final String text;

  const AppCourseDetails(
      {Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
                    children: [
                      icon,
                      SizedBox(
                        width: 20,
                      ),
                      AppText(
                        txt: text,
                        size: 20,
                        weight: FontWeight.w600,
                        color: AppConst.black,
                      ),
                    ],
                  );
  }
}
