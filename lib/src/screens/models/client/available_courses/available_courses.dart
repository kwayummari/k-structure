import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kstructure/src/service/categories.dart';
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
  Map<String, dynamic> data = {};

  void fetchData() async {
    categoriesServices CategoriesServices = categoriesServices();
    Map<String, dynamic> decodedResponse =
        await CategoriesServices.getCategories(context);
    print(decodedResponse);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
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
          GestureDetector(
            onTap: () => null,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    image: DecorationImage(
                      image: AssetImage(photos[i]),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color:
                        const Color.fromARGB(255, 33, 58, 243).withOpacity(0.5),
                  ),
                ),
                Positioned(
                    top: 20,
                    left: 20,
                    child: AppText(
                      txt: datas[i].toString(),
                      color: Colors.white,
                      weight: FontWeight.w700,
                      size: 25,
                    )),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: AppButton(
                      onPress: () => null,
                      label: 'View',
                      borderRadius: 5,
                      textColor: AppConst.black,
                      bcolor: AppConst.white),
                )
              ],
            ),
          )
      ],
    );
  }
}
