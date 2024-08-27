import 'package:flutter/material.dart';

class PageLabel extends StatefulWidget {
  final String subject  ;
   const PageLabel({
    super.key ,
    required this.subject 
    });

  @override
  State<PageLabel> createState() => _PageLabelState();
}

class _PageLabelState extends State<PageLabel> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height:80,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text( widget.subject , style: TextStyle(fontWeight: FontWeight.bold , color: Theme.of(context).primaryColor , fontSize: 18),),
            ),
          );
  }
}