import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/api_connections.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';
import 'package:animated_book_widget/animated_book_widget.dart';
class BookDetailsScreen extends StatelessWidget {
  static const routeName = "/bookDetails";
  const BookDetailsScreen
  ({super.key});

  @override
  Widget build(BuildContext context) {
    Book bookModel = ModalRoute.of(context)!.settings.arguments as Book;
    return Scaffold(
      appBar: Header(),
      backgroundColor: Color(0XFF26211C),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.85, top: MediaQuery.of(context).size.height *0.05),
          child: Column(
            children: [
              Text("تفاصيل الكتاب",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                child: Row(
                  children: [
                  //   Expanded(
                  //     child: AnimatedBookWidget(
                  //       cover: Image(image: NetworkImage(API.hostConnectMedia + bookModel.imagePath!),),
                  //       content: Text('''
                  // المؤلف: ${bookModel.authorName}
                  // الناشر: ${bookModel.publisher}
                  // التاريخ: ${bookModel.publicationYear}
                  // عدد الصفحات: ${bookModel.numOfPages}
                  // '''),
                  //       size: const Size.fromWidth(160),
                  //     ),
                  //   )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}