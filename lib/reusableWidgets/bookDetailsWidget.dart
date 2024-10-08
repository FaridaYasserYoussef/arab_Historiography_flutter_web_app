import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/api_connections.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';
import 'package:animated_book_widget/animated_book_widget.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class BookDetailsWidget extends StatefulWidget {
  // static const routeName = "/bookDetails";

Book bookModel;
BookDetailsWidget({
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
                        child: Text("بحث عن كلمات متتالية", style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold, fontSize: 23))),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right:  MediaQuery.of(context).size.width *0.07,left: MediaQuery.of(context).size.width *0.20, top: MediaQuery.of(context).size.height *0.15, bottom: MediaQuery.of(context).size.height *0.2 ),
                    child: Container(
                      width: double.infinity,
                      child: Container(
                        // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.25),
                        height: 500,
                        color: Colors.black,
                        child: Transform.rotate(
                          angle: 3.14159,
                          child: AnimatedBookWidget(
                            // Color(0XFF26211C)
                            backgroundColor:Color(0XFF26211C),
                            cover: Transform.rotate(
                            angle: 3.14159,
                              child: ClipRRect(child: widget.bookModel.imagePath == "" ? Image(
                                height: 500,
                                image:  AssetImage("assets/images/pageBackground.jpg"), fit: BoxFit.fill,) :Image(
                                height: 500,
                                image:  NetworkImage(API.hostConnectMedia + widget.bookModel.imagePath!), fit: BoxFit.fill,)
                                
                                ),
                            ),
                            content: Stack(
                              children: [
                                Transform.rotate(
                                  angle: 3.14159,
                                  child: Image(image: AssetImage("assets/images/pageBackground.jpg"), 
                                  
                                  fit: BoxFit.fill,
                                  height: 500,
                                  )
                                  
                                  ),
                                Container(
                                  margin: EdgeInsets.all(30),
                                  height: 500,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent
                                  // color: Colors.white,
                                  // border: Border.all(
                                    
                                  //             color: Colors.amberAccent.shade700, // Golden color for the border
                                  //             width: 4.0, // Border width
                                  //           ),
                                  ),
                                  child: Center(
                                    child: Transform.rotate(
                                      angle: 3.14159,
                                      child: Padding(
                                        padding: const EdgeInsets.all( 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Text('المؤلف: ${widget.bookModel.authorName ?? 'nan'}', 
                                            textDirection: TextDirection.rtl , 
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 18),
                                        
                                            ),
                                            Text('الناشر: ${widget.bookModel.publisher ?? 'nan'}', textDirection: TextDirection.rtl ,
                                             textAlign: TextAlign.center,
            
                                             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                                             ),
                                            Text('التاريخ: ${widget.bookModel.publicationYear ?? 'nan'}',
                                             textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.center,
            
                                             style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 18),
                                             ),
                                            Text('عدد الصفحات: ${widget.bookModel.numOfPages ?? 'nan'}', 
                                            textDirection: TextDirection.rtl,
                                              textAlign: TextAlign.center,
            
                                            style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 18),
                                            ),

                                            Divider(),

                                            Center(
                                              child: RatingStars(
                                                            value: value,
                                                            onValueChanged: (v) {
                                                              //
                                                              setState(() {
                                                                value = v;
                                                              });
                                                            },
                                                            starBuilder: (index, color) => Icon(
                                                              Icons.star,
                                                              color: color,
                                                            ),
                                                            starCount: 5,
                                                            starSize: 20,
                                                            valueLabelColor: const Color(0xff9b9b9b),
                                                            valueLabelTextStyle: const TextStyle(
                                                                color: Colors.white,
                                                                fontWeight: FontWeight.w400,
                                                                fontStyle: FontStyle.normal,
                                                                fontSize: 12.0),
                                                            valueLabelRadius: 10,
                                                            maxValue: 5,
                                                            starSpacing: 2,
                                                            maxValueVisibility: true,
                                                            valueLabelVisibility: true,
                                                            animationDuration: Duration(milliseconds: 1000),
                                                            valueLabelPadding:
                                                                const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                                                            valueLabelMargin: const EdgeInsets.only(right: 8),
                                                            starOffColor: const Color(0xffe7e8ea),
                                                            starColor: Colors.yellow,
                                                          ),
                                            ),


                                            
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            size: Size(150, 500),
                            
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
  }
}