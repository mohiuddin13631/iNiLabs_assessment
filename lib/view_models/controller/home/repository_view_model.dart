
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/models/UserRepositoryModel.dart';
import 'package:mvvm_getx/repository/user_git_repo_repository.dart';
import '../../../data/response/status.dart';
import '../../../models/UserDetailsModel.dart';
import '../../../repository/home_repository.dart';

class GitRepositoryViewModel extends GetxController {

  final _api = UserGitRepoRepository();

  final searchController = TextEditingController().obs ;

  final searchFocusNode = FocusNode().obs;

  final rxRequestStatus = Status.LOADING.obs ;

  // final userDetails =UserDetailsModel().obs ;
  final userRepoList = <UserRepositoryModel>[].obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(List<UserRepositoryModel> _value) => userRepoList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void gitUserRepoApi(){
    //  setRxRequestStatus(Status.LOADING);

    // _api.userGirRepoApi(searchController.value.text).then((value){
    _api.userGirRepoApi("mohiuddin13631").then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}