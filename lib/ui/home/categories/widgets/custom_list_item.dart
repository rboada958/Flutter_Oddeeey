import 'package:flutter/material.dart';
import 'package:flutter_social/ui/home/categories/models/categories.dart';
import 'package:flutter_social/utils/utils.dart';

class CustomListItem extends StatelessWidget {
  final Categories categories;

  CustomListItem(this.categories);

  _showToast(String name) {
    showToast(name, Colors.deepOrange, Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 100.0,
      decoration: BoxDecoration(
        color: Colors.orange,
        image: DecorationImage(
          image: NetworkImage(categories.image),
          fit: BoxFit.cover,
        ),
      ),
      child: GestureDetector(
        child: Center(
          child: Text(
            categories.name,
            style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        onTap: () {
          _showToast("Seleccionó: ${categories.name}");
        },
      ),
      margin: EdgeInsets.all(5.0),
    );
  }
}
