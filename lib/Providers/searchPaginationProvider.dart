import 'package:flutter/material.dart';

class SearchPaginationProvider with ChangeNotifier{

static final SearchPaginationProvider _searchPaginationProvider = SearchPaginationProvider._internal();
   factory SearchPaginationProvider(){
    return _searchPaginationProvider;
   }
   SearchPaginationProvider._internal();

int selectedIndex = 1;
int get getSelectedIndex => selectedIndex;
int numOfPages = 0;
int get getNumOfPages => numOfPages;
String scroll_id = "";
String get get_scroll_id => scroll_id;

bool isAllBooksCountLoading = false;
bool get getIsAllBooksCountLoading => isAllBooksCountLoading;

bool receiveAllBooksCount = true;

bool get getReceiveAllBooksCount => receiveAllBooksCount;

void setSelectedIndex(int newSelectedIndex){
  selectedIndex = newSelectedIndex;
  notifyListeners();
}

void setNumOfPages(int newNumOfPages){
numOfPages = newNumOfPages;
notifyListeners();
}
void setScrollId(String newScrollId){
  scroll_id = scroll_id;
  notifyListeners();
}

void setIsAllBooksCountLoading(bool newIsAllBooksCountLoading){
  isAllBooksCountLoading = newIsAllBooksCountLoading;
  notifyListeners();
}
void setReceiveAllBooksCount(bool newReceiveAllBooksCount){
  receiveAllBooksCount = newReceiveAllBooksCount;
  notifyListeners();
}

}