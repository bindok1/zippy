import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/features/home/pages/detail_podcast.dart';
import 'package:zippy/features/home/widgets/skeleton_loader.dart';
import 'package:zippy/features/library/widgets/continue_listen_card.dart';
import 'package:zippy/features/library/widgets/library_widget.dart';
import 'package:zippy/source/data_dummy.dart';
import 'package:zippy/utils/utils.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 22, top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _titlePage(context),
                Utils.verticalSpace20,
                _continueListening(context, isLoading),
                Utils.verticalSpace25,
                _libraryComponent(
                  context,
                ),
                _playList(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _titlePage(BuildContext context) {
    return Center(
      child: Utils.boldTitle('My Library', context),
    );
  }

  Widget _continueListening(BuildContext context, bool isLoading) {
    final continueListeningData = DataDummy.continueListeningData;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.boldTitle("Creator's Choice", context),
        Utils.verticalSpace12,
        SizedBox(
          height: 230,
          child: CustomSkeletonLoader(
            isLoading: isLoading,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: continueListeningData.length,
              itemBuilder: (context, index) {
                final data = continueListeningData[index];
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoute.runPodcastPage);
                      },
                      child: ContinueListeningItem(
                        imageAsset: data['image'],
                        title: data['title'],
                        subtitle: data['type'],
                        // progress: data['progress'],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPodcastPage(
                                imageAsset: data['image'],
                                title: data['title'],
                                subtitle: data['type'],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Utils.horizontalSpace12,
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _libraryComponent(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {'icon': IconsaxPlusBold.clock, 'title': 'History'},
      {'icon': IconsaxPlusBold.receive_square, 'title': 'Download'},
      {'icon': IconsaxPlusBold.lovely, 'title': 'Favorites'},
      {'icon': IconsaxPlusBold.microphone, 'title': 'Podcast'},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: LibraryComponent(
            icon: item['icon'],
            title: item['title'],
          ),
        );
      },
    );
  }

  Widget _playList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.boldTitle(
          'Playlist',
          context,
        ),
        Utils.verticalSpace12,
        Container(
          width: 343,
          height: 114,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 32),
              child: Text(
                  textAlign: TextAlign.center,
                  'Explore dan temukan konten favoritmu, lalu tambahkan ke playlist ini! 😍'),
            ),
          ),
        ),
        Utils.verticalSpace25
      ],
    );
  }
}
