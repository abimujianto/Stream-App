import 'package:flutter/material.dart';
import 'package:gplayer/defaultmediacontrol.dart';
import 'package:gplayer/gplayer.dart';


class HalamanDua extends StatefulWidget {
  @override
  _HalamanDuaState createState() => _HalamanDuaState();
}

class _HalamanDuaState extends State<HalamanDua> {
  GPlayer player;

  
   @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //1.create & init player
    player = GPlayer(uri: '')
      ..init()
      ..addListener((_) {
        //update control button out of player
        setState(() {});
      });
  }
  

  void didUpdateWidget(oldWidget) {
    print('didUpdateWidget---------');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    player?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'BTV',
      // routes: {'videoList': (context) => VideoList()},
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('BTV Stream'),
        ),
        body: Builder(
          builder: (context) =>
              Padding(
                padding: EdgeInsets.only(top: 0),
                child: ListView(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: player.display,
                    ),
                    Padding(
                      padding: EdgeInsets.all(18),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Atur Tampilan Fullscreen (Potrait/Landscape):'),
                              Switch(
                                  value: player.landscapeWhenFullScreen,
                                  onChanged: (_) {
                                    player.landscapeWhenFullScreen = _;
                                    setState(() {});
                                  })
                            ],
                          ),
                          // RaisedButton.icon(
                          //     onPressed: () {
                          //       player?.mediaController
                          //           ?.control('toggleFloatWindow');
                          //     },
                          //     icon: Icon(Icons.featured_video),
                          //     label: Text("toggle float window")),
                          // RaisedButton.icon(
                          //     onPressed: () {
                          //       if (player.isPlaying) {
                          //         player.pause();
                          //       }
                          //       Navigator.pushNamed(context, 'videoList');
                          //     },
                          //     icon: Icon(Icons.list),
                          //     label: Text("video in list"))
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              player.isPlaying ? player.pause() : player.start();
            });
          },
          child: Icon(
            player.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }
}

class GPlayerHolder extends StatefulWidget {
  final String url;
  final String title;

  GPlayerHolder({this.url, this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return GPlayerHolderState();
  }
}

class GPlayerHolderState extends State<GPlayerHolder> {
  GPlayer player;

  @override
  void initState() {
    player = GPlayer(
        uri: widget.url,
        mediaController: DefaultMediaController(
            title: widget.title, gestureControlEnabled: false))
      ..init();
    super.initState();
  }


  @override
  void dispose() {
    player?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: player.display,
    );
  }
}

// class VideoList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Widget divider1 = Divider(
//       color: Colors.blue,
//     );
//     Widget divider2 = Divider(color: Colors.green);

//     const videos = [
//       'http://ivi.bupt.edu.cn/hls/cctv3hd.m3u8',
//       'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
//       'http://ivi.bupt.edu.cn/hls/cctv6hd.m3u8',
//       'http://zhibo.hkstv.tv/livestream/zb2yhapo/playlist.m3u8',
//       'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4',
//     ];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('video list'),
//       ),
//       body: ListView.separated(
//           shrinkWrap: true,
//           itemCount: videos.length,
//           itemBuilder: (context, index) {
//             return GPlayerHolder(
//               title: 'video $index',
//               url: videos[index],
//             );
//           },
//           separatorBuilder: (BuildContext context, int index) {
//             return index % 2 == 0 ? divider1 : divider2;
//           }),
//     );
//   }
// }




//STYLE 1
// import 'package:flutter/material.dart';
// import 'package:gplayer/gplayer.dart';
// import 'package:screen/screen.dart';

// class HalamanDua extends StatefulWidget {
//   @override
//   _HalamanDuaState createState() => _HalamanDuaState();
// }

// class _HalamanDuaState extends State<HalamanDua> {
//   GPlayer player;

//   @override
//   void initState() {
//     super.initState();
//     //1.create & init player
//     Screen.keepOn(true);

//     player = GPlayer(uri: '')
//       ..init()
//       ..addListener((_) {
//         //update control button out of player
//         setState(() {});
//       });
//     setState(() {
//       player.start();
//     });
//   }

//   @override
//   void dispose() {
//     player?.dispose(); //2.release player
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Stream BTV'),
//           backgroundColor: Colors.red,
//         ),
//        backgroundColor: Colors.black,
//         body: player.display,
    
//       ),
//     );
//   }
// }




