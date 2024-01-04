import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poynt_hackathon/feature/payment/success.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentWebViewPage extends StatefulWidget {
  final String paymentUrl;

  const PaymentWebViewPage({
    super.key,
    required this.paymentUrl,
  });

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 3),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 16,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: WebView(
        initialUrl: widget.paymentUrl,
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Flutter;Webview',
        onPageFinished: (String url) {
          if (url.contains("reference=")) {
            String referenceCode = url.substring(url.indexOf("reference=") + 10);
            debugPrint("REFERENCE CODE $referenceCode");
            // Navigator.pop(context, referenceCode);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const PaymentSuccessPage()),
            );
          }
          // Navigator.pop(context);
          debugPrint("ON PAGE FINISH URL $url");
        },
        navigationDelegate: (navigation) {
          //Listen for callback URL
          if (navigation.url == "") {
            // verifyTransaction(reference);
            Navigator.of(context).pop(); //close webview
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
