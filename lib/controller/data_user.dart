import 'dart:developer';

class User {
  final String id;
  final String ucode;
  final String rcode;
  final String header;
  final String profile;
  final String? timezone;
  final String nickname;
  final bool? firstprofile;

  const User(
      {required this.id,
      required this.ucode,
      required this.rcode,
      required this.header,
      required this.profile,
      required this.timezone,
      required this.nickname,
      required this.firstprofile});

  factory User.fromJson(Map<String, dynamic> json) {
    log(json.toString());
    return User(
        id: json['error']['id'],
        ucode: json['error']['ucode'],
        rcode: json['error']['rcode'],
        header: json['error']['header'],
        profile: json['error']['profile'],
        timezone: json['error']['timezone'] ?? 'Asia/Makassar',
        nickname: json['error']['nickname'],
        firstprofile: json['error']['firstprofile'] ?? false);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ucode'] = ucode;
    data['rcode'] = rcode;
    data['header'] = header;
    data['profile'] = profile;
    data['timezone'] = timezone;
    data['nickname'] = nickname;
    data['firstprofile'] = firstprofile;
    return data;
  }
}
