import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:umang2/main.dart';

class Personalchat extends StatefulWidget {
  const Personalchat({Key? key}) : super(key: key);

  @override
  State<Personalchat> createState() => _PersonalchatState();
}

class _PersonalchatState extends State<Personalchat> {
  FocusNode messagefocuce = FocusNode();
  TextEditingController message = TextEditingController();
  TextEditingController textarea = TextEditingController();
  TextEditingController emoji= TextEditingController();
  late bool hideemoji = true;
  FocusNode focusNode = FocusNode();
  bool isShow = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          hideemoji = true;
        });
      } else {
        setState(() {
          hideemoji = false;
        });
      }
    });
    textarea.addListener(() {
      if (textarea.text != '') {
        setState(() {
          isShow = false;
        });
        setState(() {
          isShow = false;
        });
      } else {
        setState(() {
          isShow = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              'umang',
            ),
            Text('online'),
          ],
        ),
        actions: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    print('');
                  },
                  icon: Icon(Icons.video_call)),
              IconButton(onPressed: () {}, icon: Icon(Icons.call)),
              PopupMenuButton(
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (context) => [
                        PopupMenuItem(child: Text("View contact")),
                        PopupMenuItem(child: Text("Media, links and docs")),
                        PopupMenuItem(child: Text("Search")),
                        PopupMenuItem(child: Text("mute notifications")),
                        PopupMenuItem(child: Text("Disappearing message")),
                        PopupMenuItem(child: Text("Wallpaper")),
                        PopupMenuItem(child:
                        PopupMenuItem(child: Text('More'))),
                      ])
            ],
          ),
        ],
      ),

      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image.network('https://mcdn.wallpapersafari.com/medium/27/32/jt4AoG.jpg',
            height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(),
            Align(
                alignment: Alignment.bottomLeft,
                child: WillPopScope(
                  onWillPop: () {
                    if (hideemoji == true) {
                      Navigator.pop(context);
                    } else {
                      setState(() {
                        hideemoji = !hideemoji;
                      });
                    }
                    return Future.value();
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width -50,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                              ),
                              child: TextFormField(
                                onTap: () {},
                                keyboardType: TextInputType.multiline,
                                minLines: 1,
                                maxLines: 3,
                                controller: textarea,
                                textAlignVertical: TextAlignVertical.center,
                                focusNode: focusNode,
                                decoration: InputDecoration(
                                  hintText: 'Message',
                                  contentPadding:
                                      EdgeInsets.only(left: 3, right: 3),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: (context) =>
                                                    Bottommodal());
                                          },
                                         icon: Icon(Icons.attach_file)),
                                      Visibility(
                                        visible: isShow,
                                        child: IconButton(
                                          onPressed: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cameraapp()));

                                          },
                                          icon: Icon(Icons.camera_alt),
                                        ),
                                      )
                                    ],
                                  ),
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      focusNode.unfocus();
                                      focusNode.canRequestFocus = true;
                                      setState(() {
                                        hideemoji = !hideemoji;
                                      });
                                    },
                                    icon: Icon(Icons.emoji_emotions),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                              visible: isShow,
                              replacement: CircleAvatar(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.send),
                                ),
                              ),
                              child: CircleAvatar(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.mic),

                                ),
                              ))
                        ],
                      ),
                      MyEmoji(),
                    ],
                  ),
                )),
          ],
        ),
      ),
      // body:
      // Container(
      //   child: Column(
      //     children: [
      //       // Expanded(child: Text('Message')),
      //       // Container(
      //       //   width: MediaQuery.of(context).size.width,
      //       //   alignment: Alignment.bottomCenter,
      //       //   padding: EdgeInsets.all(4),
      //       //   child: Row(
      //       //     children: [
      //       //       Flexible(
      //       //           child: TextFormField(
      //       //         minLines: 1,
      //       //         maxLines: 100,
      //       //         focusNode: messagefocuce,
      //       //         controller: message,
      //       //         decoration: InputDecoration(
      //       //           prefixIcon: Icon(Icons.emoji_emotions_outlined),
      //       //           suffixIcon: Row(
      //       //             mainAxisSize: MainAxisSize.min,
      //       //             children: [
      //       //               IconButton(
      //       //                   onPressed: () {}, icon: Icon(Icons.attachment)),
      //       //               IconButton(
      //       //                   onPressed: () {},
      //       //                   icon: Icon(Icons.currency_rupee_rounded)),
      //       //               IconButton(
      //       //                   onPressed: () {}, icon: Icon(Icons.camera_alt)),
      //       //             ],
      //       //           ),
      //       //           focusedBorder: OutlineInputBorder(
      //       //             borderRadius: BorderRadius.circular(30),
      //       //             borderSide: BorderSide(width: 0.5),
      //       //           ),
      //       //           hintText: 'Message',
      //       //           enabledBorder: OutlineInputBorder(
      //       //               borderRadius: BorderRadius.circular(50),
      //       //               borderSide: BorderSide(width: 0.5)),
      //       //         ),
      //       //       )),
      //       //       CircleAvatar(
      //       //         radius: 26,
      //       //         backgroundColor: Colors.green,
      //       //         child: IconButton(onPressed: () {}, icon: Icon(Icons.mic)),
      //       //       ),
      //       //     ],
      //       //   ),
      //       // ),
      //
      //     ],
      //   ),
      // ),
    );
  }
  Widget MyEmoji() {
    return Container(
      child: Offstage(
        offstage: hideemoji,
        child: SizedBox(
            width: MediaQuery.of(context).size.width -20,
            height: 250,
            child: EmojiPicker(
              textEditingController: message,
            )),
      ),
    );
  }

  Widget Bottommodal() {
    return Container(
      height: 250,
      //  width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.file_copy, Colors.indigo, 'Document'),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.camera_alt, Colors.pink, 'Camera',
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.insert_photo, Colors.purple, 'Gallery'),
                ],
              ),
              SizedBox(width: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.orange, 'Audio'),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.location_pin, Colors.green, 'Location'),
                  SizedBox(
                    width: 40,
                  ),
                  iconcreation(Icons.person, Colors.blue, 'Contact'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon( icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Text(text),
      ],
    );
  }
}
