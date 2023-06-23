import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/view/home/user_details_view.dart';
import 'package:mvvm_getx/view/home/user_repository_view.dart';
import 'package:mvvm_getx/view_models/controller/theme_controller.dart';

import '../../res/colors/app_color.dart';
import '../search/search_view.dart';
class TabView extends StatefulWidget {
  const TabView({Key? key}) : super(key: key);

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> with SingleTickerProviderStateMixin{
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this,initialIndex: 0);
  }

  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(RouteName.searchView);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Get.offAllNamed(RouteName.searchView);
          }, icon: Icon(Icons.arrow_back)),
          // title: Text("GitHub",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
          title: Text("GitHub",),
          elevation: 0,
          centerTitle: true,
          actions: [
            Obx(() =>
                IconButton(onPressed: () {
                  themeController.isLight.value = !themeController.isLight.value;
                }, icon: Icon(themeController.isLight.value == true ? Icons.wb_sunny : Icons.nights_stay))
            ),
            TextButton(onPressed: () {
              Get.offAllNamed(RouteName.searchView);
            }, child: Text("Search",style: TextStyle(color: Theme.of(context).colorScheme.secondary),))

          ],
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TabBar(
                      labelColor: Theme.of(context).colorScheme.secondary,
                      automaticIndicatorColorAdjustment: true,
                      // indicator: ,
                      controller: tabController,
                      unselectedLabelColor: Colors.grey,
                      indicator: BoxDecoration(
                          color: Colors.grey,
                        borderRadius: BorderRadius.circular(5)
                      ),
                      // indicatorColor: Colors.purpleAccent,
                      // isScrollable: true,
                      tabs: const [
                        Tab(
                          text: "User Overview",
                        ),
                        Tab(
                          text: "Repository",
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 12,
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      UserDetailsView(),
                      UserRepositoryView()
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}