import 'package:collab/features/feed/feed_screen.dart';
import 'package:collab/features/post/screens/add_post_screen.dart';
import 'package:flutter/material.dart';

class Constants {
  static const logoPath = 'assets/images/logo.png';
  static const loginEmotePath = 'assets/images/loginEmote.png';
  static const googlePath = 'assets/images/google.png';

  static const bannerDefault =
      'https://e1.pxfuel.com/desktop-wallpaper/324/303/desktop-wallpaper-banner-backgrounds-flex-design.jpg';
  static const avatarDefault =
      'https://imgs.search.brave.com/_jD7ZrKAp1CeE7L602f0ZXCoX18Ap-6RdSa8L2oUNqY/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9wdWIt/c3RhdGljLmZvdG9y/LmNvbS9hc3NldHMv/cHJvamVjdHMvcGFn/ZXMvY2MxZDkwZTlm/MGM0NDcyYTkzMmVm/NTNkNmY3NWI0N2Uv/Zm90b3ItNjViYzY4/NWM0MjI2NGNlNjky/ODMyNDNhNzYxMjY3/MjcuanBn';

  static const tabWidgets = [
    FeedScreen(),
    AddPostScreen(),
  ];

  static const IconData up = IconData(0xe800, fontFamily: 'MyFlutterApp', fontPackage: null);
  static const IconData down = IconData(0xe801, fontFamily: 'MyFlutterApp', fontPackage: null);

  static const awardsPath = 'assets/images/awards';

  static const awards = {
    'awesomeAns': '${Constants.awardsPath}/awesomeanswer.png',
    'gold': '${Constants.awardsPath}/gold.png',
    'platinum': '${Constants.awardsPath}/platinum.png',
    'helpful': '${Constants.awardsPath}/helpful.png',
    'plusone': '${Constants.awardsPath}/plusone.png',
    'rocket': '${Constants.awardsPath}/rocket.png',
    'thankyou': '${Constants.awardsPath}/thankyou.png',
    'til': '${Constants.awardsPath}/til.png',
  };
}