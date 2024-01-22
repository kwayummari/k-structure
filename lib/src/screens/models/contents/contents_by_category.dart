import 'package:flutter/material.dart';
import 'package:kstructure/src/gateway/content-by-category-id.dart';

// ignore: must_be_immutable
class contentsById extends StatefulWidget {
  var id;

  contentsById({Key? key, required this.id}) : super(key: key);

  @override
  State<contentsById> createState() => _contentsByIdState();
}

class _contentsByIdState extends State<contentsById> {
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
