import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:trial_flutter_web_app/models/pages.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';
import 'package:trial_flutter_web_app/reusableWidgets/animated_book_customized.dart';
import 'package:page_flip/page_flip.dart';
import 'package:trial_flutter_web_app/reusableWidgets/bookDetailsWidget.dart';
import 'package:trial_flutter_web_app/reusableWidgets/book_details_page_widget.dart';
import 'package:trial_flutter_web_app/reusableWidgets/search_results_page_widget.dart';

class ViewDetailedSearchResultsScreen extends StatefulWidget {

  Book bookModel;
   ViewDetailedSearchResultsScreen({required this.bookModel ,super.key});

  @override
  State<ViewDetailedSearchResultsScreen> createState() => _ViewDetailedSearchResultsScreenState();
}

class _ViewDetailedSearchResultsScreenState extends State<ViewDetailedSearchResultsScreen> {
    final _controller = GlobalKey<PageFlipWidgetState>();


  @override
  Widget build(BuildContext context) {
    print("The number of pages Received is ${widget.bookModel.pages!.length}");
    return  Scaffold(
      appBar: Header(),
      backgroundColor: Color(0XFF26211C),
      body: Column(children: [
        // SizedBox(height: MediaQuery.of(context).size.height *0.2,),
        
        Expanded(
          child: Row(
            children: [
              Expanded(flex: 3, child: SizedBox()),
              Expanded(flex:3,  
              child: AnimatedBookCustomized(
                fontSize: 18,
                bookModel: widget.bookModel, 
                width:622, 
                height: 600,
                content:  PageFlipWidget(
              key: _controller,
              backgroundColor: Colors.white,
              // isRightSwipe: true,
              lastPage: Transform.rotate(
          angle: 3.14159,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Text("الرجوع لنتائج البحث", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(backgroundColor: Colors.blue,
              child: Icon(Icons.arrow_back, color: Colors.white,),
              ),
            )
          ],)),
              children: <Widget>[
          BookDetailsPageWidget(height: 600, width: 622, bookModel: widget.bookModel, fontSize: 18,),
          for (BookPage page in widget.bookModel.pages!) SearchResultPageWidget(page: page),
              ],
              ),
                )),
              Expanded(flex: 3,  child: SizedBox())
            ],
          ),
        ),
        // SizedBox(height: MediaQuery.of(context).size.height *0.2,),
      ]),

    );
  }
}