import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trial_flutter_web_app/models/book.dart';

class SingleBookSearchResultProvider with ChangeNotifier{

static final SingleBookSearchResultProvider _singleBookSearchResultProvider = SingleBookSearchResultProvider._internal();
   factory SingleBookSearchResultProvider(){
    return _singleBookSearchResultProvider;
   }
   SingleBookSearchResultProvider._internal();

  Book? selectedSearchResult = null;
  Book? get selectedSearchItem => selectedSearchResult;
   List<Book> searchResults = [];
   List<Book> get getSearchResults => searchResults;
   bool isLoading = false;
   bool get getIsLoading =>isLoading;
   String bookTitle = "";
   String get getBookTitle => bookTitle;

  void selectSearchItem(Book? bookSearchItem){
    selectedSearchResult = bookSearchItem;
    notifyListeners();
  }

  void setSearchResults(List<Book> newSearchResults){
    searchResults = newSearchResults;
    notifyListeners();
  }
  void setIsLoading(bool newIsLoading){
    isLoading = newIsLoading;
    notifyListeners();
  }

  void setBookTitle(String newBookTitle){
    bookTitle = newBookTitle;
    notifyListeners();
  }

}