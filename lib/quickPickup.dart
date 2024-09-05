import 'package:beonecouriers/includes/barCard.dart';
import 'package:beonecouriers/includes/pageLabel.dart';
import 'package:flutter/material.dart';

import 'includes/menuTabs.dart';

class QuickPickupPage extends StatefulWidget {
  const QuickPickupPage({super.key});

  @override
  State<QuickPickupPage> createState() => _QuickPickupPageState();
}

class _QuickPickupPageState extends State<QuickPickupPage> {
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
                  const TextField(
                    decoration: InputDecoration(
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
                          onPressed: (() {}),
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
                          onPressed: (() {}),
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
