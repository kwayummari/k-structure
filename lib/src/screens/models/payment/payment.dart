// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/widgets/app_base_screen.dart';
import 'package:kstructure/src/widgets/app_text.dart';

class Payment extends StatefulWidget {
  var id;
  var title;

  Payment({Key? key, required this.id, required this.title}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // void fetchData() async {
  //   contentsByCategoriesServices ContentsServices =
  //       contentsByCategoriesServices();
  //   final details =
  //       await ContentsServices.getContentsDetails(context, widget.id);
  //   final contentVideos =
  //       await ContentsServices.getContentsVideos(context, widget.id);
  //   setState(() {
  //     contentDetails = details['details'] ?? [];
  //     videos = contentVideos['videos'] ?? [];
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        appBar: AppBar(
          title: AppText(
            txt: widget.title,
            size: 20,
            weight: FontWeight.w800,
          ),
          centerTitle: true,
        ),
        bgcolor: AppConst.white,
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: AppConst.black,
            ),
            SizedBox(
              height: 20,
            ),
            AppText(
              txt:
                  'You will be enrolled to this course after you successfully complete payment',
              size: 23,
              color: AppConst.black,
              weight: FontWeight.w600,
            ),
            SizedBox(
              height: 20,
            ),
            AppText(
              txt: 'Choose Payment',
              size: 23,
              color: AppConst.black,
              weight: FontWeight.w600,
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset('assets/mobiles.png'),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
