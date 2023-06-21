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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading:false,
        title: Text('Serach'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  InputSearchWidget(),
                ],
              ),
            ),

            const SizedBox(height: 40,),
            SearchButtonWidget(formKey: _formkey,)
          ],
        ),
      ),
    );
  }
}
