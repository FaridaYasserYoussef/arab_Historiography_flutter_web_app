import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/API/SearchAPIService.dart';
import 'package:trial_flutter_web_app/Providers/allBooksSearchResultProvider.dart';
import 'package:trial_flutter_web_app/Providers/searchPaginationProvider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/API/api_connections.dart';
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
  // List<Book> searchResults = [];
  // List<Book> allBooksSearchResults = [];

  bool searchBarFocus = false;
//   bool isLoading = false;
//   int allBooksSearchResultsPagesCount = 0;
// int allBooksSearchResultsBooksCount = 0;
  TextEditingController searchController = TextEditingController();
  SearchAPIService searchService = SearchAPIService();


  @override
  Widget build(BuildContext context) {
    var providerAllBooksSearch = Provider.of<AllBooksSearchResultsProvider>(context);
    var providerSingleBookSearch = Provider.of<SingleBookSearchResultProvider>(context);
    var providerPagination = Provider.of<SearchPaginationProvider>(context);
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
                        // searchResults = [];
                        providerSingleBookSearch.setSearchResults([]);

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
                                      providerSingleBookSearch.setBookTitle(searchController.text);
                                    await searchService.getBookSearchItems();
                                    }
                                    else if(widget.searchType ==  SearchType.AllBooksSearch){
                                      // providerAllBooksSearch.setSearchString(searchController.text);
                                      providerAllBooksSearch.setIsFirstRequest(true);
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
                                        providerAllBooksSearch.setSearchString(searchController.text);
                                        providerPagination.setSelectedIndex(1);
                                        
                                        await searchService.getAllBooksSearchResults();
                                        // providerAllBooksSearch.setAllBooksSearchResultsPagesCount(allBooksSearchResultsPagesCount);
                                        // providerAllBooksSearch.setAllBooksSearchResultsBooksCount(allBooksSearchResultsBooksCount);
                                        // providerAllBooksSearch.setAllBooksSearchResult(allBooksSearchResults);
                                        // providerAllBooksSearch.setAllBooksSearchResultsReceived(true);


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
                          child:  providerSingleBookSearch.getIsLoading == true? const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Center(child: CircularProgressIndicator(color: Colors.white,),),
                   ) : Visibility(
                            visible: providerSingleBookSearch.getSearchResults.isNotEmpty && searchBarFocus ? true: false,
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
                          providerSingleBookSearch.selectSearchItem(providerSingleBookSearch.getSearchResults[index]);
                          setState(() {
                            searchBarFocus = false;
                            
                          });
                          // print("search Result you clicked on is ${searchResults[index]}");
                          // Navigator.push(context, MaterialPageRoute(builder: (context)=> BookDetailsScreen(bookModel: searchResults[index])));

                          
                        },
                        child: ListTile(
                          title: Text(providerSingleBookSearch.getSearchResults[index].title ?? 'nan', style: const TextStyle(color: Colors.white),),
                          leading: providerSingleBookSearch.getSearchResults[index].imagePath == null? const Icon(Icons.book) :  Image(image: NetworkImage(API.hostConnectMedia + providerSingleBookSearch.getSearchResults[index].imagePath!)),
                        ),
                      ),
                                      );
                                  },
                                  itemCount: providerSingleBookSearch.getSearchResults.length,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(width: MediaQuery.of(context).size.width * 0.26),
                      ],
                    ) : providerAllBooksSearch.getIsLoading == true?  Padding(
                     padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width *0.10,
                    //  top: MediaQuery.of(context).size.height *0.10
                     ),
                     child: Center(child: CircularProgressIndicator(color: Colors.white),),
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