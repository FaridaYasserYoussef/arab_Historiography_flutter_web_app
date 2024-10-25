import 'package:flutter/material.dart';

class RequestTokenProvider with ChangeNotifier{

  static final RequestTokenProvider _requestTokenProvider = RequestTokenProvider._internal();
   factory RequestTokenProvider(){
    return _requestTokenProvider;
   }
   RequestTokenProvider._internal();

   String currentTotalBooksCancelToken= "";
   String get getCurrentTotalBooksCancelToken=> currentTotalBooksCancelToken;

   String previousTotalBooksCancelToken= "";
   String get getPreviousTotalBooksCancelToken=> previousTotalBooksCancelToken;

   void setCurrentTotalBooksCancelToken(String newCurrentTotalBooksCancelToken){
    currentTotalBooksCancelToken =newCurrentTotalBooksCancelToken;
    notifyListeners();
   }

   void setPreviousTotalBooksCancelToken(String newPreviousTotalBooksCancelToken){
    previousTotalBooksCancelToken = newPreviousTotalBooksCancelToken;
    notifyListeners();
   }

}