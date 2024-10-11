import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/models/book.dart';

class SearchResultsProvider with ChangeNotifier{
  Book? selectedSearchResult = null;
  Book? get selectedSearchItem => selectedSearchResult;
  String allBooksSearchMode = "match_phrase";
  String get getAllBooksSearchMode => allBooksSearchMode;
bool? isAllBooksSearchResultsReceived = false;
bool? get getIsAllBooksSearchResultsReceived =>isAllBooksSearchResultsReceived;
int allBooksSearchResultsPagesCount = 0;
int get getAllBooksSearchResultsPagesCount => allBooksSearchResultsPagesCount;
int allBooksSearchResultsBooksCount = 0;
int get getAllBooksSearchResultsBooksCount => allBooksSearchResultsBooksCount;
List<Book>? allBooksSearchResult = [];
List<Book>? get getAllBooksSearchResult => allBooksSearchResult;


void setAllBooksSearchResultsReceived(bool allBooksSearchResultsReceived){
  isAllBooksSearchResultsReceived = allBooksSearchResultsReceived;
  notifyListeners();
}
  void setAllBooksSearchResultsPagesCount(int newPagesCount){
    allBooksSearchResultsPagesCount = newPagesCount;
    notifyListeners();
  }
  void setAllBooksSearchResultsBooksCount(int newBooksCount){
    allBooksSearchResultsBooksCount = newBooksCount;
    notifyListeners();
  }
  void setAllBooksSearchResult(List<Book>? newAllBooksSearchResult){
    allBooksSearchResult = newAllBooksSearchResult;
    notifyListeners();
  }

  void changeAllBooksSearchMode(String selectedAllBooksSearchMode){
    allBooksSearchMode = selectedAllBooksSearchMode;
    notifyListeners();

  }

  void selectSearchItem(Book? bookSearchItem){
    selectedSearchResult = bookSearchItem;
    notifyListeners();
  }

}