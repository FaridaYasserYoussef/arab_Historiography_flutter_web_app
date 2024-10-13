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

void setSelectedIndex(int newSelectedIndex){
  selectedIndex = newSelectedIndex;
  notifyListeners();
}

void setNumOfPages(int newNumOfPages){
numOfPages = newNumOfPages;
notifyListeners();
}

}