

import 'dart:ui';

import 'package:mvvm_getx/models/home/movie_list_model.dart';

import '../../data/network/network_api_services.dart';
import '../../models/home/user_list_model.dart';
import '../../res/app_url/app_url.dart';


class HomeRepository {

  final _apiService  = NetworkApiServices() ;

  Future<MovieListModel> movieListApi() async{
    dynamic response = await _apiService.getApi(AppUrl.moviesListApi);
    return MovieListModel.fromJson(response) ;
  }


}