class BookPage{
  int pageNumber;
  String text;
  BookPage({
    required this.pageNumber,
    required this.text
  });

  factory BookPage.fromJson(Map<String, dynamic> json) => BookPage(
    pageNumber: int.parse(json["pageNumber"].toString()), 
    text: json["text"].toString()
    );
}