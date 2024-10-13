import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:trial_flutter_web_app/reusableWidgets/search_list_item.dart';

class BookShelfWidget extends StatelessWidget {
  List<Book> booksInShelf;
  BookShelfWidget({super.key, 
    required this.booksInShelf
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(
        top: MediaQuery.of(context).size.height *0.05,
        // right: MediaQuery.of(context).size.width *0.25
      ),
      child: Container(
        height: MediaQuery.of(context).size.height *0.45,
        decoration: const BoxDecoration(
          
          image: DecorationImage(image: AssetImage("assets/images/bookshelf.jpg"),
          repeat: ImageRepeat.repeatX,
          
          ),
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: booksInShelf.length,
          itemBuilder: (context, index){
           return SearchListItemWidget(bookModel: booksInShelf[index]);
    
        }),
      ),
    );
  }
}