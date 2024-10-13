import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/Providers/allBooksSearchResultProvider.dart';
import 'package:trial_flutter_web_app/Providers/searchResultsProvider.dart';

class SearchFiltersPanelWidget extends StatelessWidget {
  const SearchFiltersPanelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AllBooksSearchResultsProvider>(context);
    return Padding(
      padding:  EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.04
        ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.04,
        height: MediaQuery.of(context).size.height * 1.25,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("نتائج البحث: ${provider.getAllBooksSearchResultsBooksCount} كتاب - ${provider.getAllBooksSearchResultsPagesCount} صفحة",
            style: TextStyle(fontSize: 20, color: Colors.white), textDirection: TextDirection.rtl,
            ),
     DropdownButton<String>(
         isExpanded: true,
    
                    value: "الكتاب",
                    items: const [
                      DropdownMenuItem(value: "الكتاب",child: Center(child: Text("الكتاب", style: TextStyle(color: Colors.white),)),),
                    ], 
                    onChanged: (value){
                
                    }),
    
                    DropdownButton<String>(
                           isExpanded: true,
    
                    value: "اسم الكتاب",
                    items: const [
                      DropdownMenuItem(value: "اسم الكتاب",child: Center(child: Text("اسم الكتاب", style: TextStyle(color: Colors.white),)),),
                    ], 
                    onChanged: (value){
                
                    }),
    
    
                    DropdownButton<String>(
                           isExpanded: true,
    
                    value: "الناشر",
                    items: const [
                      DropdownMenuItem(value: "الناشر",child: Center(child: Text("الناشر", style: TextStyle(color: Colors.white),)),),
                    ], 
                    onChanged: (value){
                
                    }),
    
                    Row(
                      children: [
                        Expanded(child:  DropdownButton<String>(     
                          isExpanded: true,
    
                    value: "من",
                    items: const [
                      DropdownMenuItem(value:  "من",child: Center(child: Text( "من", style: TextStyle(color: Colors.white),)),),
                    ], 
                    onChanged: (value){
                
                    })
                        
                        ),
    
                        Expanded(child:  DropdownButton<String>(
                               isExpanded: true,
    
                    value: "إلى",
                    items: const [
                      DropdownMenuItem(value:  "إلى",child: Center(child: Text( "إلى", style: TextStyle(color: Colors.white),)),),
                    ], 
                    onChanged: (value){
                
                    }))
    
                
                      ],
                    )
          ],
        ),
      ),
    ); 
  }
}