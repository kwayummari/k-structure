// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kstructure/src/gateway/content-by-category-id.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/widgets/app_base_screen.dart';
import 'package:kstructure/src/widgets/app_listview_builder.dart';
import 'package:kstructure/src/widgets/app_text.dart';
import 'package:kstructure/src/widgets/star_widget.dart';

class contentsById extends StatefulWidget {
  var id;
  var title;

  contentsById({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<contentsById> createState() => _contentsByIdState();
}

class _contentsByIdState extends State<contentsById> {
  List contentDetails = [];
  List videos = [];

  void fetchData() async {
    contentsByCategoriesServices ContentsServices =
        contentsByCategoriesServices();
    final details =
        await ContentsServices.getContentsDetails(context, widget.id);
    final contentVideos =
        await ContentsServices.getContentsDetails(context, widget.id);
    setState(() {
      contentDetails = details['details'];
      videos = contentVideos['videos'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        appBar: AppBar(
          title: AppText(txt: widget.title, size: 18),
          centerTitle: true,
        ),
        bgcolor: AppConst.white,
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        child: contentDetails.isEmpty || videos.isEmpty
            ? CircularProgressIndicator()
            : CircularProgressIndicator());
  }
}
