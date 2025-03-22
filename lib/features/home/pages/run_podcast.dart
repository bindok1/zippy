// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:zippy/features/home/models/lyric_model.dart';
// import 'package:zippy/features/home/widgets/lyric_display.dart';
// import 'package:zippy/source/data_dummy.dart';
// import 'package:zippy/utils/utils.dart';

// class RunPodcastPage extends StatefulWidget {
//   final String imageAsset;
//   final String title;
//   final String subtitle;

//   const RunPodcastPage({
//     Key? key,
//     required this.imageAsset,
//     required this.title,
//     required this.subtitle,
//   }) : super(key: key);

//   @override
//   _RunPodcastPageState createState() => _RunPodcastPageState();
// }

// class _RunPodcastPageState extends State<RunPodcastPage> {
 

//   @override
//   void initState() {
//     super.initState();
//     final String audioPath = DataDummy.hedgehogPodcastData['audioPath'];
   
//     _player.play();
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           _mainPodcastWidget(),

//           // Background blur filter
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
//               child: Container(
//                 color: Colors.black.withOpacity(0.3),
//               ),
//             ),
//           ),
//           _topAppBar(context),
//         ],
//       ),
//     );
//   }

//   Widget _topAppBar(BuildContext context) {
//     final Map<String, dynamic> podcastData = DataDummy.hedgehogPodcastData;

//     final List<LyricLine> lyrics =
//         List<Map<String, dynamic>>.from(podcastData['lyrics']).map((entry) {
//       return LyricLine(
//         time: entry['time'] as Duration,
//         text: entry['text'] as String,
//         audioPath: '',
//       );
//     }).toList();
//     return Column(
//       children: [
//         const SizedBox(height: 40),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 icon: const Icon(Icons.arrow_back, color: Colors.white),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         ),
//         const Spacer(),
//         Column(
//           children: [
//             Container(
//               width: 150,
//               height: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 image: DecorationImage(
//                   image: AssetImage(widget.imageAsset),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Utils.verticalSpace(16),
//             Text(
//               widget.title,
//               style: Theme.of(context)
//                   .textTheme
//                   .titleMedium!
//                   .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               widget.subtitle,
//               style: Theme.of(context)
//                   .textTheme
//                   .bodyLarge!
//                   .copyWith(color: Colors.white),
//             ),
//             Center(
//               child: LyricDisplayWidget(
//                 player: _player,
//                 lyrics: lyrics,
//               ),
//             ),
//             Utils.verticalSpace(60)
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _mainPodcastWidget() {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: Image.asset(
//             widget.imageAsset,
//             fit: BoxFit.cover,
//           ),
//         ),
//       ],
//     );
//   }
// }
