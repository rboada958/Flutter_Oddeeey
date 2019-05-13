import 'package:flutter_social/ui/home/profile/models/profile.dart';

class ResponseProfile {
  bool status;
  String message;
  Profile data;

  ResponseProfile({this.status, this.message, this.data});

  ResponseProfile.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        message = map["message"],
        data = Profile.fromJsonMap(map["data"]);
}
