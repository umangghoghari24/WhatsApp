import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:umang2/Country.dart';

class Enternumber extends StatefulWidget {
  const Enternumber({Key? key}) : super(key: key);

  @override
  State<Enternumber> createState() => _EnternumberState();
}

class _EnternumberState extends State<Enternumber> {
  TextEditingController countrys = TextEditingController();
  TextEditingController number = TextEditingController();
  final mykey = GlobalKey();
  String countryCode = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 80,height: 110,),
                Text('Enter your phone number',style: TextStyle(
                  fontSize: 18,
                  color: Colors.green
                ),),
                SizedBox(width: 70,),
                Icon(Icons.more_vert),
              ],
            ),
            Text('WhatsApp will need to verify your account. Whats my number'),
            SizedBox(height: 2,),
            Text('number?'),
            Padding(
              padding: const EdgeInsets.only(left: 50,right: 50),
              child: Container(
                child: Column(
                  children: [
                    Text(countryCode.toString()),
                    Form(
                        key: mykey,
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: IconButton(onPressed: () {
                              showCountryPicker(context: context,
                                  countryListTheme: CountryListThemeData(
                                    textStyle: TextStyle(fontSize: 20),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10)
                                    ),
                                    inputDecoration: InputDecoration(
                                      prefixIcon: IconButton(onPressed: () {},
                                          icon: Icon(Icons.arrow_back_rounded)),
                                      suffixIcon: Icon(Icons.search_rounded),
                                      labelText: 'Choose a country',labelStyle: TextStyle(
                                      fontSize: 25,
                                      color: Colors.green,
                                    )
                                    )
                                  ),
                                  onSelect: (country ) {
                                print(country.countryCode.toString());
                                print(country.phoneCode.toString());
                               }
                              );
                            },
                                icon: Icon(Icons.arrow_circle_down_outlined))
                          ),
                          controller: countrys,
                        ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'phone number'
                      ),
                      controller: number,
                      keyboardType: TextInputType.number,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            Text('Carrier charges may apply'),
            SizedBox(height: 420,),
            ElevatedButton(onPressed: () {
            },
                child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
