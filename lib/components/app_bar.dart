import 'package:flutter/material.dart';

AppBar appBar(BuildContext context, String title) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    titleTextStyle: const TextStyle(fontSize: 26, color: Colors.white),
    title: Text(title),
    iconTheme: const IconThemeData(color: Colors.white),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(15),
      ),
    ),
  );
}
