// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:erp/src/functions/moneyFormatter.dart';
import 'package:erp/src/gateway/content-by-category-id.dart';
import 'package:erp/src/utils/app_const.dart';
import 'package:erp/src/utils/routes/route-names.dart';
import 'package:erp/src/widgets/app_base_screen.dart';
import 'package:erp/src/widgets/app_button.dart';
import 'package:erp/src/widgets/app_course_details.dart';
import 'package:erp/src/widgets/app_text.dart';

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
  bool isExpanded = false;

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
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, RouteNames.videoPlayer,
                                    arguments: {
                                      'id': widget.id,
                                      'title': widget.title,
                                      'url':
                                          '${dotenv.env['VIDEO_SERVER']}${contentDetails[0]['url']}'
                                    });
                              },
                              icon: Icon(
                                Icons.play_circle_outline,
                                size: 50,
                                color: Colors.white,
                              ),
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
                    height: 70,
                    color: AppConst.primary,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FutureBuilder<String>(
                            future:
                                formatPrice(contentDetails[0]['price'], 'Tzs'),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                      ConnectionState.waiting ||
                                  !snapshot.hasData) {
                                return CircularProgressIndicator();
                              } else {
                                return AppText(
                                  txt: snapshot.data ?? '',
                                  color: Colors.white,
                                  weight: FontWeight.w700,
                                  size: 20,
                                  softWrap: true,
                                );
                              }
                            },
                          ),
                          AppButton(
                              onPress: () => {
                                    if (contentDetails[0]['payment_status'] !=
                                        '1')
                                      {
                                        Navigator.pushNamed(
                                            context, RouteNames.payment,
                                            arguments: {
                                              'content_id': widget.id,
                                              'title': widget.title,
                                              'amount': contentDetails[0]['price']
                                            })
                                      }
                                  },
                              label: contentDetails[0]['payment_status'] != '1'
                                  ? 'PURCHASE'
                                  : 'PLAY COURSE',
                              borderRadius: 5,
                              textColor: AppConst.white,
                              bcolor: AppConst.red),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppText(
                    txt: 'This Course Includes',
                    size: 23,
                    color: AppConst.black,
                    weight: FontWeight.w900,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AppCourseDetails(
                      icon: Icon(
                        Icons.live_tv_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                      text: contentDetails[0]['hours'] +
                          ' hours on Demand- Tutorial'),
                  AppCourseDetails(
                      icon: Icon(
                        Icons.menu_book_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                      text: contentDetails[0]['assignment'] + ' Assignments'),
                  AppCourseDetails(
                      icon: Icon(
                        Icons.menu_book_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                      text: contentDetails[0]['assignment'] +
                          ' Downloadable sources'),
                  AppCourseDetails(
                      icon: Icon(
                        Icons.badge,
                        size: 30,
                        color: Colors.black,
                      ),
                      text: contentDetails[0]['certificate'] == '1'
                          ? ' Certification after completion'
                          : 'No available Certificate'),
                  SizedBox(
                    height: 20,
                  ),
                  AppText(
                    txt: 'What you will learn',
                    size: 23,
                    color: AppConst.black,
                    weight: FontWeight.w900,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          txt: isExpanded
                              ? contentDetails[0]['description']
                              : (contentDetails[0]['description'].length > 100
                                  ? contentDetails[0]['description']
                                          .substring(0, 100) +
                                      '...'
                                  : contentDetails[0]['description']),
                          size: 15,
                          weight: FontWeight.w600,
                          color: AppConst.black,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: AppText(
                            txt: isExpanded ? 'Read less' : 'Read more',
                            size: 15,
                            weight: FontWeight.w600,
                            color: AppConst.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ));
  }
}
