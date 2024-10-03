class Book{
  int? id;
  String title;
  int? numOfPages;
  String? translator;
  String imagePath;
  DateTime? publicationDate;
  String? publisher;
  DateTime? authoringDate;
  String? authorOrigin;
  int? imageID;

  Book({
this.id,
required this.title,
this.numOfPages,
this.translator,
required this.imagePath,
this.publicationDate,
this.publisher,
this.authoringDate,
this.authorOrigin,
this.imageID
  });

     factory Book.fromSearchResultJson(Map<String, dynamic> json) => Book(
     title: json["title"].toString(),
     imagePath: json["imagePath"].toString(),
  
   );

}