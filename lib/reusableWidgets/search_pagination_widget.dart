import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/Providers/searchPaginationProvider.dart';
import 'package:trial_flutter_web_app/enums/navigation_type.dart';
import 'package:trial_flutter_web_app/reusableWidgets/search_pagination_button.dart';
import 'package:trial_flutter_web_app/reusableWidgets/search_pagination_nav_button.dart';

class SearchPaginationWidget extends StatelessWidget {
  int numOfPages;
   SearchPaginationWidget({
    required this.numOfPages
  });


  List<Widget> constructPaginationWidget(int numOfPages, int selectedIndex){
    bool firstMiddlePointsAdded = false;
        bool lastMiddlePointsAdded = false;

    List<Widget> paginationButtons = [];
    // print("num of pages is $numOfPages");
    if(numOfPages == 1){
      // paginationButtons.add(SearchPaginationButtonWidget(index: 1));
      return paginationButtons;
    }
    paginationButtons.add(SearchPaginationNavigationButtonWidget(navigationType: SearchPaginationNavigationType.Previous));
    paginationButtons.add(SearchPaginationButtonWidget(index: 1));

    for(int i = 2; i < numOfPages ; i++){
      if(i >= (selectedIndex -2) && i <= (selectedIndex + 2)){
        paginationButtons.add(SearchPaginationButtonWidget(index: i));
      }
      else if(i < (selectedIndex -2) && firstMiddlePointsAdded == false){
        paginationButtons.add(Text("..."));
        firstMiddlePointsAdded = true;

      }
      else if(i > (selectedIndex + 2) && lastMiddlePointsAdded == false){
      paginationButtons.add(Text("..."));
      lastMiddlePointsAdded = true;

      }
      // else if(i > (selectedIndex + 4) && middlePointsAdded == true){
      //   continue;
      // }
      // else if(i == numOfPages){
      //  paginationButtons.add(SearchPaginationButtonWidget(index: i));
      // }

    }
    paginationButtons.add(SearchPaginationButtonWidget(index: numOfPages));
    paginationButtons.add(SearchPaginationNavigationButtonWidget(navigationType: SearchPaginationNavigationType.Next));
    return paginationButtons;

  }
  @override
  Widget build(BuildContext context) {
            var provider = Provider.of<SearchPaginationProvider>(context);

    return Padding(
      padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width *0.3),
      child: Row(children: provider.getNumOfPages == 0? []: constructPaginationWidget(provider.getNumOfPages, provider.getSelectedIndex),),
    );
  }
}