import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/widgets/app_button.dart';
import 'package:kstructure/src/widgets/app_text.dart';

class availableCourses extends StatefulWidget {
  const availableCourses({super.key});

  @override
  State<availableCourses> createState() => _availableCoursesState();
}

class _availableCoursesState extends State<availableCourses> {
  List datas = ['Engineering', 'Engineering'];
  List photos = ['assets/4.jpg', 'assets/5.jpg'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: Platform.isIOS ? 200 : 170,
        aspectRatio: 16 / 9,
        viewportFraction: 0.9,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 8),
        autoPlayAnimationDuration: Duration(seconds: 5),
        autoPlayCurve: Curves.linear,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
      items: <Widget>[
        for (var i = 0; i < photos.length; i++)
          InkWell(
            onTap: () {},
            child: Container(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(51, 43, 144, 0.698),
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: AppText(
                        txt: datas[i].toString(),
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      width: 100,
                      child: AppButton(
                          onPress: () => null,
                          label: 'View',
                          borderRadius: 5,
                          textColor: AppConst.black,
                          bcolor: AppConst.white),
                    ),
                  ),
                ],
              ),
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                  image: AssetImage(photos[i]),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(131, 9, 17, 107).withOpacity(0.4),
                      BlendMode.srcOver),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
