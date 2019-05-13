import 'package:flutter_social/ui/home/profile/api/api.dart';
import 'package:flutter_social/ui/home/profile/models/response_profile.dart';

class RepositoryProfile {
  final apiProvider = API();

  Future<ResponseProfile> getProfile(token) => apiProvider.getProfile(token);
}
