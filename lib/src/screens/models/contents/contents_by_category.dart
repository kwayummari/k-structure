// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:kstructure/src/gateway/content-by-category-id.dart';

class contentsByCategoryId extends StatefulWidget {
  var id;

  contentsByCategoryId({Key? key, required this.id}) : super(key: key);

  @override
  State<contentsByCategoryId> createState() => _contentsByCategoryIdState();
}

class _contentsByCategoryIdState extends State<contentsByCategoryId> {
  Map<String, dynamic>? data;

  void fetchData() async {
    contentsByCategoriesServices ContentsServices = contentsByCategoriesServices();
    final datas = await ContentsServices.getContents(context, widget.id);
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
