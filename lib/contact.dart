import 'package:flutter/material.dart';
import 'package:umang2/Models/contactModal.dart';
import 'package:umang2/addnumber.dart';
import 'package:umang2/contact_no.dart';
import 'package:umang2/listview2.dart';
import 'package:umang2/personal%20sms.dart';
import 'package:umang2/status.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';


class contact extends StatefulWidget {
  const contact({Key? key}) : super(key: key);

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> {
  List<Contact> contacts=[];
  bool isloaded= false;

  void getContacts() async{

    if(await Permission.contacts.isGranted){
      List<Contact> tmp_contacts = await ContactsService.getContacts( );
      setState(() {
        contacts=tmp_contacts;
      });
    }else{
      Permission.contacts.request();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContacts();
    setState(() {
      isloaded = true;
    });
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        isloaded=false;
      });
    });
  }
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
                  )
            ),
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
      body: Center(
            child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context,index){
                  return ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>personalsms(contacts: contacts[index])));
                    },
                    leading: (contacts[index].avatar!=null)! && contacts[index].avatar!.length>0?
                    CircleAvatar(
                      backgroundColor: Colors.black,
                    ):
                    CircleAvatar(
                      child:  Text(contacts[index].initials()),
                    ),
                    title:  Text(contacts[index].displayName.toString()),
                    subtitle: Text(contacts[index].phones!.isEmpty?'':contacts[index].phones![0].value!),
                  );
                }
            ),
          ),
    );
  }


  // @override
  // Widget build(BuildContext context) {
  //  return Scaffold(
  //     body: SingleChildScrollView(
  //       child: Column(
  //         children: [
  //           SizedBox(
  //               child: Column(
  //             children: [
  //               ListTile(
  //                 leading: CircleAvatar(
  //                   child: Icon(Icons.people),
  //                 ),
  //                 title: Text('New group'),
  //                 onTap: () {
  //                   Navigator.push(context,
  //                       MaterialPageRoute(builder: (context) => contactno()));
  //                 },
  //               ),


  //               ListTile(
  //                 leading: CircleAvatar(
  //                   child: Icon(Icons.person_add),
  //                 ),
  //                 title: Text('New contact'),
  //                 onTap: () {
  //                   Navigator.push(context, MaterialPageRoute(builder: (context)=>addnumber()));
  //                 },
  //               ),
  //             ],
  //           )),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
