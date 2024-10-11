import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/enums/search_type.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';
import 'package:trial_flutter_web_app/reusableWidgets/book_shelf.dart';
import 'package:trial_flutter_web_app/reusableWidgets/searchBarReusable.dart';
import 'package:trial_flutter_web_app/reusableWidgets/search_filters_panel_widget.dart';

class AllBooksSearchScreen
 extends StatelessWidget {
 static const String routeName = "/allBookSearch";
 int numOfBooksPerShelf = 15;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchResultsProvider>(context);
    return Scaffold(
            backgroundColor: Color(0XFF26211C),

      appBar: Header(title: "البحث في كل الكتب"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
          Padding(
                  padding:  EdgeInsets.only( 
                  top: MediaQuery.of(context).size.height * 0.08,
                  bottom: MediaQuery.of(context).size.height * 0.08,
                                    left: MediaQuery.of(context).size.width * 0.02

                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                       "إبحث بكلمات محددة في جميع الكتب الموجودة",
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                    ],
                    totalRepeatCount: 1,
                    pause: const Duration(milliseconds: 500),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
          Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,
                bottom: MediaQuery.of(context).size.height * 0.03,
                top: MediaQuery.of(context).size.height * 0.03,
                ),
                child: DropdownButton<String>(
                  value: provider.getAllBooksSearchMode,
                  items: const [
                    DropdownMenuItem(value: "match_phrase",child: Text("كلمات متتالية", style: TextStyle(color: Colors.white),),),
                    DropdownMenuItem(value: "same_page",child: Text("كلمات في نفس الصفحة", style: TextStyle(color: Colors.white),),),
                    DropdownMenuItem(value: "match_word",child: Text("بحث حر", style: TextStyle(color: Colors.white),),),
                  ], 
                  onChanged: (value){
                    provider.changeAllBooksSearchMode(value!);
              
                  }),
              ),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.02),
                child: SearchBarReusable(searchType: SearchType.AllBooksSearch,),
              ),
            ],
          ),
          Visibility(
            visible: provider.getIsAllBooksSearchResultsReceived!,
            child:Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.10,
              // right: MediaQuery.of(context).size.width *0.10,

              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 1.25,
                child: Row(
                  children: [
                   Expanded(
                    flex: 5,
                     child: ListView.builder(
                      primary: false,
                     itemCount: (provider.getAllBooksSearchResult!.length / numOfBooksPerShelf).ceil(),
                     itemBuilder: (context, index) {
                       int start = index * numOfBooksPerShelf;
                       int end = (start + numOfBooksPerShelf < provider.getAllBooksSearchResult!.length) 
                           ? start + numOfBooksPerShelf 
                           : provider.getAllBooksSearchResult!.length;
                       
                       return BookShelfWidget(
                         booksInShelf: provider.getAllBooksSearchResult!.sublist(start, end),
                       );
                     },
                   ),
                   ),

                   Expanded(flex: 2,  child: SearchFiltersPanelWidget())

            
                  ],),
              ),
            ))
          ],
        ),
      ),
    );
  }
}