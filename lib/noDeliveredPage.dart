import 'package:flutter/material.dart';

class NotDeliveredPage extends StatefulWidget {
  final int shipId;
  const NotDeliveredPage({
    super.key,
    required this.shipId
  });

  @override
  State<NotDeliveredPage> createState() => _NotDeliveredPageState();
}

class _NotDeliveredPageState extends State<NotDeliveredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 156, 45, 37),
    );
  }
}