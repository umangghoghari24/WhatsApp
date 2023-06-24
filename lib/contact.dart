import 'package:flutter/material.dart';
import 'package:umang2/Models/contactModal.dart';
import 'package:umang2/addnumber.dart';
import 'package:umang2/contact_no.dart';
import 'package:umang2/listview2.dart';
import 'package:umang2/status.dart';

class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  List<cotactModal> myfriends = [
    cotactModal(

          title:'nirali',
          image: 'https://media.istockphoto.com/id/1399395748/photo/cheerful-business-woman-with-glasses-posing-with-her-hands-under-her-face-showing-her-smile.jpg?s=2048x2048&w=is&k=20&c=48p2zoD9WxbKWhdY9-mp0fXcqVlx2I2VePgT3Rx7dPg='

      ),
      cotactModal(

          title:'ankita',
          image: 'https://media.istockphoto.com/id/1416048929/photo/woman-working-on-laptop-online-checking-emails-and-planning-on-the-internet-while-sitting-in.webp?s=2048x2048&w=is&k=20&c=6omJSQtYXI93gG8zTc2aCJOCJrqBf-Bk8b_W-IXvy9s='
      ),
    cotactModal(
        title: 'umang',
        image:
            'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
    cotactModal(
        title: 'shail',
        image:
            'https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg'),
    cotactModal(
        title: 'jay',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdtCoCXEsYJVATCZJj8_hvkP5SmEFQ-mEcNFLcPH6Hmg&s'),
    cotactModal(
        title: 'jaydeep',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuYTPz8et6f08brD5MZAtt1ADZxgiKa3-0HwDFzyLYg&s'),
    cotactModal(
        title: 'pal',
        image:
            'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(
              width: 150,
              child: Text('Select contact'),
            ),
            SizedBox(
              width: 150,
              child: Text(
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
                  '200 contacts'),
            ),
          ],
        ),
        actions: [
          SizedBox(
              width: 50,
              child: Icon(
                Icons.search,
                color: Colors.white,
              )),
      PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text("Invite a friend")),
                      PopupMenuItem(child: Text("Contacts")),
                      PopupMenuItem(child: Text("Refresh")),
                      PopupMenuItem(child: Text("Help")),
                    ])
        ],
      ),
      // appBar: AppBar(
      //   title: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('select contact',
      //       style: TextStyle(fontSize: 20),),
      //       Text('200 contact'),
      //     ],
      //   ),
      //   actions: [
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.search,
      //           size: 26,
      //         )),
      //     PopupMenuButton(
      //         icon: Icon(Icons.more_vert),
      //         itemBuilder: (context) => [
      //               PopupMenuItem(child: Text("Invite a friend")),
      //               PopupMenuItem(child: Text("Contacts")),
      //               PopupMenuItem(child: Text("Refresh")),
      //               PopupMenuItem(child: Text("Help")),
      //             ])
      //   ],
      // ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(Icons.people),
      //         ),
      //         title: Text('New group'),
      //         onTap: () {
      //           Navigator.push(context,MaterialPageRoute(builder: (context)=>contactno()));
      //         },
      //       ),
      //       ListTile(
      //         leading: CircleAvatar(
      //           child: Icon(Icons.person_add),
      //         ),
      //         title: Text('New contact'),
      //       ),
      //
      //
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                child: Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.people),
                  ),
                  title: Text('New group'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => contactno()));
                  },
                ),
                ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person_add),
                  ),
                  title: Text('New contact'),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>addnumber()));
                  },
                ),
              ],
            )),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: myfriends.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      backgroundImage:
                          NetworkImage(myfriends[index].image ?? ''),
                    ),
                    title: Text(myfriends[index].title ?? ''),
                    subtitle: Text("few minutes ago"),
                  );
                },
              ),
            ),
          ],
        ),
      ),


    );
  }
}
