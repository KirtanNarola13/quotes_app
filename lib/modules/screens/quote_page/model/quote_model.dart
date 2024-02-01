class QuoteModel {
  String quote;
  String category;

  QuoteModel({required this.quote, required this.category});

  factory QuoteModel.fromAPI({required Map data}) {
    return QuoteModel(quote: data['quote'], category: data['category']);
  }
}
