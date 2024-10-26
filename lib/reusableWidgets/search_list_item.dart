import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/API/api_connections.dart';
import 'package:trial_flutter_web_app/Screens/view_detailed_search_results_screen.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:trial_flutter_web_app/reusableWidgets/animated_book_customized.dart';

class SearchListItemWidget extends StatelessWidget {
  Book bookModel;

  SearchListItemWidget({
    required this.bookModel,
  });
  double numOfClicks = 0;

  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.height);
    // print(MediaQuery.of(context).size.width);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
        child: Row(
          children: [
            Expanded(
             flex: 5,
              child: AnimatedBookCustomized(bookModel: bookModel, width:200, height: 325, fontSize: 10, inSearchList: true,)
            ),
            Expanded(
              flex: 18,
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.60,
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                      // image: AssetImage("assets/images/newbg2.jpg"),
                      // repeat: ImageRepeat.repeat,
                    // ),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black,
                    //     offset: Offset(4, 4),
                    //     blurRadius: 10,
                    //   ),
                    // ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewDetailedSearchResultsScreen(bookModel: bookModel)));
                            
                          }, icon: Icon(Icons.arrow_forward_ios, color: Colors.white,))
                          // Text(
                          //   'العنوان: ${bookModel.title ?? 'nan'}',
                          //   textDirection: TextDirection.rtl,
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          // Text(
                          //   'المؤلف: ${bookModel.authorName ?? 'nan'}',
                          //   textDirection: TextDirection.rtl,
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          // Text(
                          //   'الناشر: ${bookModel.publisher ?? 'nan'}',
                          //   textDirection: TextDirection.rtl,
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          // Text(
                          //   'التاريخ: ${bookModel.publicationYear ?? 'nan'}',
                          //   textDirection: TextDirection.rtl,
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                          //   ),
                          // ),
                          // Text(
                          //   'عدد الصفحات: ${bookModel.numOfPages ?? 'nan'}',
                          //   textDirection: TextDirection.rtl,
                          //   textAlign: TextAlign.center,
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
