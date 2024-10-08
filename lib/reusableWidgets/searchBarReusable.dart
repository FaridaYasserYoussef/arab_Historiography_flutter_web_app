import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/api_connections.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:http/http.dart' as http;

// typedef searchCallback = Future<void> Function(List<Book>, TextEditingController);

class SearchBarReusable extends StatefulWidget {
  const SearchBarReusable({super.key});

 

  @override
  State<SearchBarReusable> createState() => _SearchBarReusableState();
}

class _SearchBarReusableState extends State<SearchBarReusable> {
  List<Book> searchResults = [];

  bool searchBarFocus = false;
  

  TextEditingController searchController = TextEditingController();

  Future<List<Book>> getBookSearchItems() async{
    List<Book> _searchResults = [];
    setState(() {
      searchResults = [];
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
                          children: [
                            // SizedBox(width: MediaQuery.of(context).size.width *0.25,),
                            Expanded(
                              child: Padding(
                                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.25),
                                child: SearchBar(
                                  onChanged: (value) async {
                                   await getBookSearchItems();
                                  },
                                    onTap: () {
                                      setState(() {
                                      searchBarFocus = true;
                                    });
                                    },
                    
                    
                                  controller: searchController,
                                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(100, 255, 255, 255)),
                                  trailing: [Icon(Icons.search)]),
                              ),
                            ),
                            // SizedBox(width: MediaQuery.of(context).size.width *0.25,),
                    
                          ],
                        ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                    
                    Row(
                      children: [
                        // SizedBox(width: MediaQuery.of(context).size.width * 0.26),
                        Expanded(
                          child: Visibility(
                            visible: searchResults.isNotEmpty && searchBarFocus ? true: false,
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.26),
                              child: Container(
                                color: Color.fromARGB(100, 0,0,0),
                                height: MediaQuery.of(context).size.height * 0.37, // You can adjust this height as needed
                                child: ListView.separated(
                                  separatorBuilder: (context, index) => Divider(height: 3, color: Colors.white,),
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
                          title: Text(searchResults[index].title ?? 'nan', style: TextStyle(color: Colors.white),),
                          leading: searchResults[index].imageData == null? const Icon(Icons.book) :  Image(image: MemoryImage(searchResults[index].imageData!)),
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
                    )
                    
                    
                    
                      ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                    );
  }
}