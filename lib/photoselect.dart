import 'package:flutter/material.dart';
import 'package:umang2/main.dart';
class photoselect extends StatefulWidget {
  const photoselect({Key? key}) : super(key: key);

  @override
  State<photoselect> createState() => _photoselectState();
}

class _photoselectState extends State<photoselect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Choose picture'),
        actions: [
          Icon(Icons.more_vert)
        ],
      ),
      body: Container(
       // height: 240,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(top: 450),
          child: Card(
           child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 12),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width, color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 125),
                        child: Row(
                          children: [
                            IconButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Cameraapp()));
                            },
                                icon: Icon(Icons.camera)),Text('Camera'),
                          ],
                        ),
                      ),
                    ),Divider(thickness: 1,color: Colors.black,),

                    Container(
                      width: MediaQuery.of(context).size.width, color: Colors.green,

                      child: Padding(
                        padding: const EdgeInsets.only(left: 125),
                        child: Row(
                          children: [
                            IconButton(onPressed: () {},
                                icon: Icon(Icons.photo)),Text('Gallery'),
                          ],
                        ),
                      ),
                    ),Divider(thickness: 1,color: Colors.black,),

                    Container(
                      width: MediaQuery.of(context).size.width, color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 125),
                        child: Row(
                          children: [
                            IconButton(onPressed: () {},
                                icon: Icon(Icons.cancel)),Text('Cancel')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      )

    );
  }
}
