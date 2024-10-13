import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/Providers/allBooksSearchResultProvider.dart';
import 'package:trial_flutter_web_app/Providers/searchPaginationProvider.dart';
import 'package:trial_flutter_web_app/enums/search_type.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';
import 'package:trial_flutter_web_app/reusableWidgets/searchBarReusable.dart';
import 'package:trial_flutter_web_app/reusableWidgets/search_filters_panel_widget.dart';
import 'package:trial_flutter_web_app/reusableWidgets/search_list_item.dart';
import 'package:trial_flutter_web_app/reusableWidgets/search_pagination_widget.dart';

class AllBooksSearchScreen
 extends StatelessWidget {
 static const String routeName = "/allBookSearch";
 int numOfBooksPerShelf = 15;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AllBooksSearchResultsProvider>(context);
    var paginationProvider = Provider.of<SearchPaginationProvider>(context);
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
              Expanded(
                flex:1,
                child: Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05,
                  bottom: MediaQuery.of(context).size.height * 0.03,
                  top: MediaQuery.of(context).size.height * 0.03,
                  ),
                  child: DropdownButton<String>(
                    style: TextStyle(color: Colors.black),
                    value: provider.getAllBooksSearchMode,
                    items: const [
                      DropdownMenuItem(
                      
                        value: "match_phrase",child: Text("كلمات متتالية", style: TextStyle(color: Colors.white),),),
                      DropdownMenuItem(value: "same_page",child: Text("كلمات في نفس الصفحة", style: TextStyle(color: Colors.white),),),
                      DropdownMenuItem(value: "match_word",child: Text("بحث حر", style: TextStyle(color: Colors.white),),),
                    ], 
                    onChanged: (value){
                      provider.changeAllBooksSearchMode(value!);
                      provider.setIsFirstRequest(true);
                    }),
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.02),
                  child: SearchBarReusable(searchType: SearchType.AllBooksSearch,),
                ),
              ),
            ],
          ),
          provider.getIsLoadingInAllBooksPage == true? Container(
            height: MediaQuery.of(context).size.height * 1.70,
            child: Center(child: CircularProgressIndicator(color: Colors.white),)) :
          Visibility(
            visible: provider.getIsAllBooksSearchResultsReceived!,
            child:Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.001,
              // right: MediaQuery.of(context).size.width *0.10,

              ),
              child: Container(
                height: MediaQuery.of(context).size.height * 1.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                       Expanded(
                        flex: 6,
                         child: Container(

                          // color: Colors.red,
                                          height: MediaQuery.of(context).size.height * 1.7,

                           child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(height:  10,);
                            },
                            primary: false,
                           itemCount: provider.getAllBooksSearchResult!.length,
                           itemBuilder: (context, index) {
                            //  int start = index * numOfBooksPerShelf;
                            //  int end = (start + numOfBooksPerShelf < provider.getAllBooksSearchResult!.length) 
                                //  ? start + numOfBooksPerShelf 
                            //      : provider.getAllBooksSearchResult!.length;
                             
                            //  return BookShelfWidget(
                            //    booksInShelf: provider.getAllBooksSearchResult!.sublist(start, end),
                            //  );
                             return SearchListItemWidget(bookModel: provider.getAllBooksSearchResult![index]);
                         
                           },
                                                ),
                         ),
                       ),

                       Expanded(flex: 2,  child: Container(
                                                                  height: MediaQuery.of(context).size.height * 1.7,

                        child: SearchFiltersPanelWidget()))

            
                      ],),

                      Center(
                        child: Visibility(
                          visible: paginationProvider.getNumOfPages > 0,
                          child: SearchPaginationWidget(numOfPages: paginationProvider.getNumOfPages,)),
                      )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}