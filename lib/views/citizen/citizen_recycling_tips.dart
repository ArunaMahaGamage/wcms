import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wcms/core/routes.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class CitizenRecyclingTips extends StatefulWidget {
  const CitizenRecyclingTips({Key? key}) : super(key: key);

  @override
  State<CitizenRecyclingTips> createState() => _CeaWebViewPageState();
}

class _CeaWebViewPageState extends State<CitizenRecyclingTips> {
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
        Uri.parse("https://www.recycleacrossamerica.org/tips-to-recycle-right?srsltid=AfmBOopp9NcoNoItjnp0lG_4fxSUpelhoZeXxRjB0AnaA9NQuMkiaoYb"),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back), onPressed: () => Future.microtask(() => Navigator.pushReplacementNamed(context, Routes.dashboardCitizen))
        ),
        title: const Text("Recycling Tips"),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}