import 'package:animated_book_widget/animated_book_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:trial_flutter_web_app/API/api_connections.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:hovering/hovering.dart';
import 'package:trial_flutter_web_app/reusableWidgets/book_details_page_widget.dart';

class AnimatedBookCustomized extends StatefulWidget {
  Book bookModel;
  double width;
  double height;
  Widget? content;
  double fontSize;
  AnimatedBookCustomized({
    required this.bookModel,
    required this.width,
    required this.height,
    required this.fontSize,
    this.content
  });
  

  @override
  State<AnimatedBookCustomized> createState() => _AnimatedBookCustomizedState();
}

class _AnimatedBookCustomizedState extends State<AnimatedBookCustomized> {

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
      ?  AssetImage(
          "assets/images/notAvailable.png",
          // fit: BoxFit.fill,
          // height: MediaQuery.of(context).size.height *(widget.height/740),
          // width: MediaQuery.of(context).size.width  *(widget.width/1528),
        ) as ImageProvider
      :  NetworkImage(API.hostConnectMedia + widget.bookModel.imagePath!) , fit: BoxFit.fill,) 
                
                ),
            ),
            content: widget.content == null ?  BookDetailsPageWidget(height: widget.height, width: widget.width, bookModel: widget.bookModel, fontSize: widget.fontSize,): widget.content!,
            size:  Size(MediaQuery.of(context).size.width * (widget.width/1528), MediaQuery.of(context).size.height * (widget.height/740)),
            
          ),
        ),
      ),
    );
  }
}