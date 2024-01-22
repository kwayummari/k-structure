import 'package:flutter/material.dart';
import 'package:kstructure/src/gateway/categories.dart';

class contentsById extends StatefulWidget {
  const contentsById({super.key});

  @override
  State<contentsById> createState() => _contentsByIdState();
}

class _contentsByIdState extends State<contentsById> {
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
