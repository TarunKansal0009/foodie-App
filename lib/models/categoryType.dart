import 'package:flutter/material.dart';

class CategoryType {
  final String id;
  final String title;
  final Color color;

  const CategoryType(
      {@required this.id, @required this.title, this.color = Colors.orange});
}
