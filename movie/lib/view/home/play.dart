// import 'package:flick_video_player/flick_video_player.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class play extends StatefulWidget {
//   String movie;
//   play({super.key,required this.movie});
//   @override
//   State<play> createState() => _playState();
// }
// class _playState extends State<play> {
//   late FlickManager flickManager;
//   @override
//   void initState() {
//     super.initState();
//     try {
//       flickManager = FlickManager(
//         videoPlayerController: VideoPlayerController.asset(
//           // Uri.parse('http://10.0.2.2:8000/video/${widget.movie}'),
//             'assets/video/video.mp4'
//         ),
//       );
//     } catch (e) {
//       print("Error initializing video player: $e");
//     }
//   }
//   @override
//   void dispose() {
//     flickManager.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text(widget.movie),
//       ),
//       body: Center(
//         child:AspectRatio(
//           aspectRatio: 16/9,
//           child: FlickVideoPlayer(
//             flickManager: flickManager,
//           ),
//         ),
//       ),
//     );
//   }
// }
