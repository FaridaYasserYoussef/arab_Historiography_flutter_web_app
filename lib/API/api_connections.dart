class API{
    static const hostConnect = "https://splendid-irina-arabic-historiograhy-0e229fe4.koyeb.app";// uncommented when redeploying
        // static const hostConnect = "http://192.168.1.13:8000";// is updated according to IPV4 (during testing)
  // static const hostConnect = "http://172.26.0.1:8000";// is updated according to IPV4 (during testing)



    
  static const hostConnectSearch = "$hostConnect/search";
  static const searchBooks = "$hostConnectSearch/search_books/";
  static const allBooksSearch = "$hostConnectSearch/all_books_search/";
  static const searchBooksByName = "$hostConnectSearch/search_books_by_name/";
  static const getAllBooksCount ="$hostConnectSearch/get_total_book_count/";
static const hostConnectMedia = "$hostConnect/media/";
  // static const getImage = "$hostConnectSearch/get_image/";


}