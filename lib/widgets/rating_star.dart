import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RatingStar extends StatelessWidget {
  int? ratingStar;
  RatingStar({
    Key? key,
    required this.ratingStar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < ratingStar!; i++) {
      stars += '⭐';
    }
    return Text(stars);
  }
}
