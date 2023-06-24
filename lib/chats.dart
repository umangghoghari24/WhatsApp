import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:umang2/contact.dart';
import 'package:umang2/personalchat.dart';
import 'package:umang2/Models/contactModal.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {

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
      body: Center(
        child:isloaded?Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.black54,),
            Text('Loading',style: TextStyle(fontSize: 15,)),
            SizedBox(height: 20,)
            ],
        ):
        ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context,index){
                  return ListTile(
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
                  // return Container(
                  //   child: ListTile(
                  //     onTap: (){
                  //       Navigator.push(context,MaterialPageRoute(builder: (context)=>Personalchat()));
                  //     },
                  //     leading: CircleAvatar(
                  //       backgroundImage: NetworkImage(myfriends[index].image??'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                  //       radius: 30,
                  //       backgroundColor: Colors.green,
                  //     ),
                  //     title: Text(myfriends[index].title??''),
                  //     subtitle: Text('Sent'),
                  //     trailing: Column(
                  //       children: [
                  //        Text("12:00"),
                  //         SizedBox(height: 5,),
                  //         Container(
                  //           width: 22,
                  //           height: 22,
                  //           decoration: const BoxDecoration(
                  //             color: Colors.green,
                  //             borderRadius: BorderRadius.all(Radius.circular(20))
                  //           ),
                  //           child: const Center(
                  //             child: Text("12",style: TextStyle(
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.white
                  //             ),),
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // );
                }
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)=>contact()));
        },
        child: Icon(Icons.chat),
    ),
    );
  }
}
