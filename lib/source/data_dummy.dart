import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:zippy/features/home/models/comment_model.dart';
import 'package:zippy/theme/app_asset.dart';

class DataDummy {
  // Button Data
  static final List<Map<String, dynamic>> buttonData = [
    {'icon': IconsaxPlusBold.clock, 'text': 'Storytime'},
    {'icon': IconsaxPlusBold.pet, 'text': 'Sing Along'},
    {'icon': IconsaxPlusBold.cake, 'text': 'Have Fun'},
    {'icon': IconsaxPlusBold.musicnote, 'text': 'Play'},
  ];

  //Continue Listening Data
  static final List<Map<String, dynamic>> continueListeningData = [
    {
      'image': AppAsset.continueListening1,
      'title': 'Cuning Canine',
      'type': 'Forest Foxes',
      'progress': 68.0,
    },
    {
      'image': AppAsset.continueListening2,
      'title': 'A Cup of Inspiration',
      'type': 'Fox World',
      'progress': 36.0,
    },
    {
      'image': AppAsset.continueListening3,
      'title': 'Hedgehog Hustle',
      'type': 'Prickly Pals',
      'progress': 58.0,
    }
  ];

  // Banner Data
  static final List<Map<String, String>> bannerData = [
    {'image': AppAsset.banner1},
    {'image': AppAsset.banner2},
    {'image': AppAsset.banner1},
    {'image': AppAsset.banner2},
    {'image': AppAsset.banner1},
    {'image': AppAsset.banner2},
    {'image': AppAsset.banner1},
    {'image': AppAsset.banner2},
    {'image': AppAsset.banner1},
    {'image': AppAsset.banner2},
    {'image': AppAsset.banner1},
    {'image': AppAsset.banner2},
    {'image': AppAsset.banner1},
  ];

  // Top Episode Data
  static final List<Map<String, String>> topEpisodeData = [
    {
      'image': AppAsset.continueListening3,
      'title': 'Cunning Canine',
      'subtitle': 'Forest Foxes',
      'duration': '78 menit',
    },
    {
      'image': AppAsset.continueListening2,
      'title': 'Forest Friends',
      'subtitle': 'Tale Trail',
      'duration': '45 menit',
    },
    {
      'image': AppAsset.continueListening1,
      'title': 'A Cup of Inspiration',
      'subtitle': 'Fox World',
      'duration': '38 menit',
    },
  ];
  static final List<Comment> commentData = [
    Comment(
      image: AppAsset.photo1,
      name: 'Lenya',
      time: '45 menit',
      comment: 'Podcast Hedgehog Hustle selalu berhasil bikin aku takjub.',
    ),
    Comment(
      image: AppAsset.photo2,
      name: 'Rafli',
      time: '30 menit',
      comment:
          'Episode ini benar-benar membuka mata! Aku baru tahu kalau rubah secerdas itu',
    ),
    Comment(
      image: AppAsset.photo3,
      name: 'Sierra',
      time: '1 jam',
      comment:
          'Aku jadi penasaran, kemampuan kognitif apa lagi yang dimiliki rubah? Terima kasih Hedgehog Hustle!',
    ),
  ];

  static final Map<String, dynamic> hedgehogPodcastData = {
    'audioPath': AppAsset.audioHedgehog,
    'lyrics': [
      {
        'time': Duration(seconds: 0),
        'text':
            'Hedgehog Hustle. Once upon a time, deep in the heart of a leafy forest, there lived a young hedgehog named Harry. Harry had a reputation for being the fastest little creature around.',
      },
      {
        'time': Duration(seconds: 10 + 3),
        'text':
            'Every morning, he would wake up just before dawn, stretching his tiny legs and rolling his quills, ready for a run through the forest trails.',
      },
      {
        'time': Duration(seconds: 20 + 2),
        'text':
            'One sunny day, as he prepared to start his morning hustle, he noticed a small crowd of forest animals gathered nearby.',
      },
      {
        'time': Duration(seconds: 30),
        'text':
            '"What’s going on?" he asked, curious. The wise old owl perched above smiled and announced, "We’re holding a race tomorrow to find the swiftest animal in the forest."',
      },
      {
        'time': Duration(seconds: 40),
        'text':
            'Harry’s eyes sparkled with excitement. "A race? I’ll show everyone how fast a hedgehog can hustle!" All day, he practiced, weaving between trees, leaping over logs, and whizzing past bushes.',
      },
      {
        'time': Duration(seconds: 50 + 5),
        'text':
            'When the big day came, the forest buzzed with anticipation as the animals lined up.',
      },
      {
        'time': Duration(seconds: 60),
        'text':
            'The race began, and Harry bolted forward, his little legs moving as fast as they could. The birds cheered, the rabbits clapped, and even the squirrels stopped to watch.',
      },
      {
        'time': Duration(seconds: 72),
        'text':
            'And as Harry dashed past the finish line, the forest burst into applause.',
      },
      {
        'time': Duration(seconds: 76),
        'text':
            'He had won, proving that even the smallest creature can make a big impact with a lot of heart and hustle.',
      },
      {
        'time': Duration(seconds: 80),
        'text': 'author niozihni',
      },
    ]
  };

  static final Map<String, dynamic> kancilPodcastData = {
    'audioPath': AppAsset.kancilEps1,
    'duration': const Duration(milliseconds: 278020),
    'lyrics': [
      {
        'time': Duration(milliseconds: 0),
        'text': '🌾 Kancil dan petani yang marah, di sebuah ladang yang luas,',
      },
      {
        'time': Duration(milliseconds: 4780),
        'text': '🚶‍♂️ Seorang petani berdiri dengan tangan di pinggang.',
      },
      {
        'time': Duration(milliseconds: 8040),
        'text': '🥒 Ia melihat tanaman mentimunya yang tumbuh subur,',
      },
      {
        'time': Duration(milliseconds: 11640),
        'text': '😊 Wajahnya berseri-seri.',
      },
      {
        'time': Duration(milliseconds: 13740),
        'text': '👨‍🌾 Petani,',
      },
      {
        'time': Duration(milliseconds: 14780),
        'text': '😃 Wah mentimun-mentimunku tahun ini tumbuh besar dan segar!',
      },
      {
        'time': Duration(milliseconds: 25140),
        'text': '🦊 Di balik semak-semak, kancil mengintip.',
      },
      {
        'time': Duration(milliseconds: 27520),
        'text': '👀 Matanya berbinar melihat mentimun-mentimun yang ranum,',
      },
      {
        'time': Duration(milliseconds: 31380),
        'text': '🤫 Kancil, berbisik...',
      },
      {
        'time': Duration(milliseconds: 33580),
        'text': '🤤 "Hmm, mentimun segar, pasti enak!"',
      },
      {
        'time': Duration(milliseconds: 46760),
        'text': '😋 *Lalu menggigitnya dengan lahap*',
      },
      {
        'time': Duration(milliseconds: 60260),
        'text': '👂 Tiba-tiba terdengar suara langkah kaki...',
      },
      {
        'time': Duration(milliseconds: 63340),
        'text': '😠 Petani berteriak,',
      },
      {
        'time': Duration(milliseconds: 65200),
        'text': '🔥 "Hey! Apa yang kau lakukan?!"',
      },
      {
        'time': Duration(milliseconds: 70700),
        'text':
            '😳 Kancil menoleh dan melihat petani berdiri dengan wajah merah padam.',
      },
      {
        'time': Duration(milliseconds: 79840),
        'text': '😱 "Aduh, ketahuan!"',
      },
      {
        'time': Duration(milliseconds: 81880),
        'text': '😡 Petani mendekat dengan marah.',
      },
      {
        'time': Duration(milliseconds: 84280),
        'text': '👊 "Dasar pencuri!"',
      },
      {
        'time': Duration(milliseconds: 91560),
        'text': '😏 Kancil tersenyum tenang.',
      },
      {
        'time': Duration(milliseconds: 94560),
        'text': '😅 "Eh, Pak Tani... aku cuma mencicipi sedikit~"',
      },
      {
        'time': Duration(milliseconds: 107340),
        'text': '🏃‍♂️ Petani mulai maju bersiap menangkap kancil!',
      },
      {
        'time': Duration(milliseconds: 124020),
        'text': '😂 Kancil tertawa,',
      },
      {
        'time': Duration(milliseconds: 126080),
        'text': '🤣 "Hehehe, petani harus lebih cepat kalau mau menangkapku!"',
      },
      {
        'time': Duration(milliseconds: 139320),
        'text': '😤 "Hff, hff, kau pikir bisa lolos terus?"',
      },
      {
        'time': Duration(milliseconds: 149300),
        'text': '🦊 "Aku tidak berpikir, Pak Tani, aku tahu aku bisa! 😆"',
      },
      {
        'time': Duration(milliseconds: 154700),
        'text': '🌳 Dengan satu lompatan cepat, kancil melesat ke dalam hutan!',
      },
      {
        'time': Duration(milliseconds: 168280),
        'text': '😡 "Dasar, kancil licik!"',
      },
      {
        'time': Duration(milliseconds: 176620),
        'text': '🤔 *Petani mendapatkan sebuah ide*',
      },
      {
        'time': Duration(milliseconds: 178480),
        'text': '😏 "Aku akan membuat jebakan untuknya!"',
      },
      {
        'time': Duration(milliseconds: 216280),
        'text': '🤨 "Pasti ada sesuatu yang tidak beres..."',
      },
      {
        'time': Duration(milliseconds: 250360),
        'text': '💥 *Batu itu jatuh ke dalam lubang!*',
      },
      {
        'time': Duration(milliseconds: 254060),
        'text': '😲 "Apa?! Jebakanku ketahuan?!"',
      },
      {
        'time': Duration(milliseconds: 257340),
        'text': '🤣 Kancil tertawa terbahak-bahak,',
      },
      {
        'time': Duration(milliseconds: 265940),
        'text': '🏃‍♂️ Dengan satu lompatan cepat, kancil kabur dari ladang!',
      },
      {
        'time': Duration(milliseconds: 274040),
        'text': '😅 Petani mengusap keringat.',
      },
      {
        'time': Duration(milliseconds: 275860),
        'text': '😆 "Hehehe, kancil memang cerdik,',
      },
      {
        'time': Duration(milliseconds: 278020),
        'text': '😏 Tapi aku tidak akan menyerah... tunggu di episode 2!"',
      },
    ]
  };
}
