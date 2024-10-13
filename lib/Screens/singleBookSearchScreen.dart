
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';
import 'package:trial_flutter_web_app/enums/search_type.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';
import 'package:trial_flutter_web_app/reusableWidgets/bookDetailsWidget.dart';
import 'package:trial_flutter_web_app/reusableWidgets/searchBarReusable.dart';

class SingleBookSearchScreen
 extends StatefulWidget {
 static const String routeName = "/singleBookSearch";

  @override
  State<SingleBookSearchScreen> createState() => _SingleBookSearchScreenState();
}

class _SingleBookSearchScreenState extends State<SingleBookSearchScreen> {
  

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SingleBookSearchResultProvider>(context);
    return Scaffold(
      backgroundColor: Color(0XFF26211C),
      appBar: Header(title: "البحث عن كتاب محدد",),
      body: SingleChildScrollView(
        child: Column(children: [

          Padding(
                  padding:  EdgeInsets.only( 
                  top: MediaQuery.of(context).size.height * 0.08,
                  bottom: MediaQuery.of(context).size.height * 0.06
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "إبحث بعنوان أكثر من 2000 كتاب باللغة العربية",
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
          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.02),
            child: SearchBarReusable(searchType: SearchType.SingleBookSearch,),
          ),

          Visibility(
            visible: provider.selectedSearchItem == null ? false : true,
            child: Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.02),
          child: BookDetailsWidget(bookModel: provider.selectedSearchItem ?? Book(title: "", imagePath: "")),
          ))

          
        ],)),
    );
  }
}