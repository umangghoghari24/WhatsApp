import 'package:flutter/material.dart';
class videocall extends StatefulWidget {
  const videocall({Key? key}) : super(key: key);

  @override
  State<videocall> createState() => _videocallState();
}

class _videocallState extends State<videocall> {
  var myfriend2=[
    'nirali',
    'jay',
    'raj',
    'shail',
    'yuvraj'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: myfriend2.length,
          itemBuilder: (context,index){
            return ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2016/11/14/04/45/elephant-1822636_960_720.jpg"),
                backgroundColor: Colors.red,
                child: Container(
                  ),
              ),
              title: Text(myfriend2[index]),
              subtitle: Text('Today'),
                trailing: IconButton(
                  onPressed: () {
                    print('Start call');
                  },
                  icon: Icon(Icons.video_call),
                ),

            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('start');
        },
        child: Icon(Icons.add_call),
      ),
    );
  }
}
