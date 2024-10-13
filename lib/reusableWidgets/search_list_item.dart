import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/API/api_connections.dart';
import 'package:trial_flutter_web_app/models/book.dart';

class SearchListItemWidget extends StatelessWidget {
  Book bookModel;

  SearchListItemWidget({
    required this.bookModel,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: bookModel.imagePath == null
                      ? Image.asset(
                          "assets/images/notAvailable.png",
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.15,
                        )
                      : Image.network(
                          API.hostConnectMedia + bookModel.imagePath!,
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.15,
                        ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/newbg2.jpg"),
                      repeat: ImageRepeat.repeat,
                    ),
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'العنوان: ${bookModel.title ?? 'nan'}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'المؤلف: ${bookModel.authorName ?? 'nan'}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'الناشر: ${bookModel.publisher ?? 'nan'}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'التاريخ: ${bookModel.publicationYear ?? 'nan'}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'عدد الصفحات: ${bookModel.numOfPages ?? 'nan'}',
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
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
