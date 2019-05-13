import 'package:flutter_social/ui/home/categories/api/api.dart';
import 'package:flutter_social/ui/home/categories/models/response_categories.dart';

class RepositoryCategories {
  final apiProvider = API();

  Future<ResponseCategories> getCategories(token) =>
      apiProvider.getCategories(token);
}
