import 'package:flutter_social/ui/home/categories/models/response_categories.dart';
import 'package:flutter_social/ui/home/categories/repository/repository_categories.dart';
import 'package:rxdart/rxdart.dart';

class CategoriesBloc {
  final _repository = RepositoryCategories();
  final _getCategories = PublishSubject<ResponseCategories>();

  Observable<ResponseCategories> get categories => _getCategories.stream;

  getCategories(token) async {
    ResponseCategories categories = await _repository.getCategories(token);
    _getCategories.sink.add(categories);
  }

  dispose() {
    _getCategories.close();
  }
}

final categoriesBloc = CategoriesBloc();
