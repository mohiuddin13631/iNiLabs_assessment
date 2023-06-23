
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/models/UserRepositoryModel.dart';
import 'package:mvvm_getx/repository/user_git_repo_repository.dart';
import 'package:mvvm_getx/view_models/controller/home/home_view_models.dart';
import '../../../data/response/status.dart';
import '../../../models/UserDetailsModel.dart';
import '../../../repository/home_repository.dart';

class GitRepositoryViewModel extends GetxController {

  var searchResult = Get.put(HomeController());

  final _api = UserGitRepoRepository();
  // HomeController homeController = HomeController();

  final searchFocusNode = FocusNode().obs;

  final rxRequestStatus = Status.LOADING.obs ;

  // final userDetails =UserDetailsModel().obs ;
  final userRepoList = <UserRepositoryModel>[].obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(List<UserRepositoryModel> _value) => userRepoList.value = _value ;
  void setError(String _value) => error.value = _value ;

  RxString sortOption = "".obs;

  RxBool isListView = true.obs;

  RxString onTapProjectUrl = "".obs;

  void setProjectUrl(String projectName){
    onTapProjectUrl.value =  "https://github.com/${searchResult.searchController.value.text}/$projectName";
  }

  void gitUserRepoApi(){
    _api.userGirRepoApi(searchResult.searchController.value.text).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }




  void sortedGitRepoApi(){
    _api.sortedUserGitRepoApi(searchResult.searchController.value.text, sortOption.value).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }


}