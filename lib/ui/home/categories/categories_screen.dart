import 'package:flutter/material.dart';
import 'package:flutter_social/ui/home/categories/blocs/categories_bloc.dart';
import 'package:flutter_social/ui/home/categories/models/response_categories.dart';
import 'package:flutter_social/ui/home/categories/widgets/custom_list_item.dart';
import 'package:flutter_social/utils/utils.dart';

// ignore: must_be_immutable
class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String token;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.token = "Bearer " + preferences.getApiToken();
      print("Token in the categories: ${this.token}");
      categoriesBloc.getCategories(this.token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text("Categories"),
      ),
      body: StreamBuilder<ResponseCategories>(
        stream: categoriesBloc.categories,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ResponseCategories> snapshot) {
    return ListView.builder(
      itemCount: snapshot.data.data.length,
      itemBuilder: (context, index) {
        return CustomListItem(snapshot.data.data[index]);
      },
    );
  }
}
