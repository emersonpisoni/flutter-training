import 'package:exemplo5/models/category.model.dart';
import 'package:exemplo5/ui/category.item.dart';
import 'package:flutter/material.dart';

class CategoryDrawer extends StatefulWidget {
  final List<Category> categories;
  final Color backgroundColor;
  final Function(int) onTap;

  const CategoryDrawer({this.categories, this.backgroundColor, this.onTap});

  @override
  _CategoryDrawerState createState() => _CategoryDrawerState();
}

class _CategoryDrawerState extends State<CategoryDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: widget.backgroundColor,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          Category category = widget.categories[index];
          return CategoryItem(
            category: category,
            position: index,
            onTap: widget.onTap,
          );
        },
        itemCount: widget.categories.length,
      ),
    ));
  }
}
