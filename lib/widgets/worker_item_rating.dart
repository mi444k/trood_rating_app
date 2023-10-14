import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../models/worker.dart';

Widget workerListItemRating({required Map worker}) {
  return RatingBar.builder(
      initialRating: worker["rating"].toDouble() ?? 0.0,
      itemCount: 5,
      itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
      onRatingUpdate: (rating) {
        Worker w = Worker(name: worker["name"], idWorker: worker["idWorker"]);
        w.updateRating(rating);
      });
}
