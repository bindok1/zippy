// import 'package:flutter/material.dart';
// import 'package:iconsax_plus/iconsax_plus.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:zippy/features/home/models/lyric_model.dart';
// import 'package:zippy/theme/app_theme.dart';
// import 'package:zippy/utils/utils.dart';

// class LyricDisplayWidget extends StatefulWidget {

//   final List<LyricLine> lyrics;

//   const LyricDisplayWidget({
//     Key? key,
//     required this.player,
//     required this.lyrics,
//   }) : super(key: key);

//   @override
//   _LyricDisplayWidgetState createState() => _LyricDisplayWidgetState();
// }

// class _LyricDisplayWidgetState extends State<LyricDisplayWidget> {
//   late ScrollController _scrollController;
//   int currentLyricIndex = 0;
//   bool isPlaying = false;
//   bool isLooping = false;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     widget.player.playerStateStream.listen((state) {
//       setState(() {
//         isPlaying = state.playing;
//       });
//     });

//     widget.player.positionStream.listen((position) {
//       int newIndex =
//           widget.lyrics.indexWhere((line) => line.time > position) - 1;
//       if (newIndex != currentLyricIndex && newIndex >= 0) {
//         setState(() {
//           currentLyricIndex = newIndex;
//         });

//         _scrollController.animateTo(
//           (currentLyricIndex * 120.0)
//               .clamp(0.0, _scrollController.position.maxScrollExtent),
//           duration: Duration(milliseconds: 600),
//           curve: Curves.easeInOut,
//         );
//       }
//     });
//   }

//   void _togglePlayPause() {
//     if (isPlaying) {
//       widget.player.pause();
//     } else {
//       widget.player.play();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(28),
//               color: AppTheme.primaryColor.withOpacity(0.8)),
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           height: 300,
//           child: ListView.builder(
//             controller: _scrollController,
//             itemCount: widget.lyrics.length,
//             itemBuilder: (context, index) {
//               final line = widget.lyrics[index];
//               final isCurrent = index == currentLyricIndex;

//               return Opacity(
//                 opacity: isCurrent ? 1.0 : 0.5,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: Center(
//                     child: Text(
//                       line.text,
//                       style: TextStyle(
//                         color: isCurrent ? Colors.white : Colors.grey[400],
//                         fontSize: isCurrent ? 20 : 16,
//                         fontWeight:
//                             isCurrent ? FontWeight.bold : FontWeight.normal,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             IconButton(
//               icon: Icon(
//                 isPlaying
//                     ? IconsaxPlusBold.pause_circle
//                     : IconsaxPlusBold.play_circle,
//                 color: Colors.white,
//                 size: 48,
//               ),
//               onPressed: _togglePlayPause,
//             ),
//             Utils.horizontalSpace10,
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
// }
