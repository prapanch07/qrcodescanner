import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String result = "Result will be displayed here ..";

  Future<String> qrscan() async {
    final qrresult = await FlutterBarcodeScanner.scanBarcode(
        '#fc0303', 'cancel', true, ScanMode.QR);
    return qrresult;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () async {
                final res = await qrscan();
                setState(() {
                  result = res;
                });
              },
              color: Colors.blue,
              textColor: Colors.white,
              child: const Text("scan qr/bar code"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(result)
          ],
        ),
      ),
    );
  }
}
