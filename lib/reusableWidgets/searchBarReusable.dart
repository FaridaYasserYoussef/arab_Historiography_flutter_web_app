import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/api_connections.dart';
import 'package:trial_flutter_web_app/enums/search_type.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:http/http.dart' as http;

// typedef searchCallback = Future<void> Function(List<Book>, TextEditingController);

class SearchBarReusable extends StatefulWidget {
SearchType searchType;
 SearchBarReusable({
  required this.searchType
 });

  @override
  State<SearchBarReusable> createState() => _SearchBarReusableState();
}

class _SearchBarReusableState extends State<SearchBarReusable> {
  List<Book> searchResults = [];
  List<Book> allBooksSearchResults = [];

  bool searchBarFocus = false;
  bool isLoading = false;
  int allBooksSearchResultsPagesCount = 0;
int allBooksSearchResultsBooksCount = 0;
  TextEditingController searchController = TextEditingController();

  Future<List<Book>> getAllBooksSearchResults(String searchMode) async{
    List<Book> _searchResults = [];
    setState(() {
      allBooksSearchResults = [];
      isLoading = true;
    });
    var res = await http.post(
      Uri.parse(API.allBooksSearch),
      body: {
        "searchString": searchController.text,
        "searchType": searchMode
      }
    );

    if(res.statusCode == 200){
      var data = jsonDecode(res.body);
      allBooksSearchResultsPagesCount = int.parse(data["pages_count"].toString());
      allBooksSearchResultsBooksCount = int.parse(data["books_count"].toString());
      List<Map<String, dynamic>> fetchedBooks = (data['results'] as List<dynamic>)
        .map((item) => item as Map<String, dynamic>)
        .toList();
        // print(fetchedBooks);
      for (var bookObject in fetchedBooks){
        _searchResults.add(Book.fromSearchResultJson(bookObject));
      }
     
  setState(() {
    allBooksSearchResults = _searchResults;
    isLoading = false;
  });
    }
    return allBooksSearchResults;

  }

  Future<List<Book>> getBookSearchItems() async{
    List<Book> _searchResults = [];
    setState(() {
      searchResults = [];
      isLoading = true;
    });
    
    var res = await http.post(
      Uri.parse(API.searchBooksByName),
      body: {
        "book_title": searchController.text
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
     
  setState(() {
    searchResults = _searchResults;
    isLoading = false;
  });
    }
   
   return _searchResults;

  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchResultsProvider>(context);
    return Container(
                      child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Column(
                                children: [
                                    TapRegion(
                                      onTapOutside: (event) {
                      setState(() {
                        searchBarFocus = false;
                        if(searchController.text.isEmpty){
                        searchResults = [];

                        }
                      });
                    
                                      },
                                      child: Column(
                                      
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // SizedBox(width: MediaQuery.of(context).size.width *0.25,),
                            Flexible(
                              child: Padding(
                                padding: widget.searchType == SearchType.AllBooksSearch?  EdgeInsets.only(right: MediaQuery.of(context).size.width *0.20,
                                left: MediaQuery.of(context).size.width *0.08,
                                ): EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.25),
                                child: SearchBar(
                                  onChanged: (value) async {
                                    if(widget.searchType == SearchType.SingleBookSearch){
                                    await getBookSearchItems();
                                    }
                                   
                                  },
                                    onTap: () {
                                      setState(() {
                                      searchBarFocus = true;
                                    });
                                    },
                    
                    
                                  controller: searchController,
                                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(100, 255, 255, 255)),
                                  trailing: [
                                    IconButton(onPressed: () async{
                                      if(widget.searchType == SearchType.AllBooksSearch){
                                        await getAllBooksSearchResults(provider.getAllBooksSearchMode);
                                        provider.setAllBooksSearchResultsPagesCount(allBooksSearchResultsPagesCount);
                                        provider.setAllBooksSearchResultsBooksCount(allBooksSearchResultsBooksCount);
                                        provider.setAllBooksSearchResult(allBooksSearchResults);
                                        provider.setAllBooksSearchResultsReceived(true);


                                      }

                                    }, icon: Icon(Icons.search))
                                  ]),
                              ),
                            ),
                            // SizedBox(width: MediaQuery.of(context).size.width *0.25,),
                    
                          ],
                        ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    
                 widget.searchType == SearchType.SingleBookSearch? Row(
                      children: [
                        // SizedBox(width: MediaQuery.of(context).size.width * 0.26),
                        Expanded(
                          child:  isLoading == true? const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Center(child: CircularProgressIndicator(color: Colors.white,),),
                   ) : Visibility(
                            visible: searchResults.isNotEmpty && searchBarFocus ? true: false,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.26),
                              child: Container(
                                color: const Color.fromARGB(100, 0,0,0),
                                height: MediaQuery.of(context).size.height * 0.37, // You can adjust this height as needed
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => const Divider(height: 3, color: Colors.white,),
                                  itemBuilder: (context, index) {
                                      return Padding(
                      padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
                      child: GestureDetector(
                        onTap: () {
                          provider.selectSearchItem(searchResults[index]);
                          setState(() {
                            searchBarFocus = false;
                            
                          });
                          // print("search Result you clicked on is ${searchResults[index]}");
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> BookDetailsScreen(bookModel: searchResults[index])));

                          
                        },
                        child: ListTile(
                          title: Text(searchResults[index].title ?? 'nan', style: const TextStyle(color: Colors.white),),
                          leading: searchResults[index].imagePath == null? const Icon(Icons.book) :  Image(image: NetworkImage(API.hostConnectMedia + searchResults[index].imagePath!)),
                        ),
                      ),
                                      );
                                  },
                                  itemCount: searchResults.length,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(width: MediaQuery.of(context).size.width * 0.26),
                      ],
                    ) : isLoading == true?  Padding(
                     padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width *0.10,
                    //  top: MediaQuery.of(context).size.height *0.10
                     ),
                     child: Center(child: CircularProgressIndicator(color: Colors.white,),),
                   ) : Container()
                    
                    
                    
                      ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                    );
  }
}