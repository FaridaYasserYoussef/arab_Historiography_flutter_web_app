import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:trial_flutter_web_app/models/pages.dart';

class SearchResultPageWidget extends StatelessWidget {
  BookPage page;
   SearchResultPageWidget({required this.page,super.key});

  @override
  Widget build(BuildContext context) {
    print("page text is ${page.text}");
    return Transform.rotate(
      angle: 3.14159,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.height*0.05),
              child: HtmlWidget(''' ${page.text} ''',
               customStylesBuilder: (element) {
                      if (element.localName == 'em') {
              return {
                'color': 'blue'
              };
                      }},
              ),
            ),
            CircleAvatar(child: Text(page.pageNumber.toString()),)
          ],
        
        
        ),
      ),
    );
  }
}