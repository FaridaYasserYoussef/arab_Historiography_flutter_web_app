import 'package:flutter/material.dart';
import 'package:trial_flutter_web_app/models/book.dart';
import 'package:trial_flutter_web_app/reusableWidgets/Header.dart';

class ViewDetailedSearchResultsScreen extends StatefulWidget {

  Book bookModel;
   ViewDetailedSearchResultsScreen({required this.bookModel ,super.key});

  @override
  State<ViewDetailedSearchResultsScreen> createState() => _ViewDetailedSearchResultsScreenState();
}

class _ViewDetailedSearchResultsScreenState extends State<ViewDetailedSearchResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: Header(),
      backgroundColor: Color(0XFF26211C),

    );
  }
}