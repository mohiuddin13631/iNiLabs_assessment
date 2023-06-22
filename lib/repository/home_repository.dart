
import 'package:mvvm_getx/res/app_url/app_url.dart';

import '../data/network/network_api_services.dart';
import '../models/UserDetailsModel.dart';

class HomeRepository {

  final _apiService  = NetworkApiServices() ;

  Future<UserDetailsModel> userDetailsApi(String userName) async{
    dynamic response = await _apiService.getApi(AppUrl.searchUserApi(userName));
    print("response: $response");
    return UserDetailsModel.fromJson(response) ;
  }
}