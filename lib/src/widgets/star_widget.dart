import 'package:flutter/material.dart';

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
          color: Colors.amber,
          size: 24,
        ),
      ),
    );
  }
}
