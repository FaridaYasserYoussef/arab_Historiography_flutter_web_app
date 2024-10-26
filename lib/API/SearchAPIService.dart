import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/API/api_connections.dart';
import 'package:trial_flutter_web_app/Providers/allBooksSearchResultProvider.dart';
import 'package:trial_flutter_web_app/Providers/requestTokensProvider.dart';
import 'package:trial_flutter_web_app/Providers/searchPaginationProvider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:http/http.dart' as http;
import 'dart:math';



class SearchAPIService{

   static final SearchAPIService _searchAPIService = SearchAPIService._internal();
   factory SearchAPIService(){
    return _searchAPIService;
   }
   SearchAPIService._internal();

   Future<void> getAllBooksCount()async {
    var requestProvider = RequestTokenProvider();
    var paginationProvider = SearchPaginationProvider();
    var provider = AllBooksSearchResultsProvider();
    int from  = (paginationProvider.getSelectedIndex - 1) * 10;


    if(paginationProvider.getIsAllBooksCountLoading == false){
      requestProvider.setCurrentTotalBooksCancelToken(generateRandomString(10));
      paginationProvider.setIsAllBooksCountLoading(true);

    }else if(paginationProvider.getIsAllBooksCountLoading == true){
      paginationProvider.setReceiveAllBooksCount(false);
      paginationProvider.setIsAllBooksCountLoading(false);
      // requestProvider.setPreviousTotalBooksCancelToken(requestProvider.getCurrentTotalBooksCancelToken);
      requestProvider.setCurrentTotalBooksCancelToken(generateRandomString(10));

    }
      var res = await http.post(
      Uri.parse(API.getAllBooksCount),
      body: {
        "isFirstRequest": provider.getIsFirstRequest == true ? "true": "false",
        "from": from.toString(),
        "searchString": provider.getSearchString,
        "searchType": provider.getAllBooksSearchMode,
        "getAllBooksCount": "true",
        "cancelToken": requestProvider.getCurrentTotalBooksCancelToken
      }
    );

    if(res.statusCode == 200){
      var data = jsonDecode(res.body);
      if(data["cancelToken"] == requestProvider.getPreviousTotalBooksCancelToken){
        return;
      }else{
      paginationProvider.setIsAllBooksCountLoading(false);
      provider.setTotalBooksCount(data["allBooksCount"]);
      return;

      }

    }

   }


       Future<List<Book>> getAllBooksSearchResultsScroll() async{
    var requestProvider = RequestTokenProvider();
    List<Book> _searchResults = [];
    var provider = AllBooksSearchResultsProvider();
    var paginationProvider = SearchPaginationProvider();
  
    provider.setAllBooksSearchResult([]);
    print("first request is ${provider.getIsFirstRequest}");
    if(provider.getIsFirstRequest == true){
        provider.setTotalBooksCount(0);
        if(paginationProvider.getIsAllBooksCountLoading){
      paginationProvider.setIsAllBooksCountLoading(false);
      requestProvider.setPreviousTotalBooksCancelToken(requestProvider.getCurrentTotalBooksCancelToken);

    }
    provider.setIsLoading(true);
    }
    else{
      provider.setIsLoadingInAllBooksPage(true);
    }
    
  DateTime startTime = DateTime.now();
  print("Request started at: $startTime");

    var res = await http.post(
      Uri.parse(API.allBooksSearchScroll),
      body: {
        "isFirstRequest": provider.getIsFirstRequest == true ? "true": "false",
        "searchString": provider.getSearchString,
        "searchType": provider.getAllBooksSearchMode,
        "getAllBooksCount": "false",
        "scroll_id": paginationProvider.get_scroll_id
      }
    );

    if(res.statusCode == 200){
      var data = jsonDecode(res.body);
      if(provider.getIsFirstRequest == true){
         int allBooksSearchResultsPagesCount = int.parse(data["pages_count"].toString());
      paginationProvider.setScrollId(data["scroll_id"].toString());
      provider.setAllBooksSearchResultsPagesCount(allBooksSearchResultsPagesCount);
      int allBooksSearchResultsBooksCount = int.parse(data["books_count"].toString());
      provider.setAllBooksSearchResultsBooksCount(allBooksSearchResultsBooksCount);
      paginationProvider.setNumOfPages((allBooksSearchResultsPagesCount/10).ceil());

      }
      List<Map<String, dynamic>> fetchedBooks = (data['results'] as List<dynamic>)
        .map((item) => item as Map<String, dynamic>)
        .toList();
      for (var bookObject in fetchedBooks){
        _searchResults.add(Book.fromSearchResultJson(bookObject));
      }
     

    provider.setAllBooksSearchResult(_searchResults);
    provider.setIsLoading(false);
    provider.setIsLoadingInAllBooksPage(false);
    provider.setAllBooksSearchResultsReceived(true);
    provider.setIsFirstRequest(false);

    }

      DateTime endTime = DateTime.now();
  print("Request received at: $endTime");

  // Calculate and print the elapsed time
  Duration elapsedTime = endTime.difference(startTime);
  print("Time elapsed: ${elapsedTime.inMilliseconds} ms");

    return _searchResults;

  }


    Future<List<Book>> getAllBooksSearchResults() async{
    var requestProvider = RequestTokenProvider();
    List<Book> _searchResults = [];
    var provider = AllBooksSearchResultsProvider();
    var paginationProvider = SearchPaginationProvider();
  
    int from  = (paginationProvider.getSelectedIndex - 1) * 10;
    provider.setAllBooksSearchResult([]);
    print("from is $from and first request is ${provider.getIsFirstRequest}");
    if(from == 0 && provider.getIsFirstRequest == true){
        provider.setTotalBooksCount(0);
        if(paginationProvider.getIsAllBooksCountLoading){
      paginationProvider.setIsAllBooksCountLoading(false);
      requestProvider.setPreviousTotalBooksCancelToken(requestProvider.getCurrentTotalBooksCancelToken);

    }
    provider.setIsLoading(true);
    }
    else{
      provider.setIsLoadingInAllBooksPage(true);
    }
    

    // setState(() {
    //   allBooksSearchResults = [];
    //   isLoading = true;
    // });
    
  DateTime startTime = DateTime.now();
  print("Request started at: $startTime");

    var res = await http.post(
      Uri.parse(API.allBooksSearch),
      body: {
        "isFirstRequest": provider.getIsFirstRequest == true ? "true": "false",
        "from": from.toString(),
        "searchString": provider.getSearchString,
        "searchType": provider.getAllBooksSearchMode,
        "getAllBooksCount": "false",
        // "cancelToken": requestProvider.getCurrentTotalBooksCancelToken
        // "scroll_id": paginationProvider.get_scroll_id
      }
    );

    if(res.statusCode == 200){
      var data = jsonDecode(res.body);
      // if(getAllBooksCount == true){ // also check if receive all books count flag is true
      // if(paginationProvider.getReceiveAllBooksCount== false){
      //     print("el total el 2adeem geh w mayenfa3sh 2a5do w howa ${data["allBooksCount"]}");
      //     paginationProvider.setReceiveAllBooksCount(true);
      //     provider.setTotalBooksCount(0);
      //     return [];
      // }else{
      //   print("all books total is ${data["allBooksCount"]}");
      //   provider.setTotalBooksCount(int.parse(data["allBooksCount"].toString()));
      //   paginationProvider.setIsAllBooksCountLoading(false);
      //   return [];
      // }
      // }
      if(from == 0 && provider.getIsFirstRequest == true){
         int allBooksSearchResultsPagesCount = int.parse(data["pages_count"].toString());
      paginationProvider.setScrollId(data["scroll_id"].toString());
      provider.setAllBooksSearchResultsPagesCount(allBooksSearchResultsPagesCount);
      int allBooksSearchResultsBooksCount = int.parse(data["books_count"].toString());
      provider.setAllBooksSearchResultsBooksCount(allBooksSearchResultsBooksCount);
      paginationProvider.setNumOfPages((allBooksSearchResultsPagesCount/10).ceil());

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

      DateTime endTime = DateTime.now();
  // print("Request received at: $endTime");

  // Calculate and print the elapsed time
  Duration elapsedTime = endTime.difference(startTime);
  print("Time elapsed: ${elapsedTime.inMilliseconds} ms");

    return _searchResults;

  }

  String generateRandomString(int length) {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  Random random = Random();

  return String.fromCharCodes(
    Iterable.generate(
      length,
      (_) => characters.codeUnitAt(random.nextInt(characters.length)),
    ),
  );
}



  Future<List<Book>> getBookSearchItems() async{
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