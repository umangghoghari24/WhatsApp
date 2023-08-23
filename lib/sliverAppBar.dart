// import 'package:flutter/material.dart';
// import 'package:wp_search_bar/wp_search_bar.dart';
// class silver extends StatefulWidget {
//   const silver({Key? key}) : super(key: key);
//
//   @override
//   State<silver> createState() => _silverState();
// }
//
// class _silverState extends State<silver> {
//   @override
//   Widget build(BuildContext context) {
//     return  WPSearchBar(
//       appBarBackgroundColor: const Color(0xff1f2c34),
//       listOfFilters: const {
//         'name': {
//           'name': 'name',
//           'selected': false,
//           'title': 'Name',
//           'operation': 'CONTAINS',
//           'icon': Icons.supervised_user_circle_rounded,
//         },
//         'message': {
//           'name': 'message',
//           'selected': false,
//           'title': 'Message',
//           'operation': 'CONTAINS',
//           'icon': Icon(Icons.message),
//         },
//         'read_by_person': {
//           'name': 'read_by_person',
//           'selected': false,
//           'title': 'Read by Other Person',
//           'operation': 'CONTAINS',
//           'icon': Icon(
//             Icons.checklist_sharp,
//             color: Colors.blue,
//           ),
//         },
//         'date': {
//           'name': 'Date',
//           'selected': false,
//           'title': 'Date',
//           'operation': 'CONTAINS',
//           'icon': Icon(Icons.date_range),
//         },
//       },
//       materialDesign: {
//         'title': const {'text': 'WhatsApp'},
//         'loadingIndicator': Transform.scale(
//           scale: 0.5,
//           child: CircularProgressIndicator(
//             strokeWidth: 3,
//           ),
//         ),
//       },
//       onSearch: (filterSelected, value, operation) {
//         filteredData = data.where((Map<String, dynamic> element) {
//           var dataKey = filterSelected;
//
//           if (dataKey != null) {
//             if (dataKey == 'read_by_person') {
//               dataKey = 'name';
//               if (element['status'] == null ||
//                   element['status'] != (StatusEnum.rdp)) {
//                 return false;
//               }
//             }
//           }
//
//           if (value == null || value == '') {
//             return true;
//           }
//
//           print(
//               'Element ${element[dataKey]}, filter: ${dataKey}, value: ${value}');
//           if (dataKey != null &&
//               element[dataKey] != null &&
//               element[dataKey]!.toLowerCase().contains(value.toLowerCase())) {
//             return true;
//           } else {
//             if (element['name']!
//                 .toLowerCase()
//                 .contains(value.toLowerCase()) ||
//                 element['message']!
//                     .toLowerCase()
//                     .contains(value.toLowerCase())) {
//               return true;
//             }
//           }
//
//           return false;
//         }).toList();
//         setState(() {
//           filteredData;
//         });
//       },
//       body: Container(
//         decoration: const BoxDecoration(color: Color(0xff121b22)),
//         child: ListView.builder(
//             itemCount: filteredData.length,
//             itemBuilder: (context, index) {
//               var item = filteredData[index];
//               return ListTile(
//                 leading: CircleAvatar(
//                   child: Text(item['name']![0].toUpperCase()),
//                   backgroundColor: const Color(0xff00a982),
//                 ),
//                 title: Text(
//                   item['name'].toString(),
//                   style: const TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.bold),
//                 ),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item['message'].toString(),
//                       style: const TextStyle(color: Color(0xff738088)),
//                     ),
//                     if (item['status'] == StatusEnum.rdp)
//                       const Icon(
//                         Icons.checklist_sharp,
//                         color: Colors.blue,
//                       ),
//                     if (item['status'] == StatusEnum.rcs)
//                       const Icon(
//                         Icons.checklist_sharp,
//                         color: Colors.grey,
//                       ),
//                     if (item['status'] == StatusEnum.rcp)
//                       const Icon(Icons.check, color: Colors.grey, size: 16),
//                   ],
//                 ),
//                 trailing: const Text(
//                   '1:30 am',
//                   style: TextStyle(color: Color(0xff738088)),
//                 ),
//               );
//             }),
//       ),
//     ),
//     );
//
//   }
//
// //   Scaffold(
//     //   body: CustomScrollView(
//     //     slivers: <Widget>[
//     //       SliverAppBar(
//     //         backgroundColor: Colors.black12,
//     //         title: TextField(
//     //           decoration: InputDecoration(
//     //             hintText: 'Search',
//     //             prefixIcon: Icon(Icons.search),
//     //           ),
//     //         ),
//     //         floating: true,
//     //         // flexibleSpace: Placeholder(),
//     //         expandedHeight: 200,
//     //         bottom: PreferredSize(child: SizedBox(
//     //             height: 170,width: 900,
//     //             child: GridView.count(crossAxisCount: 3,
//     //               crossAxisSpacing: 23,
//     //               mainAxisSpacing: 8,
//     //               childAspectRatio: 2.5,
//     //               physics: NeverScrollableScrollPhysics(),
//     //               shrinkWrap: true,
//     //               primary: false,
//     //               padding: EdgeInsets.all(11),
//     //               children: [
//     //                 TextButton(onPressed: () {},
//     //                     style: TextButton.styleFrom(
//     //                         backgroundColor: Colors.black12,
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(20),
//     //                         )
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         SizedBox(width: 4,),
//     //                         Icon(Icons.mark_chat_unread,
//     //                           size: 19,),
//     //                         SizedBox(width: 4,),
//     //                         Text('Unread',),
//     //                       ],
//     //                     )),
//     //                 TextButton(onPressed: () {},
//     //                     style: TextButton.styleFrom(
//     //                         backgroundColor: Colors.black12,
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(20),
//     //                         )
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         SizedBox(width: 4,),
//     //                         Icon(Icons.photo,
//     //                           size: 19,),
//     //                         SizedBox(width: 4,),
//     //                         Text('Photos',),
//     //                       ],
//     //                     )),
//     //                 TextButton(onPressed: () {},
//     //                     style: TextButton.styleFrom(
//     //                         backgroundColor: Colors.black12,
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(20),
//     //                         )
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         SizedBox(width: 6,),
//     //                         Icon(Icons.videocam,
//     //                           size: 20,),
//     //                         SizedBox(width: 4,),
//     //                         Text('Video',),
//     //                       ],
//     //                     )),
//     //                 TextButton(onPressed: () {},
//     //                     style: TextButton.styleFrom(
//     //                         backgroundColor: Colors.black12,
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(20),
//     //                         )
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         SizedBox(width: 4,),
//     //                         Icon(Icons.link,
//     //                           size: 19,),
//     //                         SizedBox(width: 4,),
//     //                         Text('Links',),
//     //                       ],
//     //                     )),
//     //                 TextButton(onPressed: () {},
//     //                     style: TextButton.styleFrom(
//     //                         backgroundColor: Colors.black12,
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(20),
//     //                         )
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         SizedBox(width: 4,),
//     //                         Icon(Icons.gif_box,
//     //                           size: 19,),
//     //                         SizedBox(width: 4,),
//     //                         Text('GIFs',),
//     //                       ],
//     //                     )),
//     //                 TextButton(onPressed: () {},
//     //                     style: TextButton.styleFrom(
//     //                         backgroundColor: Colors.black12,
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(20),
//     //                         )
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         SizedBox(width: 4,),
//     //                         Icon(Icons.headset,
//     //                           size: 19,),
//     //                         SizedBox(width: 4,),
//     //                         Text('Audio',),
//     //                       ],
//     //
//     //                     )),
//     //                 TextButton(onPressed: () {},
//     //                     style: TextButton.styleFrom(
//     //                         backgroundColor: Colors.black12,
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(20),
//     //                         )
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         SizedBox(width: 4,),
//     //                         Icon(Icons.text_snippet_outlined,
//     //                           size: 19,),
//     //                         SizedBox(width: 4,),
//     //                         Text('Document',),
//     //                       ],
//     //                     )),
//     //                 TextButton(onPressed: () {},
//     //                     style: TextButton.styleFrom(
//     //                         backgroundColor: Colors.black12,
//     //                         shape: RoundedRectangleBorder(
//     //                           borderRadius: BorderRadius.circular(20),
//     //                         )
//     //                     ),
//     //                     child: Row(
//     //                       children: [
//     //                         SizedBox(width: 4,),
//     //                         Icon(Icons.poll_outlined,
//     //                           size: 19,),
//     //                         SizedBox(width: 4,),
//     //                         Text('Polls',),
//     //                       ],
//     //
//     //                     ))
//     //               ],)),
//     //             preferredSize: Size.fromHeight(100)),
//     //       ),
//     //     ],
//     //   ),
//     // );
//   }
// }
