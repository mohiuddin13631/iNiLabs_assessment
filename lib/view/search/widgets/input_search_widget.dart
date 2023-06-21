

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../view_models/controller/home/home_view_models.dart';

class InputSearchWidget extends StatelessWidget {
   InputSearchWidget({Key? key}) : super(key: key);

  final homeVM = Get.put(HomeController()) ;

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: homeVM.searchController.value,

      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar('Search', 'Enter user name');
        }
      },
      decoration: InputDecoration(
          hintText: 'user_hint'.tr,
          border: OutlineInputBorder()
      ),
    );
  }
}
