import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentSuccessPage extends StatefulWidget {
  const PaymentSuccessPage({super.key});

  @override
  State<PaymentSuccessPage> createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
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
        automaticallyImplyLeading: true,
      ),
      body: const Center(
        child: Text(
          'Payment Success',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
