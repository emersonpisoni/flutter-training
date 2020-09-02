import 'dart:convert';

import 'package:exemplo5/models/category.model.dart';
import 'package:exemplo5/models/unit.model.dart';
import 'package:flutter/material.dart';

import '../base_utils.dart';

class Api {
  static Future<List<Category>> retrieveLocalCategories(
      BuildContext context) async {
    final String json = await DefaultAssetBundle.of(context)
        .loadString('assets/data/regular_units.json');

    final dynamic data = JsonDecoder().convert(json);

    if (data is! Map) {
      throw ('não é um map');
    }

    List<Category> categories = [];
    int categoryIndex = 0;

    data.keys.forEach((key) {
      final List<Unit> units =
          data[key].map<Unit>((dynamic data) => Unit.fromJson(data)).toList();

      Category category = Category(
        name: key,
        units: units,
        color: BaseUtils.baseColors[categoryIndex],
        iconLocation: BaseUtils.icons[categoryIndex],
      );

      categoryIndex++;
      categories.add(category);
    });
    return categories;
  }
}
