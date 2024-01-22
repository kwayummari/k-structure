import 'package:flutter/material.dart';
import 'package:kstructure/src/gateway/content-by-category-id.dart';

// ignore: must_be_immutable
class contentsByCategoryId extends StatefulWidget {
  var id;

  contentsByCategoryId({Key? key, required this.id}) : super(key: key);

  @override
  State<contentsByCategoryId> createState() => _contentsByCategoryIdState();
}

class _contentsByCategoryIdState extends State<contentsByCategoryId> {
  Map<String, dynamic>? data;

  void fetchData(id) async {
    contentsByCategoriesServices ContentsServices = contentsByCategoriesServices();
    final datas = await ContentsServices.getContents(context, id);
    setState(() {
      data = datas;
    });
    print(data);
  }

  @override
  void initState() {
    super.initState();
    fetchData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
