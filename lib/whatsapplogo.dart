import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umang2/chats.dart';
import 'package:umang2/listview2.dart';
import 'package:umang2/main.dart';
import 'package:umang2/status.dart';
class logo extends StatefulWidget {
  const logo({Key? key}) : super(key: key);

  @override
  State<logo> createState() => _logoState();
}

class _logoState extends State<logo> {
  bool loaded= false;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      loaded = true;
    });
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>listview2()));
      setState(() {
        loaded = false;
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 320,),
            Container(
              decoration: BoxDecoration(
              image: DecorationImage(
              image: AssetImage("aseets/images/whatsapplogo.jpg",),
                  fit: BoxFit.contain),
    ),
             height: 80,
             //  height: MediaQuery.of(context).size.height-100,
              // width: MediaQuery.of(context).size.width-320,
            ),
            Text('Whatsapp'),
            SizedBox(height: 280,),
            Text('Form',
                        style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(height: 8,),
            Text('Flutter')
          ],
        ),
      ),
    );
  }
}
