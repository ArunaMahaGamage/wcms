import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wcms/core/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class CitizenEnvironmentImpact extends StatefulWidget {
  const CitizenEnvironmentImpact({Key? key}) : super(key: key);

  @override
  State<CitizenEnvironmentImpact> createState() => _CeaWebViewPageState();
}

class _CeaWebViewPageState extends State<CitizenEnvironmentImpact> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) {
      WebViewPlatform.instance = AndroidWebViewPlatform();
    } else if (Platform.isIOS) {
      WebViewPlatform.instance = WebKitWebViewPlatform();
    }

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse("https://en.wikipedia.org/wiki/Environmental_issues_in_Sri_Lanka"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen))
        ),
        title: const Text("Environmental Impact"),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}