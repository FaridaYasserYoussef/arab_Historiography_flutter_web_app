import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/API/api_connections.dart';
import 'package:trial_flutter_web_app/Providers/allBooksSearchResultProvider.dart';
import 'package:trial_flutter_web_app/Providers/searchPaginationProvider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:http/http.dart' as http;


class SearchAPIService{

   static final SearchAPIService _searchAPIService = SearchAPIService._internal();
   factory SearchAPIService(){
    return _searchAPIService;
   }
   SearchAPIService._internal();

    Future<List<Book>> getAllBooksSearchResults(BuildContext context) async{
    List<Book> _searchResults = [];
    var provider = AllBooksSearchResultsProvider();
    var paginationProvider = SearchPaginationProvider();
    int from  = (paginationProvider.getSelectedIndex - 1) * 10;
    provider.setAllBooksSearchResult([]);
    print("from is $from and first request is ${provider.getIsFirstRequest}");
    if(from == 0 && provider.getIsFirstRequest == true){
    provider.setIsLoading(true);
    }
    else{
      provider.setIsLoadingInAllBooksPage(true);
    }
    
    // setState(() {
    //   allBooksSearchResults = [];
    //   isLoading = true;
    // });
    
    var res = await http.post(
      Uri.parse(API.allBooksSearch),
      body: {
        "isFirstRequest": provider.getIsFirstRequest == true ? "true": "false",
        "from": from.toString(),
        "searchString": provider.getSearchString,
        "searchType": provider.getAllBooksSearchMode
      }
    );

    if(res.statusCode == 200){
      var data = jsonDecode(res.body);
      if(from == 0 && provider.getIsFirstRequest == true){
         int allBooksSearchResultsPagesCount = int.parse(data["pages_count"].toString());
      provider.setAllBooksSearchResultsPagesCount(allBooksSearchResultsPagesCount);
      int allBooksSearchResultsBooksCount = int.parse(data["books_count"].toString());
      provider.setAllBooksSearchResultsBooksCount(allBooksSearchResultsBooksCount);
      paginationProvider.setNumOfPages((allBooksSearchResultsBooksCount/10).ceil());

      }
      List<Map<String, dynamic>> fetchedBooks = (data['results'] as List<dynamic>)
        .map((item) => item as Map<String, dynamic>)
        .toList();
        // print(fetchedBooks);
      for (var bookObject in fetchedBooks){
        _searchResults.add(Book.fromSearchResultJson(bookObject));
      }
     
  // setState(() {
  //   allBooksSearchResults = _searchResults;
  //   isLoading = false;
  // });

    provider.setAllBooksSearchResult(_searchResults);
    provider.setIsLoading(false);
    provider.setIsLoadingInAllBooksPage(false);
    provider.setAllBooksSearchResultsReceived(true);
    provider.setIsFirstRequest(false);

    }
    return _searchResults;

  }

  Future<List<Book>> getBookSearchItems(BuildContext context) async{
    List<Book> _searchResults = [];
    var provider = SingleBookSearchResultProvider();
    // setState(() {
    //   searchResults = [];
    //   isLoading = true;
    // });
    provider.setSearchResults([]);
    provider.setIsLoading(true);
    
    var res = await http.post(
      Uri.parse(API.searchBooksByName),
      body: {
        "book_title": provider.getBookTitle
      }
    );
    

    if(res.statusCode == 200){
      var data = jsonDecode(res.body);
      List<Map<String, dynamic>> fetchedBooks = (data['book_objects'] as List<dynamic>)
        .map((item) => item as Map<String, dynamic>)
        .toList();
        // print(fetchedBooks);
      for (var bookObject in fetchedBooks){
        _searchResults.add(Book.fromSearchResultJson(bookObject));
      }
     
  // setState(() {
  //   searchResults = _searchResults;
  //   isLoading = false;
  // });
   provider.setSearchResults(_searchResults);
    provider.setIsLoading(false);

    }
   
   return _searchResults;

  }

}