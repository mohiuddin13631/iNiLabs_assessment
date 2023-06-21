
import 'package:get/get.dart';
import 'package:mvvm_getx/models/home/movie_list_model.dart';

import '../../../data/response/status.dart';
import '../../../models/home/user_list_model.dart';
import '../../../repository/home_repository/hone_repository.dart';

class HomeController extends GetxController {

  final _api = HomeRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final moveList =MovieListModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(MovieListModel _value) => moveList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void movieListApi(){
  //  setRxRequestStatus(Status.LOADING);

    _api.movieListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  void refreshApi(){

      setRxRequestStatus(Status.LOADING);

    _api.movieListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}