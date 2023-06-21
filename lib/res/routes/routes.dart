

import 'package:get/get.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';


import '../../view/home/user_details_view.dart';

import '../../view/search/search_view.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.loginView,
      page: () => SearchView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.userDetailsView,
      page: () => UserDetailsView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: RouteName.homeView,
      page: () => UserDetailsView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
  ];

}