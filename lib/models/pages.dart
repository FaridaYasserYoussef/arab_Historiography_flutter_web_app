class Page{
  int pageNumber;
  String text;
  Page({
    required this.pageNumber,
    required this.text
  });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
    pageNumber: int.parse(json["pageNumber"].toString()), 
    text: json["text"].toString()
    );
}