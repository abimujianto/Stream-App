import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:async/async.dart';
import 'postdetailpage.dart';

class HalamanJadwal extends StatefulWidget {
  HalamanJadwal({Key key}) : super(key: key);

  @override
  _HalamanJadwalState createState() => _HalamanJadwalState();
}

class _HalamanJadwalState extends State<HalamanJadwal> {
  StreamSubscription<QuerySnapshot> subscription;

  List<DocumentSnapshot> snapshot;

  CollectionReference collectionReference =
      Firestore.instance.collection('Post');

  @override
  void initState() {
    super.initState();

    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        snapshot = datasnapshot.documents;
      });
    });
  }

  passData(DocumentSnapshot snap) {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) => PostDetails(
              snapshot: snap,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3.0,
        backgroundColor: Colors.red,
        title: Text('Jadwal Siaran'),
      ),
      body: new ListView.builder(
        itemCount: snapshot != null ? snapshot.length : 0,
        itemBuilder: (context, index) {
          return new Card(
            elevation: 4.0,
            margin: EdgeInsets.all(10.0),
            child: new Container(
              padding: EdgeInsets.all(10.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new CircleAvatar(
                    child: new Text(snapshot[index].data["title"][0], style: TextStyle(fontWeight: FontWeight.bold),),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  new SizedBox(
                    width: 10.0,
                  ),
                  new Container(
                    width: 210.0,
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new InkWell(
                          child: new Text(
                            snapshot[index].data["title"],
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                            maxLines: 1,
                          ),
                          
                          onTap: () => passData(snapshot[index]),
                        ),
                        
                        new SizedBox(
                          height: 5.0,
                        ),
                        new Text(
                          snapshot[index].data["content"],
                          maxLines: 1,
                        ),
                 
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
