import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kstructure/src/service/categories.dart';
import 'package:kstructure/src/utils/animations/shimmers/available_courses.dart';
import 'package:kstructure/src/utils/app_const.dart';
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
    print(data);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
