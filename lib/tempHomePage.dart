import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/api_connections.dart';
import 'package:trial_flutter_web_app/reusableWidgets/tempheader.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; 

class HomePage extends StatefulWidget {

  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;
   List<String> bookTitles = [];

  searchInBook() async{
    setState(() {
      isLoading = true;
      bookTitles = [];
    });
   var res = await http.post(
    Uri.parse(API.searchBooks),
    body: {
      "query": '{"nested": {"path": "pages","query": {"bool": {"must": [{"match_phrase": {"pages.pageText": "${searchController.text}"}}]}}}}'
    }
   );

   if(res.statusCode == 200){
    var data = jsonDecode(res.body);
    List<String> fetchedBookTitles = List<String>.from(data["book_titles"]);
    
    setState(() {
      isLoading = false;
      bookTitles = fetchedBookTitles;
      
    });
    

   }else {
      print("Failed to load book titles");
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        const TempHeader(),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.09),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SearchBar(
              controller: searchController,
              trailing: [IconButton(onPressed: searchInBook, icon: Icon(Icons.search))]),
          ),
        ),
        // Expanded(child: Container()),
        // Expanded(child: Container()),
        // Expanded(child: Container()),
        // Expanded(child: Container()),
        const SizedBox(height: 30,),

        Visibility(
          visible: isLoading,
          child: const Center(
          child: CircularProgressIndicator()
        
        ,)),

        const SizedBox(height: 30,),

        Expanded(
          child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width *0.11),
            child: ListView.builder(
              itemBuilder: (context, index) => Align( alignment: Alignment.centerRight, child: ListTile(leading: Icon(Icons.book, color: Colors.red,), title: Text(bookTitles[index], textAlign: TextAlign.right,),) ,) ,
              itemCount: bookTitles.length,
              ),
          ),
        )


      ]),
    );
  }
}