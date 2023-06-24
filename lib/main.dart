import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:umang2/cameraview.dart';
import 'package:umang2/home.dart';
import 'package:umang2/listview2.dart';
import 'package:umang2/mytabs.dart';
import 'package:umang2/photoselect.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:umang2/whatsapplogo.dart';
import 'package:url_launcher/url_launcher.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _cameras = await availableCameras();
  print(_cameras);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff128C7E)
        )
      ),
      home: listview2()
    );
  }
}

//camera app

class Cameraapp extends StatefulWidget {
  const Cameraapp({Key? key}) : super(key: key);

  @override
  State<Cameraapp> createState() => _CameraappState();
}

class _CameraappState extends State<Cameraapp> {
  late CameraController controller;

  var camera_index=0;
  var showreal= true;
  var showflash= false;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = CameraController(_cameras[0], ResolutionPreset.high);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
          // Handle access errors here.
            break;
          default:
          // Handle other errors here.
            break;
        }
      }
    });
}
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
}
   var currnetcamerastatus = 1;
   var isshow= false;

  void initstate(){
    super.initState();

    setState(() {
      currnetcamerastatus = 1;
    });
  }
  var currnetcamera = 2;

  void initstate2(){
    super.initState();
    setState(() {
      currnetcamerastatus = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    // return const Scaffold();
    if (!controller.value.isInitialized) {
      return Scaffold(
        );
    }

    return MaterialApp(
      home:
       Stack(
         children: [
           CameraPreview(controller),
           Positioned(
             top: 50,
               left: 10,
               child: Icon(
                 Icons.close,
                 color: Colors.white,
                 size: 25,
               )),
           Positioned(
               top: 48,
               right: 10,
               child: Container(
                     child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                       onPressed: () {
                         if (showflash==true){
                           setState(() {
                             showflash=!showflash;
                             controller.setFlashMode(FlashMode.off);
                           });
                         }else{
                           setState(() {
                             showflash=!showflash;
                             controller.setFlashMode(FlashMode.torch);
                           });
                         }
                       },
                       child: Icon(
                         showflash?Icons.flash_on:Icons.flash_off,
                         color: Colors.white,
                       ),
                     ),
               )
             ),
           Positioned(
             top: 44, left: 153,
               child: Text('00:00', style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.normal),)),
           Positioned(
               bottom: 95,
               left: 10,
               child: CircleAvatar(
                 backgroundColor: Colors.black26,
                 child: Icon(
                   Icons.image,
                   color: Colors.white,
                 ),
               )),
           Positioned(
               bottom: 75,
               left: 141,
               child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                  onPressed: () async{
                  final path=  await join( (await getTemporaryDirectory()).path,'${DateTime.now()}.png');
                  XFile picture = await controller.takePicture();
                  picture.saveTo(path);
                  print(path);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>cameraview(path: path,)));
                },
                 child: Icon( Icons.radio_button_on_outlined,
                 color: Colors.white,
                 size: 70
               ))
           ),
           Positioned(
               bottom: 95,
               right: 10,
               child: Container(
                 child: ElevatedButton(
                   style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
                   onPressed: () {
                     if (showreal==true){
                       setState(() {
                         camera_index=0;
                         showreal=!showreal;
                       });
                     }else{
                       setState(() {
                         camera_index=1;
                         showreal=!showreal;
                       });
                     }
                     controller=CameraController(_cameras[camera_index], ResolutionPreset.max);
                     controller.initialize().then((_) {
                      if (!mounted) {
                        return;
                      }
                      setState(() {
                      });
                     }).catchError((Object e) {
                       if (e is CameraException) {}
                     });
                   },
                   child: Icon(
                     Icons.flip_camera_android,
                     color: Colors.white,
                   ),
                 ),
               ),
           ),
           Positioned(
             bottom: 250,
               left: 175,
               child: Icon(
             Icons.minimize,
             color: Colors.black,
           )),
           Positioned(bottom: 150,
               child: Container(
                 height: 100, width: 1000,
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                     itemCount: 20,
                   itemBuilder: (context,index){
                       return Padding(
                           padding: const EdgeInsets.all(2.0),
                         child: Container(height: 0, width: 50,
                         color: Colors.white,),
                       );
                   },
               ),
               ),),
           Positioned(
             bottom: 0,
             child: Container(
               child: Column(
                 children: [
                   SizedBox(height: 7,),
                   Row(
                     children: [
                       SizedBox(
                         width: 110,
                       ),
                       ElevatedButton(
                         style: ElevatedButton.styleFrom(backgroundColor: currnetcamerastatus==1?Colors.grey.shade800:Colors.transparent,shape: StadiumBorder()),
                        // child: Text('Video'),
                         onPressed: () {
                           setState(() {
                             currnetcamerastatus=1;
                           });
                         },
                         child: Text('photo'),
                       ),
                       SizedBox(width: 3,),

                       ElevatedButton(
                         style: ElevatedButton.styleFrom(backgroundColor: currnetcamerastatus==2?Colors.grey.shade800:Colors.transparent,shape: StadiumBorder()),
                      //   child: Text('Photo'),
                         onPressed: () {
                           setState(() {
                             currnetcamerastatus = 2;
                           });
                         },
                         child: Text('video'),
                       )
                     ],
                   ),
                 ],
               ),
               height: 70,width: 1000,
               color: Colors.black,
             ),
           ),
         ],
      ),
    );
  }
}





