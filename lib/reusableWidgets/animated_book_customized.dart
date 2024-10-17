import 'package:animated_book_widget/animated_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:trial_flutter_web_app/API/api_connections.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:hovering/hovering.dart';

class AnimatedBookCustomized extends StatefulWidget {
  Book bookModel;
  double width;
  double height;
  AnimatedBookCustomized({
    required this.bookModel,
    required this.width,
    required this.height,
  });
  

  @override
  State<AnimatedBookCustomized> createState() => _AnimatedBookCustomizedState();
}

class _AnimatedBookCustomizedState extends State<AnimatedBookCustomized> {
   double value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Container(
        // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width *0.25),
        height: MediaQuery.of(context).size.height * (widget.height/740),
        color: Colors.black,
        child: Transform.rotate(
          angle: 3.14159,
          child: AnimatedBookWidget(
            // Color(0XFF26211C)
            backgroundColor:Color(0XFF26211C),
            cover: Transform.rotate(
            angle: 3.14159,
              child: ClipRRect(child: widget.bookModel.imagePath == "" ? Image(
                height: MediaQuery.of(context).size.height * (widget.height/740),
                image:  AssetImage("assets/images/pageBackground.jpg"), fit: BoxFit.fill,) :Image(
                height: MediaQuery.of(context).size.height * (widget.height/740),
                image: widget.bookModel.imagePath == null
      ? Image.asset(
          "assets/images/notAvailable.png",
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height *(widget.height/740),
          width: MediaQuery.of(context).size.width  *(widget.width/1528),
        ) as ImageProvider
      :  NetworkImage(API.hostConnectMedia + widget.bookModel.imagePath!), fit: BoxFit.fill,)
                
                ),
            ),
            content: Stack(
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
            ),
            size:  Size(MediaQuery.of(context).size.width * (widget.width/1528), MediaQuery.of(context).size.height * (widget.height/740)),
            
          ),
        ),
      ),
    );
  }
}