import 'package:flutter/material.dart';
class personalstatus extends StatefulWidget {
  const personalstatus({Key? key}) : super(key: key);

  @override
  State<personalstatus> createState() => _personalstatusState();
}

class _personalstatusState extends State<personalstatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              contentPadding:
              EdgeInsets.only(left: 5, right: 5,top: 50),
             // icon: Icon(Icons.mic)
            ),
          ),


        ],
      ),

    );
  }
}
