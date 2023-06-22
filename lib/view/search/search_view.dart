import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/view/search/widgets/input_search_widget.dart';
import 'package:mvvm_getx/view/search/widgets/search_button_widget.dart';



import '../../data/response/status.dart';




class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading:false,
        title: Text('search'.tr),
        elevation: 1,
      ),
      body:
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: _formkey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*.08),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InputSearchWidget(),
                      ],

                    ),
                  ),
                ),
                SizedBox(height: size.height*.02,),
                SearchButtonWidget(formKey: _formkey,)
              ],
            ),
          ),

          // const SizedBox(height: 10,),

    );
  }
}
