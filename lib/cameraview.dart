import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class cameraview extends StatelessWidget {
  const cameraview({Key? key, required this.path}) : super(key: key);
  final path;

  @override
  Widget build(BuildContext context) {
    TextEditingController textarea = TextEditingController();
    bool isShow = true;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        actions: [
          SizedBox(
            width: 115,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.crop_rotate,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.emoji_emotions_outlined,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.title,
              size: 25,
            ),
          ),
          IconButton(
              onPressed: () {
                print('object');
              },
              icon: Icon(
                Icons.edit,
                size: 25,
              )),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 127,
              child: Image.file(
                File(path),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric( horizontal: 1),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: TextFormField(
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: ('Add a caption'),
                          hintStyle: TextStyle(fontSize: 18,color: Colors.white),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.motion_photos_on),
                              ),
                            ],
                          ),
                          prefixIcon: Visibility(
                            visible: isShow,
                            replacement: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.emoji_emotions_outlined),
                              color: Colors.black54,
                            ),
                            child: Icon(
                              Icons.add_photo_alternate_rounded,
                              color: Colors.black45,
                              size: 27,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                            radius: 25,
                            child: IconButton(onPressed: () {},
                              icon: Icon(Icons.check)),
                          backgroundColor: Colors.teal,),
                  )
          ],
        ),
      ),
    );
  }
}
