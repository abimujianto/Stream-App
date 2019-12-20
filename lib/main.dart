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







