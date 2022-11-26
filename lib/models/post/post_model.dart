class PostModel {
  late String? ucode;
  late String? nickname;
  late String? job;
  late String? profile;
  late String? header;
  late String? postId;
  late String? description;
  late String? type;
  late String? postTime;
  late String? isRating;
  late String? postRating;
  late String? totalRating;
  late List media;
  late String? isLike;
  late String? isBookmark;
  late String? isPaidSpecial;
  late String? isPayDownload;
  late String? postPrice;
  late String? postCurrency;
  late String? numLike;
  late String? statusAdmin;
  late String? status;

  PostModel(
    this.ucode,
    this.nickname,
    this.job,
    this.profile,
    this.header,
    this.postId,
    this.description,
    this.type,
    this.postTime,
    this.isRating,
    this.postRating,
    this.totalRating,
    this.media,
    this.isLike,
    this.isBookmark,
    this.isPaidSpecial,
    this.isPayDownload,
    this.postPrice,
    this.postCurrency,
    this.numLike,
    this.statusAdmin,
    this.status,
  );

  factory PostModel.fromJson(Map<String, dynamic> map) => PostModel(
      map["ucode"],
      map["nickname"],
      map["job"],
      map["profile"],
      map["header"],
      map["post_id"],
      map["description"],
      map["type"],
      map["post_time"],
      map["is_rating"],
      map["post_rating"],
      map["total_rating"],
      map["media"],
      map["is_like"],
      map["is_bookmark"],
      map["is_paid_special"],
      map["is_pay_download"],
      map["post_price"],
      map["post_currency"],
      map["num_like"],
      map["status_admin"],
      map["status"]);
}
