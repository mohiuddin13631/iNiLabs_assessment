import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){

          }, icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx((){
        switch(homeController.rxRequestStatus.value){
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if(homeController.error.value =='No internet'){
              return InterNetExceptionWidget(onPress: () {
                homeController.refreshApi();
              },
              );
            }else {
              return GeneralExceptionWidget(onPress: (){
                homeController.refreshApi();
              });
            }
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
