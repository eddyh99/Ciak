import 'dart:convert';

import 'data_media.dart';

class Postfeed {
  final String ucode;
  final String nickname;
  final String? job;
  final String? profile;
  final String? header;
  final String? post_id;
  final String? description;
  final String? type;
  final String? post_time;
  final String? is_rating;
  final String? post_rating;
  final String? total_rating;
  final Postmedia media;
  final String? is_like;
  final String? is_bookmark;
  final String? is_paid_special;
  final String? is_paydownload;
  final String? post_price;
  final String? num_like;
  final String? post_currency;
  final String? status_admin;
  final String? status;
  final String? ext;

  const Postfeed(
      {required this.ucode,
      required this.nickname,
      required this.job,
      required this.profile,
      required this.header,
      required this.post_id,
      required this.description,
      required this.type,
      required this.post_time,
      required this.is_rating,
      required this.post_rating,
      required this.total_rating,
      required this.media,
      required this.is_like,
      required this.is_bookmark,
      required this.is_paid_special,
      required this.is_paydownload,
      required this.post_price,
      required this.num_like,
      required this.post_currency,
      required this.status_admin,
      required this.status,
      required this.ext});

  factory Postfeed.fromJson(Map<String, dynamic> jsons) {
    return Postfeed(
        ucode: jsons['data']['ucode'],
        nickname: jsons['data']['nickname'],
        job: jsons['data']['job'],
        profile: jsons['data']['profile'],
        header: jsons['data']['header'] ?? 'Asia/Makassar',
        post_id: jsons['data']['post_id'],
        description: jsons['data']['description'],
        type: jsons['data']['type'],
        post_time: jsons['data']['post_time'],
        is_rating: jsons['data']['is_rating'],
        post_rating: jsons['data']['post_rating'],
        total_rating: jsons['data']['total_rating'] ?? 'Asia/Makassar',
        media: Postmedia.fromJson(jsons['data']['media']),
        is_like: jsons['data']['is_like'],
        is_bookmark: jsons['data']['is_bookmark'],
        is_paid_special: jsons['data']['is_paid_special'],
        is_paydownload: jsons['data']['is_paydownload'],
        post_price: jsons['data']['post_price'],
        post_currency: jsons['data']['post_currency'],
        num_like: jsons['data']['num_like'],
        status_admin: jsons['data']['status_admin'],
        status: jsons['data']['status'],
        ext: jsons['data']['ext']);
  }
}
