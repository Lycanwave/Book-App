class BookModel {
  String? id;
  String? title;
  String? coverImageUrl;
  double? priceInDollar;
  List<String>? categories;
  List<String>? availableFormat;

  BookModel(
      {this.id,
      this.title,
      this.coverImageUrl,
      this.priceInDollar,
      this.categories,
      this.availableFormat});

  BookModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    coverImageUrl = json['cover_image_url'];
    priceInDollar = json['price_in_dollar'];
    categories = json['categories'].cast<String>();
    availableFormat = json['available_format'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['cover_image_url'] = this.coverImageUrl;
    data['price_in_dollar'] = this.priceInDollar;
    data['categories'] = this.categories;
    data['available_format'] = this.availableFormat;
    return data;
  }
}
