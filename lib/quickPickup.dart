import 'package:beonecouriers/controllers/scanner_controller.dart';
import 'package:beonecouriers/includes/barCard.dart';
import 'package:beonecouriers/includes/pageLabel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'includes/menuTabs.dart';

class QuickPickupPage extends StatefulWidget {
  const QuickPickupPage({super.key});

  @override
  State<QuickPickupPage> createState() => _QuickPickupPageState();
}

class _QuickPickupPageState extends State<QuickPickupPage> {


  ScannerActionController scannerActionController = Get.put(ScannerActionController());

  TextEditingController awbEditingcontroller = TextEditingController();

  String? awbScanned;

  Future scanBarcode() async {
      String awbScanned;
      try {
        awbScanned = await FlutterBarcodeScanner.scanBarcode(
            "#ff6666", "Cancel", true, ScanMode.BARCODE);
              // awbScanned = "BEO1929038202";
      //  changeStatus(awbScanned);
      } catch (e) {
        throw e.toString();
      }
      if(!mounted) return ;

      setState( () => awbEditingcontroller.text  = awbScanned);
     
    }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BarCard(),
          const PageLabel(subject: "Scan the shipments "),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text("Scanned Shipment"),
                  const SizedBox(height: 10),
                   TextField(
                    controller:  awbEditingcontroller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'AWB',
                      prefixIcon: Icon(Icons.topic),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () => scannerActionController.pickedUp(awbEditingcontroller.text),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 14, 130, 68),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Text(
                            'Pick Scanned',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed:  () => scanBarcode() ,
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 73, 25, 144),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          child: const Text(
                            ' Open Scanner',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const MenuTabs(selectedIndex: 0),
        ],
      ),
    );
  }
}
