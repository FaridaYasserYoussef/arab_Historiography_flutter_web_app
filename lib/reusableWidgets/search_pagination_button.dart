import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:provider/provider.dart';
import 'package:trial_flutter_web_app/API/SearchAPIService.dart';
import 'package:trial_flutter_web_app/Providers/searchPaginationProvider.dart';

class SearchPaginationButtonWidget extends StatelessWidget {
  int index;
  SearchPaginationButtonWidget({
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SearchPaginationProvider>(context);
    SearchAPIService searchAPIService = SearchAPIService();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async{
          provider.setSelectedIndex(index);
          await searchAPIService.getAllBooksSearchResults();
          // await searchAPIService.getAllBooksSearchResultsScroll();
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
            child: Text(index.toString()),
            backgroundColor: index != provider.getSelectedIndex? Color(0xFFa86f3b): Colors.white,
            foregroundColor: Colors.black,
            radius: MediaQuery.of(context).size.height *0.03,
          ),
        ),
      ),
    );
  }
}