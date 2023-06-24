import 'package:flutter/material.dart';
import 'package:umang2/chats.dart';
import 'package:umang2/status.dart';
import 'package:umang2/videocall.dart';

class Mytabs extends StatefulWidget {
  const Mytabs({Key? key}) : super(key: key);

  @override
  State<Mytabs> createState() => _MytabsState();
}

class _MytabsState extends State<Mytabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Watshapp"),
          bottom: TabBar(tabs: [
            Text('Chats'),
            Text('Status'),
            Text('Calls'),
          ]),
        ),
        body: TabBarView(
          children: [
            Chats(),
            status(),
            videocall()
          ],
        ),
      ),
    );
  }
}
