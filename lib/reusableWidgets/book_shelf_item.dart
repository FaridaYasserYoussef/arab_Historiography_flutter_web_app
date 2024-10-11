import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/api_connections.dart';
import 'package:trial_flutter_web_app/models/book.dart';

class BookShelfItemWidget extends StatelessWidget {

  Book bookModel;
  
  BookShelfItemWidget({
    required this.bookModel
  });
  @override
  Widget build(BuildContext context) {
    return Container(
       width: MediaQuery.of(context).size.width *0.15,
                   height: MediaQuery.of(context).size.height * 0.40,


      child: Column(children:[
        bookModel.imagePath == null? Image(
          image: AssetImage("assets/images/notAvailable.png"),
          fit: BoxFit.cover, // Adjust image fit
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width *0.10,

          )  :Image(
          image:  NetworkImage(API.hostConnectMedia + bookModel.imagePath!),
          fit: BoxFit.cover, // Adjust image fit
            height: MediaQuery.of(context).size.height * 0.30,
            width: MediaQuery.of(context).size.width *0.10,

          ),
        Container(
                                  margin: EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.10,
                                  decoration: BoxDecoration(
                                    color: Colors.brown
                                 
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all( 10),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                           Text('العنوان: ${bookModel.title ?? 'nan'}', 
                                          textDirection: TextDirection.rtl , 
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 10),
                                      
                                          ),
                                          // Text('المؤلف: ${bookModel.authorName ?? 'nan'}', 
                                          // textDirection: TextDirection.rtl , 
                                          // textAlign: TextAlign.center,
                                          // style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 10),
                                      
                                          // ),
                                          // Text('الناشر: ${bookModel.publisher ?? 'nan'}', textDirection: TextDirection.rtl ,
                                          //  textAlign: TextAlign.center,
            
                                          //  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                                          //  ),
                                          // Text('التاريخ: ${bookModel.publicationYear ?? 'nan'}',
                                          //  textDirection: TextDirection.rtl,
                                          //   textAlign: TextAlign.center,
            
                                          //  style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 10),
                                          //  ),
                                          // Text('عدد الصفحات: ${bookModel.numOfPages ?? 'nan'}', 
                                          // textDirection: TextDirection.rtl,
                                          //   textAlign: TextAlign.center,
            
                                          // style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 10),
                                          // ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )

      ]),
    );
  }
}