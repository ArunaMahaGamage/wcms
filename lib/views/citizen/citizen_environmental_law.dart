import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wcms/core/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class CitizenEnvironmentalLawScreen extends StatefulWidget {
  const CitizenEnvironmentalLawScreen({Key? key}) : super(key: key);

  @override
  State<CitizenEnvironmentalLawScreen> createState() => _CeaWebViewPageState();
}

class _CeaWebViewPageState extends State<CitizenEnvironmentalLawScreen> {
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
        Uri.parse("https://www.cea.lk/web/en/acts-regulations"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen))
        ),
        title: const Text("CEA Acts & Regulations"),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}