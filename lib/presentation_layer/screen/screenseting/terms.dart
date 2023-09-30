import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndConditionsPage extends StatefulWidget {
  @override
  State<TermsAndConditionsPage> createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        // onNavigationRequest: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.youtube.com/')) {
        //     return NavigationDecision.prevent;
        //   }
        //   return NavigationDecision.navigate;
        // },
      ),
    )
    ..loadRequest(Uri.parse(
        'https://portfolio-b0317.web.app/elegent-pet-care/terms-app.html'));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
