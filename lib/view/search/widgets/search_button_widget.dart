

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/res/theme/my_theme.dart';
import 'package:mvvm_getx/view_models/controller/home/home_view_models.dart';

import '../../../res/components/round_button.dart';


class SearchButtonWidget extends StatelessWidget {
  final formKey ;
   SearchButtonWidget({Key? key , required this.formKey}) : super(key: key);

  final searchVM = Get.put(HomeController()) ;

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      buttonColor: MyTheme.buttonColor,
        width: 150,
        height: 45,
        title: 'Search'.tr,
        // loading: searchVM.loading.value,
        onPress: (){
          if(formKey.currentState!.validate()){
            // Get.toNamed(RouteName.userDetailsView);
            Get.toNamed(RouteName.tabView);
          }
        }
    );
  }
}
