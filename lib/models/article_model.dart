class ArticleModel {
  final String? image;
  final String title;
  final String? subTitle;
  final String Url;

  ArticleModel(
      {required this.image, required this.title, required this.subTitle,required this.Url, });

  factory ArticleModel.fromJson(json) {
    return ArticleModel(
      image: json['urlToImage'],
      title: json['title'],
      subTitle: json['description'],
      Url: json['url'],
    );
  }
}
