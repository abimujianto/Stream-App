import 'package:btv/jadwal.dart';
import 'package:btv/streami.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // for top post
  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
      Firestore.instance.collection("TopPost");

  //for body post
  StreamSubscription<QuerySnapshot> sdsubscription;
  List<DocumentSnapshot> sdsnapshot;

  CollectionReference sdcollectionReference =
      Firestore.instance.collection("BodyPost");

  @override
  void initState() {
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });

    sdsubscription = sdcollectionReference.snapshots().listen((sddatasnap) {
      sdsnapshot = sddatasnap.documents;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jangan Lewatkan', style: TextStyle(color: Colors.white)),
        elevation: 3.0,
        backgroundColor: Colors.red,
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: new ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'BTV',
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              leading: Icon(Icons.tv),
              onTap: () => Navigator.pop(context),
            ),
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                'Siaran Yang Berlangsung',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              trailing: Icon(Icons.live_tv),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new HalamanDua())),
            ),
            ListTile(
              title: Text(
                'Jadwal Tayangan',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              trailing: Icon(Icons.list),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new HalamanJadwal())),
            ),
            Divider(
              height: 10.0,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                'Kembali ke Beranda',
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              trailing: Icon(Icons.arrow_right),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: new Container(
        height: MediaQuery.of(context).size.height,
        child: new ListView.builder(
          itemCount: sdsnapshot != null ? sdsnapshot.length : 0,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.all(10.0),
              child: new Container(
                padding: EdgeInsets.all(10.0),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new SizedBox(
                          width: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            new Icon(Icons.new_releases, color: Colors.black),
                          ],
                        ),
                        new Text(
                          sdsnapshot[index].data["title"],
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    new SizedBox(
                      height: 10.0,
                    ),
                    new Column(
                      children: <Widget>[
                        new ClipRRect(
                          borderRadius: BorderRadius.circular(1.0),
                          child: new Image.network(
                            sdsnapshot[index].data["url"],
                            height: 150.0,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:gplayer/defaultmediacontrol.dart';
// import 'package:gplayer/gplayer.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   GPlayer player;

  
//    @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     //1.create & init player
//     player = GPlayer(uri: 'rtmp://122.248.43.138:1935/ch10/myStream')
//       ..init()
//       ..addListener((_) {
//         //update control button out of player
//         setState(() {});
//       });
//   }
//   // void initState() {
//   //   super.initState();
//   //   player = GPlayer(
//   //       uri: 'rtmp://122.248.43.138:1935/ch10/myStream',
//   //       options: [Option(1, 'multiple_requests', 1)],
//   //       mediaController: DefaultMediaController(
//   //           title: 'Streaming BTV', gestureControlEnabled: true))
//   //     ..init()
//   //     ..addListener((_) {
//   //       //update control button out of player
//   //       setState(() {});
//   //     });
//   // }

//   void didUpdateWidget(oldWidget) {
//     print('didUpdateWidget---------');
//     super.didUpdateWidget(oldWidget);
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     player?.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
      
//       title: 'Video Demo',
//       // routes: {'videoList': (context) => VideoList()},
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           title: Text('BTV Stream'),
//         ),
//         body: Builder(
//           builder: (context) =>
//               Padding(
//                 padding: EdgeInsets.only(top: 0),
//                 child: ListView(
//                   children: <Widget>[
//                     AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: player.display,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.all(18),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Row(
//                             children: <Widget>[
//                               Text('landscapeWhenFullScreen:'),
//                               Switch(
//                                   value: player.landscapeWhenFullScreen,
//                                   onChanged: (_) {
//                                     player.landscapeWhenFullScreen = _;
//                                     setState(() {});
//                                   })
//                             ],
//                           ),
//                           // RaisedButton.icon(
//                           //     onPressed: () {
//                           //       player?.mediaController
//                           //           ?.control('toggleFloatWindow');
//                           //     },
//                           //     icon: Icon(Icons.featured_video),
//                           //     label: Text("toggle float window")),
//                           // RaisedButton.icon(
//                           //     onPressed: () {
//                           //       if (player.isPlaying) {
//                           //         player.pause();
//                           //       }
//                           //       Navigator.pushNamed(context, 'videoList');
//                           //     },
//                           //     icon: Icon(Icons.list),
//                           //     label: Text("video in list"))
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               player.isPlaying ? player.pause() : player.start();
//             });
//           },
//           child: Icon(
//             player.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class GPlayerHolder extends StatefulWidget {
//   final String url;
//   final String title;

//   GPlayerHolder({this.url, this.title});

//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return GPlayerHolderState();
//   }
// }

// class GPlayerHolderState extends State<GPlayerHolder> {
//   GPlayer player;

//   @override
//   void initState() {
//     player = GPlayer(
//         uri: widget.url,
//         mediaController: DefaultMediaController(
//             title: widget.title, gestureControlEnabled: false))
//       ..init();
//     super.initState();
//   }


//   @override
//   void dispose() {
//     player?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 16 / 9,
//       child: player.display,
//     );
//   }
// }
