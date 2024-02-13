import 'package:flutter/material.dart';
import 'package:kstructure/src/utils/app_const.dart';

class StarRating extends StatelessWidget {
  final int numberOfStars;

  StarRating({required this.numberOfStars});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        numberOfStars,
        (index) => Icon(
          Icons.star,
          color: AppConst.white,
          size: 24,
        ),
      ),
    );
  }
}
