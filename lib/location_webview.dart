import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trip_script/consts/snackbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocationWebview extends StatefulWidget {
  const LocationWebview({super.key, required this.url});

  final String url;

  @override
  State<LocationWebview> createState() => _LocationWebviewState();
}

class _LocationWebviewState extends State<LocationWebview> {
  late final PlatformWebViewControllerCreationParams params;

  @override
  void initState() {
    super.initState();
    params = const PlatformWebViewControllerCreationParams();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String url = widget.url;
    if (url.toLowerCase() == 'n/a') {
      Navigator.pop(context);
      showCustomSnackbar('Link Not Available', context);
    }

    return Scaffold(
      body: WebViewWidget(
        controller: WebViewController.fromPlatformCreationParams(params)
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(Colors.white)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {
                log('Error: ${error.description}');
                log('URL: $url');
              },
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(
            Uri.parse(url),
          ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          width: double.infinity,
          height: 100.h,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.black,
          ),
          child: Text(
            'Back to App',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
