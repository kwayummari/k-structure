// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kstructure/src/gateway/content-by-category-id.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/widgets/app_base_screen.dart';
import 'package:kstructure/src/widgets/app_button.dart';
import 'package:kstructure/src/widgets/app_text.dart';

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
        await ContentsServices.getContentsVideos(context, widget.id);
    setState(() {
      contentDetails = details['details'] ?? [];
      videos = contentVideos['videos'] ?? [];
    });
    print(contentDetails);
    print(videos);
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
          title: AppText(
            txt: widget.title,
            size: 20,
            weight: FontWeight.bold,
          ),
          centerTitle: true,
        ),
        bgcolor: AppConst.white,
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
        child: contentDetails.isEmpty && videos.isEmpty
            ? CircularProgressIndicator()
            : Column(
                children: [
                  Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.6),
                          BlendMode.srcOver,
                        ),
                        child: Image.network(
                          '${dotenv.env['IMAGE_SERVER']}${contentDetails[0]['image']}',
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.play_circle_outline,
                              size: 50,
                              color: Colors.white,
                            ),
                            SizedBox(height: 10),
                            AppText(
                              txt: widget.title,
                              size: 18,
                              color: AppConst.white,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    color: AppConst.primary,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        AppText(
                              txt: contentDetails[0]['price'],
                              size: 18,
                              color: AppConst.white,
                            ),
                            AppButton(onPress: () => null, label: 'PURCHASE', borderRadius: 5, textColor: AppConst.white, bcolor: AppConst.red)
                      ],
                    ),
                  )
                ],
              ));
  }
}
