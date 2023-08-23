import 'package:flutter/material.dart';
import 'package:umang2/chats.dart';
import 'package:umang2/main.dart';
import 'package:umang2/sliverAppBar.dart';
import 'package:umang2/status.dart';
import 'package:umang2/videocall.dart';

class listview2 extends StatefulWidget {
  const listview2({Key? key}) : super(key: key);
  @override
  State<listview2> createState() => _listview2State();
}

class _listview2State extends State<listview2> {

  var pages=[
    Chats(),
    status(),
    videocall(),
  ];

  var current_index=0;
  bool showsliverAppBar = true;
  late TabController tabController;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actionsIconTheme: IconThemeData(color: Colors.black),
          title: Text('Whatsapp'),
          bottom: TabBar(tabs: [
            Row(
              children: [
                Tab(text:"chats "),
                Container(
                    child: Text('5'),
                    decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    )
                ),
              ],
            ),
            Row(
              children: [
                Tab(text:"Status"),
                Icon(Icons.radio_button_unchecked),
              ],
            ),
            Tab(text:"calls"),
           ]
          ),
          actions: [
            Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cameraapp()));
                },
                    icon: Icon(Icons.camera_alt_outlined),
                color: Colors.white,),
                IconButton(onPressed: (){
                  // print('Enter friend name');
                  setState(() {
                    showsliverAppBar = !showsliverAppBar;
                  });
                },
                    icon: Icon(Icons.search),
                color: Colors.white,),
                PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                    color: Colors.white,
                    itemBuilder: (context)=>[
                      PopupMenuItem(child: Text("New group")),
                      PopupMenuItem(child: Text("New Broadcast")),
                      PopupMenuItem(child: Text("Linked devices")),
                      PopupMenuItem(child: Text("Starred messages")),
                      PopupMenuItem(child: Text("Payments")),
                      PopupMenuItem(child: Text("Settings")),
                    ]
                )
                // IconButton(onPressed: (){
                //   print('more option');
                // },
                //   icon: Icon(Icons.more_vert)),
              ],
            ),
          ],
        ),
          body: TabBarView(
            // controller: tabController,
            children: pages,
            // Chats(),
              // status(),
              // videocall(),
              //
          ),
        // bottomNavigationBar: BottomNavigationBar(
        //   selectedItemColor: Colors.red,
        //   currentIndex: current_index,
        //   onTap: (index){
        //     setState(() {
        //       current_index=index;
        //     });
        //   },
        //   items:  [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.chat),
        //       label: 'Chats',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.adjust_rounded),
        //       label: 'Status',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.video_call),
        //       label: 'Video call',
        //     )
        //
        //   ],
        //
        // ),
      ),
    );
  }
}



