
import 'package:mvvm_getx/models/UserRepositoryModel.dart';
import 'package:mvvm_getx/res/app_url/app_url.dart';

import '../data/network/network_api_services.dart';
import '../models/UserDetailsModel.dart';

class UserGitRepoRepository {

  final _apiService  = NetworkApiServices() ;

  Future<List<UserRepositoryModel>> userGirRepoApi(String userName) async{

    UserRepositoryModel? userRepositoryModel;
    List<UserRepositoryModel> myList = [];

    dynamic response = await _apiService.getApi(AppUrl.gitUserRepoApi(userName));

    for(var i in response){
      userRepositoryModel = UserRepositoryModel.fromJson(i);
      myList.add(userRepositoryModel);
    }

    print("response: $response");
    return myList;
  }


  Future<List<UserRepositoryModel>> sortedUserGitRepoApi(String userName,String sortOption) async{

    UserRepositoryModel? userRepositoryModel;
    List<UserRepositoryModel> myList = [];

    dynamic response = await _apiService.getApi(AppUrl.sortedGitUserRepoApi(userName, sortOption));

    for(var i in response){
      userRepositoryModel = UserRepositoryModel.fromJson(i);
      myList.add(userRepositoryModel);
    }

    print("response: $response");
    return myList;
  }
}