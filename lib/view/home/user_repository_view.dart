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
  var sortBy = "name";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Obx(() => Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
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
                  gitRepoViewModel.isListView.value = !gitRepoViewModel.isListView.value;
                }, icon: Icon(gitRepoViewModel.isListView.value? Icons.list:Icons.grid_view_rounded)),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  margin: EdgeInsets.symmetric(vertical: 3,horizontal: 2),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)
                  ),
                  child: DropdownButton(
                    value: gitRepoViewModel.sortOption.value,
                    elevation: 10,
                    items: const [
                      DropdownMenuItem(child: Text("Last Updated"),value: "",),
                      DropdownMenuItem(child: Text("Name"),value: "name",),
                      DropdownMenuItem(child: Text("Stars"),value: "stargazers",),
                    ], onChanged: (value) {
                    gitRepoViewModel.sortOption.value = value.toString();
                    gitRepoViewModel.sortedGitRepoApi();
                  },),
                ),
                const SizedBox(width: 5,)
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
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: gitRepoViewModel.isListView.value? ListView.builder(
                      itemCount: gitRepoViewModel.userRepoList.length,
                      itemBuilder: (context, index) {
                        var gitRepo = gitRepoViewModel.userRepoList.value[index];
                        return InkWell(
                          onTap: () {
                            gitRepoViewModel.setProjectUrl(gitRepo.name.toString());
                            Get.toNamed(RouteName.fullProjectView);
                            // gitRepoViewModel.onTapProjectUrl.value = gitRepo.name.toString();
                          },
                          child: Card(
                              child: ListTile(
                                title: Row(
                                  children: [
                                    Text(gitRepoViewModel.userRepoList.value[index].name.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                    SizedBox(width: 11,),
                                    Container(
                                        padding: EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(7),
                                            border: Border.all(color: Colors.black54)
                                        ),
                                        child: Text(gitRepo.visibility.toString(),style: TextStyle(fontSize: 13),))
                                  ],
                                ),
                                subtitle: Row(
                                  children: [
                                    CircleAvatar(backgroundColor: Colors.tealAccent,maxRadius: 5),
                                    SizedBox(width: 11,),
                                    Text(gitRepo.language.toString())
                                  ],
                                ),
                              )
                          ),
                        );
                      },
                    )
                    :
                    GridView.builder(
                      itemCount: gitRepoViewModel.userRepoList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          var gitRepo = gitRepoViewModel.userRepoList.value[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(gitRepo.name.toString(),style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                                  SizedBox(height: size.height * .015,),
                                  Row(
                                    children: [
                                      CircleAvatar(backgroundColor: Colors.tealAccent,maxRadius: 5),
                                      SizedBox(width: 11,),
                                      Text(gitRepo.language.toString(),style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                                      SizedBox(width: 10,),
                                      Container(
                                          padding: EdgeInsets.all(3),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(7),
                                              border: Border.all(color: Colors.black54)
                                          ),
                                          child: Text(gitRepo.visibility.toString(),style: TextStyle(fontSize: 13,color: Colors.black54,fontWeight: FontWeight.w500),))
                                    ],
                                  ),
                                  SizedBox(height: size.height * .015,),
                                  Text(gitRepo.allowForking.toString() == 'true'? "Allow Fork" : "Not allow fork"),
                                  SizedBox(height: size.height * .015,),
                                  Text("Fork Count: ${gitRepo.forks.toString()}")
                                ],
                              ),
                            ),
                          );
                        },
                    ),
                  );
              }
            }),
          ),
        ],
      ),)
    );
  }
}

// pushed in another name
//changed git account
