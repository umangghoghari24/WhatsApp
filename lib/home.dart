import 'package:flutter/material.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  var i=0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar: AppBar(
    title: Text('Welcome to flutter App'),
    ),

    body:  Center(child: Text('$i',
    style: TextStyle(
      fontSize: 60,
      color: Colors.purple,
    ),
    )),


    floatingActionButton: FloatingActionButton(
    child: Icon(Icons.add),
    onPressed: (){
    setState(() {
      i+=1;
    });
    },
    ),
    );
    
    }
}

