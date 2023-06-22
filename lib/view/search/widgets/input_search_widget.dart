

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
          Utils.snackBar('Search', 'user_hint'.tr,);
        }
      },
      cursorColor: Theme.of(context).colorScheme.secondary,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(15)
        ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary,width: 1.5),
              borderRadius: BorderRadius.circular(15),
          ),
          hintText: 'user_hint'.tr,
          hintStyle: TextStyle(color:Theme.of(context).colorScheme.secondary),
          border: OutlineInputBorder(),
      ),
    );
  }
}
