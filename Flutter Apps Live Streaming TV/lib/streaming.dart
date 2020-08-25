import 'package:flutter/material.dart';
import 'package:gplayer/defaultmediacontrol.dart';
import 'package:gplayer/gplayer.dart';
import 'package:screen/screen.dart';

class StreamingTV extends StatefulWidget {
  StreamingTV({Key key}) : super(key: key);

  @override
  _StreamingTVState createState() => _StreamingTVState();
}

class _StreamingTVState extends State<StreamingTV> {
  GPlayer player;

  @override
  void initState() {
    super.initState();

    Screen.keepOn(true);

    player = GPlayer(
        // uri: 'link rtmp server disni',
        options: [Option(1, 'multiple_requests', 1)],
        mediaController: DefaultMediaController(
            title: 'Siaran Tv', gestureControlEnabled: true))
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
      title: 'Streaming BTV',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[50],
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 18.0,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text(
            'Streaming BTV',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontFamily: 'RobotoMon'),
          ),
          elevation: 0.0,
        ),
        backgroundColor: Colors.red[50],
        body: Builder(
          builder: (context) => Padding(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Potrait/Landscape Fullscreen:',
                            style: TextStyle(color: Colors.black),
                          ),
                          Switch(
                              activeColor: Colors.red[800],
                              value: player.landscapeWhenFullScreen,
                              onChanged: (_) {
                                player.landscapeWhenFullScreen = _;
                                setState(() {});
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red[800],
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
