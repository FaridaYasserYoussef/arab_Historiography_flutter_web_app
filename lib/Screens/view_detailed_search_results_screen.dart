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
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: MediaQuery.of(context).size.height *0.2,),
          
          Row(
            children: [
              Expanded(flex: 3, child: SizedBox()),
              Expanded(flex:3,  
              child: AnimatedBookCustomized(
                bookModel: widget.bookModel, 
                width:622, 
                height: 600,
                content:  PageFlipWidget(
        key: _controller,
        backgroundColor: Colors.white,
        // isRightSwipe: true,
        // lastPage: Container(color: Colors.white, child: const Center(child: Text('Last Page!'))),
        children: <Widget>[
          BookDetailsPageWidget(height: 600, width: 622, bookModel: widget.bookModel),
          for (BookPage page in widget.bookModel.pages!) SearchResultPageWidget(page: page),
        ],
      ),
                )),
              Expanded(flex: 3,  child: SizedBox())
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height *0.2,),
        ]),
      ),

    );
  }
}