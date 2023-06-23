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
    var size = MediaQuery.of(context).size;
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
            var userInfo = homeController.userDetails.value;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image:DecorationImage(image: NetworkImage(userInfo.avatarUrl.toString()))
                      ),
                  ),
                  SizedBox(height: size.height*.02,),
                  Text(userInfo.name.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text(userInfo.login.toString(),style: TextStyle(fontSize: 16,color: Colors.black26)),
                  SizedBox(height: size.height*.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      Text("${userInfo.followers} followers"),
                      SizedBox(width: 5,),
                      CircleAvatar(backgroundColor: Colors.black54,maxRadius: 7),
                      SizedBox(width: 5,),
                      Text("${userInfo.following} following"),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("bio",style: TextStyle(fontSize: 20,color: Colors.black54),),
                  SizedBox(height: size.height*.01,),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(homeController.userDetails.value.bio.toString(),style: TextStyle(fontSize: 16),),
                  ),
                  SizedBox(height: size.height*.05,)
                ],
              ),
            );
        }
      }),
    );
  }
}
