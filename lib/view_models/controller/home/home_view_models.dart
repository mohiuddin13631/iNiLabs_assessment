
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../models/UserDetailsModel.dart';
import '../../../repository/home_repository.dart';

class HomeController extends GetxController {

  final _api = HomeRepository();

  final searchController = TextEditingController().obs ;

  final searchFocusNode = FocusNode().obs;

  final rxRequestStatus = Status.LOADING.obs ;

  final userDetails =UserDetailsModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(UserDetailsModel _value) => userDetails.value = _value ;
  void setError(String _value) => error.value = _value ;


  void userDetailsApi(){
  //  setRxRequestStatus(Status.LOADING);

    _api.userDetailsApi(searchController.value.text).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  void refreshApi(){

      setRxRequestStatus(Status.LOADING);

    _api.userDetailsApi(searchController.string).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}