import 'package:flutter/material.dart';

Widget buildLoadMoreIndiactor() {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
