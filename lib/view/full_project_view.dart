import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../view_models/controller/home/repository_view_model.dart';

class FullProjectView extends StatefulWidget {
  FullProjectView({Key? key,}) : super(key: key);


  @override
  State<FullProjectView> createState() => _FullProjectViewState();
}

class _FullProjectViewState extends State<FullProjectView> {

  final gitRepoViewModel = Get.put(GitRepositoryViewModel());

  WebViewController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(gitRepoViewModel.onTapProjectUrl.toString()));
      // ..loadRequest(Uri.parse("https://docs.flutter.dev/cookbook/design/fonts"));
  }

  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
          controller: controller!),
    );
  }
}