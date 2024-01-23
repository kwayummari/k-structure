// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kstructure/src/gateway/content-by-category-id.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/widgets/app_base_screen.dart';
import 'package:kstructure/src/widgets/app_button.dart';
import 'package:kstructure/src/widgets/app_listview_builder.dart';
import 'package:kstructure/src/widgets/app_text.dart';

class contentsByCategoryId extends StatefulWidget {
  var id;
  var title;

  contentsByCategoryId({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  State<contentsByCategoryId> createState() => _contentsByCategoryIdState();
}

class _contentsByCategoryIdState extends State<contentsByCategoryId> {
  List data = [];

  void fetchData() async {
    contentsByCategoriesServices ContentsServices =
        contentsByCategoriesServices();
    final datas = await ContentsServices.getContents(context, widget.id);
    setState(() {
      data = datas['contents'];
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
      child: data.isEmpty
          ? CircularProgressIndicator()
          : AppListviewBuilder(
              itemnumber: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          image: DecorationImage(
                            image: NetworkImage(
                              '${dotenv.env['IMAGE_SERVER']}${data[index]['image']}',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Image.network(
                            '${dotenv.env['IMAGE_SERVER']}${data[index]['image']}'),
                      ),
                      Container(
                        child: Opacity(
                          opacity: 0.5,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              color: const Color.fromARGB(255, 33, 58, 243)
                                  .withOpacity(0.5),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 20,
                        left: 20,
                        child: AppText(
                          txt: data[index]['title'],
                          color: Colors.white,
                          weight: FontWeight.w700,
                          size: 25,
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 20,
                        child: AppButton(
                          onPress: () => null,
                          label: 'View',
                          borderRadius: 5,
                          textColor: AppConst.black,
                          bcolor: AppConst.white,
                        ),
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
