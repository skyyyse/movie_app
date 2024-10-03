// import 'package:flutter/material.dart';
// import 'package:media_kit/media_kit.dart';
// import 'package:media_kit_video/media_kit_video.dart';
//
// class MyScreen extends StatefulWidget {
//   final String movie;
//
//   MyScreen({super.key, required this.movie});
//
//   @override
//   _MyScreenState createState() => _MyScreenState();
// }
//
// class _MyScreenState extends State<MyScreen> {
//   late final Player player;
//   late final VideoController controller;
//
//   @override
//   void initState() {
//     super.initState();
//     player = Player();
//     controller = VideoController(player);
//
//     player.open(Media(widget.movie)).then((_) {
//       print('Video opened successfully');
//     }).catchError((error) {
//       print('Error opening video: $error');
//     });
//   }
//
//   @override
//   void dispose() {
//     player.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Video Player')),
//       body: Center(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.width * 9.0 / 16.0,
//           child: Video(controller: controller),
//         ),
//       ),
//     );
//   }
// }
