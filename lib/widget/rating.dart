import 'package:flutter/material.dart';
import 'package:flutter_trainee_test/model/product/rating.dart';

class Rating extends StatelessWidget {
  final RatingModel rating;

  const Rating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        rating.count.toString(),
      ),
    );
  }
}
