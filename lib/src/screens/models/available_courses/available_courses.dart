import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kstructure/src/gateway/categories.dart';
import 'package:kstructure/src/utils/animations/shimmers/available_courses.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/utils/routes/route-names.dart';
import 'package:kstructure/src/widgets/app_button.dart';
import 'package:kstructure/src/widgets/app_text.dart';

class availableCourses extends StatefulWidget {
  const availableCourses({super.key});

  @override
  State<availableCourses> createState() => _availableCoursesState();
}

class _availableCoursesState extends State<availableCourses> {
  Map<String, dynamic>? data;

  void fetchData() async {
    categoriesServices CategoriesServices = categoriesServices();
    final datas = await CategoriesServices.getCategories(context);
    setState(() {
      data = datas;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return data == null
        ? availableCoursesShimmerLoad(
            width: 400,
            height: 200,
            borderRadius: 15,
          )
        : CarouselSlider(
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
              for (var i = 0; i < data!['categories'].length; i++)
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, RouteNames.getContentsByCategory,
                        arguments: {
                          'content_id': data!['categories'][i]['id'],
                          'title': data!['categories'][i]['title']
                        });
                  },
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          image: DecorationImage(
                            image: NetworkImage(
                                '${dotenv.env['IMAGE_SERVER']}${data!['categories'][i]['image']}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: const Color.fromARGB(255, 33, 58, 243)
                              .withOpacity(0.5),
                        ),
                      ),
                      Positioned(
                          top: 20,
                          left: 20,
                          child: AppText(
                            txt: data!['categories'][i]['title'],
                            color: Colors.white,
                            weight: FontWeight.w700,
                            size: 25,
                          )),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: AppButton(
                            onPress: () {
                              Navigator.pushNamed(
                                  context, RouteNames.getContentsByCategory,
                                  arguments: {
                                    'content_id': data!['categories'][i]['id'],
                                    'title': data!['categories'][i]['title']
                                  });
                            },
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
