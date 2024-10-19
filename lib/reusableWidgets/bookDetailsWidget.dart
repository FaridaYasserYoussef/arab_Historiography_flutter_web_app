import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/API/api_connections.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:animated_book_widget/animated_book_widget.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:trial_flutter_web_app/reusableWidgets/animated_book_customized.dart';

class BookDetailsWidget extends StatefulWidget {
  // static const routeName = "/bookDetails";

Book bookModel;
BookDetailsWidget({super.key, 
  required this.bookModel
});

  @override
  State<BookDetailsWidget> createState() => _BookDetailsWidgetState();
}

class _BookDetailsWidgetState extends State<BookDetailsWidget> {
 double value = 0;

  @override
  Widget build(BuildContext context) {
    // Book bookModel = ModalRoute.of(context)!.settings.arguments as Book;
    return Row(
          children: [
                                                Expanded(
                  child: Padding(
                    padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                      
                      Padding(
                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.01 ,
                        bottom: MediaQuery.of(context).size.height *0.01 ,
                        //  right: MediaQuery.of(context).size.width *0.02,
                         left: MediaQuery.of(context).size.width *0.04
                         ),
                        child: ElevatedButton(
                          
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                           
                            backgroundColor: Colors.white
                          ),
                          onPressed: (){}, 
                        child: const Text("بحث عن كلمات متتالية", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 23))),
                      ),
                  
                       Padding(
                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.01 ,
                        bottom: MediaQuery.of(context).size.height *0.01 ,
                        //  right: MediaQuery.of(context).size.width *0.02,
                         left: MediaQuery.of(context).size.width *0.04
                         ),
                         child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                       
                            backgroundColor: Colors.white
                          ),
                          onPressed: (){}, 
                                           child: Text("بحث عن كلمات في نفس الصفحة", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 23)), ),
                       ),
                  
                       Padding(
                        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height *0.01 ,
                        bottom: MediaQuery.of(context).size.height *0.01 ,
                        //  right: MediaQuery.of(context).size.width *0.02,
                         left: MediaQuery.of(context).size.width *0.04
                         ),
                         child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shadowColor: Colors.black,
                            backgroundColor: Colors.white
                          ),
                          onPressed: (){}, 
                                           child: Text("بحث حر في الكتاب", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold,fontSize: 23),)),
                       ),
                  
                    ],),
                  )
                  
                  ),
            Expanded(
              child: Padding(
      padding: EdgeInsets.only(right:  MediaQuery.of(context).size.width *0.07,left: MediaQuery.of(context).size.width *0.20, top: MediaQuery.of(context).size.height *0.15, bottom: MediaQuery.of(context).size.height *0.2 ),
                child: AnimatedBookCustomized(bookModel: widget.bookModel, width: 150, height: 500, fontSize: 18,),
              )
            ),
          ],
        );
  }
}