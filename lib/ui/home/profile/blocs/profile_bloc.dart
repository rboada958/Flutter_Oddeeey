import 'package:flutter_social/ui/home/profile/models/response_profile.dart';
import 'package:flutter_social/ui/home/profile/respository/repository_profile.dart';
import 'package:rxdart/rxdart.dart';

class ProfileBloc {
  final _repository = RepositoryProfile();
  final _getProfile = PublishSubject<ResponseProfile>();

  Observable<ResponseProfile> get profile => _getProfile.stream;

  getProfile(token) async {
    ResponseProfile profile = await _repository.getProfile(token);
    _getProfile.sink.add(profile);
  }

  dispose() {
    _getProfile.close();
  }
}

final profileBloc = ProfileBloc();
