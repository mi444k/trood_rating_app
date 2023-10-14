import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Worker {
  final String name;
  final String idWorker;
  final String urlAvatar;
  final double rating;

  Worker({
    required this.name,
    String? idWorker,
    this.urlAvatar = "https://insightcafe.ru/images/avatar-noname.jpg",
    this.rating = 0.0,
  }) : idWorker = idWorker ?? uuid.v1();

  static Worker fromJson(Map<String, dynamic> json) => Worker(
        name: json["name"],
        idWorker: json["idWorker"],
        urlAvatar: json["urlAvatar"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "idWorker": idWorker,
        "urlAvatar": urlAvatar,
        "rating": rating,
      };

  Future<Worker?> save() async {
    DatabaseReference ref = FirebaseDatabase.instance.ref("workers/$idWorker");
    await ref.set({
      "name": name,
      "idWorker": idWorker,
      "urlAvatar": urlAvatar,
      "rating": rating,
    }).then((_) {
      return this;
    }).catchError((error) {
      debugPrint("Error saving $idWorker");
      return error;
    });
    return null;
  }

  Future<void> updateRating(double newRating) async {
    newRating = newRating < 0
        ? 0
        : newRating > 5
            ? 5
            : newRating;
    DatabaseReference ref = FirebaseDatabase.instance.ref("workers/$idWorker");
    await ref.update({"rating": newRating});
  }
}
