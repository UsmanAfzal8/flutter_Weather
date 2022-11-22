import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({
    required this.onRatingUpdate,
    this.initialRating = 0,
    this.ignoreGestures = true,
    this.itemSize = 14,
    super.key,
  });
  final double itemSize;
  final double initialRating;
  final bool ignoreGestures;
  final void Function(double) onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize: itemSize,
      itemPadding: const EdgeInsets.symmetric(vertical: 4),
      initialRating: initialRating,
      allowHalfRating: true,
      ignoreGestures: ignoreGestures,
      glowColor: Theme.of(context).primaryColor,
      unratedColor: Theme.of(context).primaryColor,
      maxRating: 5,
      ratingWidget: RatingWidget(
        full: Icon(Icons.star, color: Theme.of(context).primaryColor),
        half: Icon(
          Icons.star_half,
          color: Theme.of(context).primaryColor.withOpacity(0.8),
        ),
        empty: Icon(
          Icons.star_border_outlined,
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      onRatingUpdate: (double value) => onRatingUpdate(value),
    );
  }
}
