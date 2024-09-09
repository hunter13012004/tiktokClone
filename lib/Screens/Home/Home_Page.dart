import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/const/constStyle.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlickManager flickmanager;

  @override
  void initState() {
    flickmanager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
            'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FlickVideoPlayer(flickManager: flickmanager),
        Positioned(
            top: 400,
            left: 350,
            child: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                      size: 32,
                      color: Colors.red,
                    )),
                Text(
                  '20',
                  style: textStyle,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mode_comment_outlined,
                      size: 32,
                      color: Colors.red,
                    )),
                Text(
                  '20',
                  style: textStyle,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.send_sharp,
                      size: 32,
                      color: Colors.red,
                    )),
                Text(
                  '20',
                  style: textStyle,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      size: 32,
                      color: Colors.red,
                    )),
                Text(
                  '20',
                  style: textStyle,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.disc_full,
                      size: 40,
                      color: Colors.red,
                    )),
                Text(
                  '20',
                  style: textStyle,
                )
              ],
            )),
        Positioned(
            left: 20,
            top: 750,
            child: Row(
              children: [
                CircleAvatar(),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'John Doe',
                  style: textStyle,
                ),
              ],
            )),
      ],
    ));
  }
}
