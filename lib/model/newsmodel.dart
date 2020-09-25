class NewsModel {
  String newstitle;
  int newslike;

  DateTime newsdate;

  NewsModel({
    this.newstitle,
    this.newslike,
    this.newsdate,
  });
  NewsModel.fromMap(Map<String, dynamic> map) {
    this.newstitle = map['newstitle'];
    this.newslike = map['newslike'];
    this.newsdate = map['newsdate'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'newstitle': this.newstitle,
      'newslike': this.newslike,
      'newsdate': this.newsdate,
    };
  }
}
