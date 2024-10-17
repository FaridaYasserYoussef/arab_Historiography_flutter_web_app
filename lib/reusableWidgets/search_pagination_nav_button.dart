import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/API/SearchAPIService.dart';
import 'package:trial_flutter_web_app/Providers/searchPaginationProvider.dart';
import 'package:trial_flutter_web_app/enums/navigation_type.dart';

class SearchPaginationNavigationButtonWidget extends StatelessWidget {
  SearchPaginationNavigationType navigationType;
  SearchPaginationNavigationButtonWidget({
    required this.navigationType
  });

  @override
  Widget build(BuildContext context) {
        var provider = Provider.of<SearchPaginationProvider>(context);
    SearchAPIService searchAPIService = SearchAPIService();

    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async{
          if(navigationType == SearchPaginationNavigationType.Next){
            if(provider.getSelectedIndex < provider.numOfPages){
              int newIndex = provider.getSelectedIndex + 1;
              provider.setSelectedIndex(newIndex);
              await searchAPIService.getAllBooksSearchResults(context);
            }
          }
          else if(navigationType == SearchPaginationNavigationType.Previous){
              if(provider.getSelectedIndex > 1){
              int newIndex = provider.getSelectedIndex -1;
              provider.setSelectedIndex(newIndex);
              await searchAPIService.getAllBooksSearchResults(context);
            }
          }
        },
        child: HoverContainer(
          hoverDecoration: BoxDecoration(
            boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(0, 0),
                        blurRadius: 10,
                      ),
                    ],
          ),
          child: CircleAvatar(
            child: navigationType == SearchPaginationNavigationType.Next ? Icon(Icons.arrow_forward, color: Colors.black,): Icon(Icons.arrow_back, color: Colors.black,),
            backgroundColor:  Color(0xFFa86f3b),
            radius: MediaQuery.of(context).size.height *0.02,
          ),
        ),
      ),
    );
  }
}