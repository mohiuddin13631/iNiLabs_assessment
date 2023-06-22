import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/components/round_button.dart';


import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../res/routes/routes_name.dart';
import '../../view_models/controller/home/home_view_models.dart';

class UserDetailsView extends StatefulWidget {
  const UserDetailsView({Key? key}) : super(key: key);

  @override
  State<UserDetailsView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserDetailsView> {

  final homeController = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userDetailsApi();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,));
          case Status.ERROR:
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not Found"),
                  SizedBox(height: 10,),
                  RoundButton(
                    title: "Search again",
                    width: 130,
                    height: 40,
                    onPress: () {
                    Get.offAllNamed(RouteName.searchView);
                  },)
                ],
              ),
            );
          case Status.COMPLETED:
            return Column(
              children: [
                Text(homeController.userDetails.value.bio.toString())
              ],
            );
        }
      }),
    );
  }
}
