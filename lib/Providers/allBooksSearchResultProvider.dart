import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/models/book.dart';

class AllBooksSearchResultsProvider with ChangeNotifier
{
  static final AllBooksSearchResultsProvider _allBooksSearchResultsProvider = AllBooksSearchResultsProvider._internal();
   factory AllBooksSearchResultsProvider(){
    return _allBooksSearchResultsProvider;
   }
   AllBooksSearchResultsProvider._internal();


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
bool isLoading = false;
bool get getIsLoading =>isLoading;
 String searchString = "";
   String get getSearchString => searchString;

 bool isFirstRequest = true;
 bool get getIsFirstRequest =>isFirstRequest;

 bool isLoadingInAllBooksPage = false;
bool get getIsLoadingInAllBooksPage =>isLoadingInAllBooksPage;
int totalBooksCount =0;
int get getTotalBooksCount => totalBooksCount;


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
   void setIsLoading(bool newIsLoading){
    isLoading = newIsLoading;
    notifyListeners();
  }

  void setSearchString(String newSearchString){
    searchString = newSearchString;
    notifyListeners();
  }

  void setIsFirstRequest(bool newIsFirstRequest){
    isFirstRequest = newIsFirstRequest;
    notifyListeners();
  }

  void setIsLoadingInAllBooksPage(bool newIsLoading){
    isLoadingInAllBooksPage = newIsLoading;
    notifyListeners();
  }

  void setTotalBooksCount(int newTotalBooksCount){
    totalBooksCount = newTotalBooksCount;
    notifyListeners();
  }

}