

import 'package:get/get.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/view/full_project_view.dart';
import 'package:mvvm_getx/view/home/user_repository_view.dart';


import '../../view/home/tab_view.dart';
import '../../view/home/user_details_view.dart';

import '../../view/search/search_view.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: RouteName.searchView,
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
      name: RouteName.tabView,
      page: () => TabView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: RouteName.userRepoView,
      page: () => UserRepositoryView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
    GetPage(
      name: RouteName.fullProjectView,
      page: () => FullProjectView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ),
  ];

}