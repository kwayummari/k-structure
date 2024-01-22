import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:kstructure/src/utils/app_const.dart';
import 'package:kstructure/src/widgets/app_text.dart';

class topSearch extends StatefulWidget {
  const topSearch({super.key});

  @override
  State<topSearch> createState() => _topSearchState();
}

class _topSearchState extends State<topSearch> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 207,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                AppText(
                  txt: 'Top Search',
                  size: 15,
                  color: AppConst.white,
                  weight: FontWeight.w700,
                ),
                Spacer(),
                AppText(
                  txt: 'View All',
                  size: 15,
                  color: AppConst.white,
                  weight: FontWeight.w700,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppConst.white,
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: InkWell(
                    onTap: () => null,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Container(
                            height: 125.0,
                            width: MediaQuery.of(context).size.width / 2.4,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              border: Border.all(color: Colors.black),
                              image: DecorationImage(
                                image: AssetImage('assets/4.jpg'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          ),
                        ),
                        Text(
                          'Engineering',
                          style: TextStyle(overflow: TextOverflow.ellipsis),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                size: 15,
                                txt: 'Read More',
                                color: HexColor('#800B24'),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: HexColor('#800B24'),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
