import 'package:learning_way/model/user.dart';
import 'package:rxdart/rxdart.dart';

class NativeData {
  static Observable<User> login(String phone, String pwd) {
    var userjson = {
      'userId': 1,
      'nickname': '爱恨情仇',
      'avatar': '',
      'token': 'dsadasdas6d',
      'phone': '15077541767'
    };
    
    return Observable.just(userjson).map<User>((user)=>User.fromJson(user));
  }
}
