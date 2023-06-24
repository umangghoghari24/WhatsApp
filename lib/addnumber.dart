import 'package:flutter/material.dart';
import 'package:umang2/photoselect.dart';
class addnumber extends StatefulWidget {
  const addnumber({Key? key}) : super(key: key);

  @override
  State<addnumber> createState() => _addnumberState();
}

class _addnumberState extends State<addnumber> {
  //var lebal=['No label', 'Mobile','Work','Home','other','Custom'];

  TextEditingController textarea = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create contact'),
        backgroundColor: Colors.transparent,
        actions: [
          ElevatedButton(onPressed: () {},
              child: Icon(Icons.save))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height:10,),
              TextFormField(
                decoration: InputDecoration(
                  border:  OutlineInputBorder(),
                  filled: true,
                  hintText: 'Save to : Device'
                ),
              ),
              SizedBox(height: 5,),
                 CircleAvatar(
                   radius: 50,
                     backgroundColor: Colors.blueGrey,
                     child: IconButton(onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>photoselect()));
                     },
                        icon: Icon(Icons.add_a_photo,size: 36,
                        color: Colors.white60,)),
                 ),

              SizedBox(height: 5,),

              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border:  OutlineInputBorder(
                  ),
                  hintText: '',
                    labelText: "First name",
                    prefixIcon: Icon(Icons.person),
                ),

              ),SizedBox(height: 5,),

              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '',
                    labelText: 'Last name'
                  ),
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border:  OutlineInputBorder(),
                  prefixIcon: Icon(Icons.business),
                  labelText: 'Company',
                  hintText: ''
                ),
              ),
              SizedBox(height: 5,),

              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border:  OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                  labelText: 'Phone',
                  hintText: ""
                ),
              ),
              SizedBox(height: 5,),
              TextFormField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  border:  OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Email',
                  hintText: ''
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

