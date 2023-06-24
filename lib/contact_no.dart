import 'package:flutter/material.dart';
import 'package:umang2/Models/contactModal.dart';
 import 'package:umang2/Models/contactcard.dart';

class contactno extends StatefulWidget {
  const contactno({Key? key}) : super(key: key);

  @override
  State<contactno> createState() => _contactnoState();
}


class _contactnoState extends State<contactno> {
  List<cotactModal> group=[];
  List<cotactModal> myfriends =[
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
        image: 'https://images.unsplash.com/photo-1544723795-3fb6469f5b39?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'
    ),
    cotactModal(
        title: 'shail',
        image: 'https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg'
    ),
    cotactModal(
        title: 'jay',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdtCoCXEsYJVATCZJj8_hvkP5SmEFQ-mEcNFLcPH6Hmg&s'
    ),
    cotactModal(
        title: 'jaydeep',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQTuYTPz8et6f08brD5MZAtt1ADZxgiKa3-0HwDFzyLYg&s'
    ),
    cotactModal(
        title: 'pal',
        image: 'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'
    ),
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            SizedBox(
              width: 160,
              child: Text('New group'),
            ),
            SizedBox(width: 160,
            child: Text(style: TextStyle(fontSize:13,fontWeight: FontWeight.normal),'Add participants'))
          ],
        ),
        actions: [
          SizedBox(
            width: 50,
            child: Icon(Icons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: group.length>0,
              child: Column(
                children: [
                  Container(
                    height: 70,
                child:  ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: myfriends.length,
                    itemBuilder: (context,index) {
                      if(myfriends[index].isselected==true){
                      return
                        Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  radius: 23,
                                  backgroundImage: NetworkImage(myfriends[index].image??''),
                                  backgroundColor: Colors.blueGrey,
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.grey,
                                      radius: 11,
                                      child: Icon(
                                        Icons.clear,
                                        color: Colors.white,
                                        size: 13,
                                      ),
                                    ))
                              ],
                            ),
                            Text(myfriends[index].title??''),
                          ],
                        ),
                      );
                       }else {
                        return Container(width: 1,);
                      }
                    }),
                  ),
                  Divider(thickness: 3,)
                ],
              ),
            ),
            SizedBox(height: 400,
            child: ListView.builder(
              itemCount: myfriends.length,
                itemBuilder: (context, index) {
                return InkWell(
                  child: contactCard(
                    contactmodal:myfriends[index]
                  ),
                  onTap: () {
                    if(myfriends[index].isselected==true){
                      setState(() {
                        group.remove(myfriends[index]);
                        myfriends[index].isselected=false;
                      });
                    } else {
                      setState(() {
                        group.add(myfriends[index]);
                        myfriends[index].isselected=true;
                      });
                    }
                  },
                );
                  // return ListTile(
                  //   leading: CircleAvatar(
                  //     radius: 30,
                  //     backgroundImage: NetworkImage(myfriends[index].image??''),
                  //   ),
                  //   title: Text(myfriends[index].title??''),
                  //   subtitle: Text('Hey there! I am using Whatsapp'),
                  // );
                }),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.teal,
        child: Icon(Icons.east_rounded),
        onPressed: () {
          Text('At least 1 contact must be selected');
        },
      ),
    );
  }
}
