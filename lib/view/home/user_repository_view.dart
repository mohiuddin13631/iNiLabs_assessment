import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/components/round_button.dart';
import 'package:mvvm_getx/view_models/controller/home/repository_view_model.dart';


import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../res/routes/routes_name.dart';
import '../../view_models/controller/home/home_view_models.dart';

class UserRepositoryView extends StatefulWidget {
  const UserRepositoryView({Key? key}) : super(key: key);

  @override
  State<UserRepositoryView> createState() => _UserDetailsViewState();
}

class _UserDetailsViewState extends State<UserRepositoryView> {

  final gitRepoViewModel = Get.put(GitRepositoryViewModel());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gitRepoViewModel.gitUserRepoApi();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: BoxDecoration(
              // color: Colors.grey,
              border: Border(
                bottom: BorderSide(color: Colors.grey)
              )
            ),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Text("Git Repositories",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Spacer(),
                IconButton(onPressed: () {
                  
                }, icon: Icon(Icons.list)),

              ],
            ),
          ),
          Expanded(
            child: Obx((){
              switch(gitRepoViewModel.rxRequestStatus.value){
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator(color: Theme.of(context).colorScheme.secondary,));
                case Status.ERROR:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("No repository"),
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
                  return Container(
                    height: double.infinity,
                    child: ListView.builder(
                      itemCount: gitRepoViewModel.userRepoList.length,
                      itemBuilder: (context, index) {
                        return Text(gitRepoViewModel.userRepoList.value[index].name.toString());
                      },
                    ),
                  );
              }
            }),
          ),
        ],
      ),
    );
  }
}
