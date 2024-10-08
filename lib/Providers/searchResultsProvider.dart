import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/models/book.dart';

class SearchResultsProvider with ChangeNotifier{
  Book? selectedSearchResult = null;
  Book? get selectedSearchItem => selectedSearchResult;

  void selectSearchItem(Book? bookSearchItem){
    selectedSearchResult = bookSearchItem;
    notifyListeners();
  }

}