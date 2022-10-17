class Postmedia {
  final String id;
  final String id_post;
  final String media;
  final String type;

  const Postmedia(
      {required this.id,
      required this.id_post,
      required this.media,
      required this.type});

  factory Postmedia.fromJson(Map<String, dynamic> json) {
    return Postmedia(
      id: json['data']['media']['id'],
      id_post: json['data']['media']['id_post'],
      media: json['data']['media']['media'],
      type: json['data']['media']['type'],
    );
  }
}
