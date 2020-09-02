import 'package:exemplo5/base_utils.dart';
import 'package:exemplo5/models/category.model.dart';
import 'package:flutter/cupertino.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final int position;
  final Function(int) onTap;

  const CategoryItem({
    @required this.category,
    @required this.position,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onTap(position), Navigator.of(context).pop()},
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(category.iconLocation),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                category.name,
                style: TextStyle(fontSize: 24),
              ),
            )
          ],
        ),
      ),
    );
  }
}
