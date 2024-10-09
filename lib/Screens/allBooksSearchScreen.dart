import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/enums/search_type.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';
import 'package:trial_flutter_web_app/reusableWidgets/searchBarReusable.dart';

class AllBooksSearchScreen
 extends StatelessWidget {
 static const String routeName = "/allBookSearch";

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
                  bottom: MediaQuery.of(context).size.height * 0.06
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
              DropdownButton<String>(
                value: provider.getAllBooksSearchMode,
                items: [
                  DropdownMenuItem(child: Text("كلمات متتالية"), value: "match_phrase",),
                  DropdownMenuItem(child: Text("كلمات في نفس الصفحة"), value: "same_page",),
                  DropdownMenuItem(child: Text("بحث حر"), value: "match_word",),
                ], 
                onChanged: (value){
                  provider.changeAllBooksSearchMode(value!);

                }),
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.02),
                child: SearchBarReusable(searchType: SearchType.AllBooksSearch,),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}