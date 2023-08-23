import 'package:flutter/material.dart';
import 'package:umang2/EnterNumber.dart';
class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 120,),
            Image.asset("aseets/images/loginpage.jpg"),
            Text('Welcome to WhatsApp',style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 10,),
              Text('Read our Privacy Policy Tap "Agree and continue" to',
              style: TextStyle(fontSize: 15,),),
            SizedBox(height: 5,),
            Text('accept the Terms of Service.'),
            SizedBox(height: 150,),
            SizedBox(width: 300,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Enternumber()));
              },
                  child: Text('Agree and continue'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                    ),
                ),
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
