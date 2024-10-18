import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:trial_flutter_web_app/models/book.dart';

class BookDetailsPageWidget extends StatefulWidget {
  double height;
  double width;
  Book bookModel;
   BookDetailsPageWidget({
    required this.height,
    required this.width,
    required this.bookModel,
    super.key});

  @override
  State<BookDetailsPageWidget> createState() => _BookDetailsPageWidgetState();
}

class _BookDetailsPageWidgetState extends State<BookDetailsPageWidget> {
     double value = 0;

  @override
  Widget build(BuildContext context) {
    return  Stack(
              children: [
                Transform.rotate(
                  angle: 3.14159,
                  child: Image(image: AssetImage("assets/images/pageBackground.jpg"), 
                  
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * (widget.height/740),
                  )
                  
                  ),
                Container(
                  margin: EdgeInsets.all(30),
                  height: MediaQuery.of(context).size.height * (widget.height/740),
                  decoration: const BoxDecoration(
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
                            style: const TextStyle(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 18),
                        
                            ),
                            Text('الناشر: ${widget.bookModel.publisher ?? 'nan'}', textDirection: TextDirection.rtl ,
                             textAlign: TextAlign.center,
          
                             style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                             ),
                            Text('التاريخ: ${widget.bookModel.publicationYear ?? 'nan'}',
                             textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
          
                             style: const TextStyle(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 18),
                             ),
                            Text('عدد الصفحات: ${widget.bookModel.numOfPages ?? 'nan'}', 
                            textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
          
                            style: const TextStyle(color: Colors.black , fontWeight: FontWeight.bold, fontSize: 18),
                            ),
    
                            const Divider(),
    
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
                                            animationDuration: const Duration(milliseconds: 1000),
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
            );
  }
}