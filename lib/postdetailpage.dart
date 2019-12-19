import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostDetails extends StatefulWidget {
  DocumentSnapshot snapshot;

  PostDetails({this.snapshot});
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Jadwal Siaran')
        ),
        body: new Card(
          elevation: 10.0,
          margin: EdgeInsets.all(10.0),
          child: new ListView(
            children: <Widget>[
              new Container(
                //  height: 120.0,
                //  width: 220.0,
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    new CircleAvatar(
                      child: new Text(widget.snapshot.data["title"][0], style: TextStyle( fontWeight: FontWeight.bold)),
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text(
                      widget.snapshot.data['title'],
                      style: TextStyle(fontSize: 22.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
              new SizedBox(height: 10.0),
              new Container(
                margin: EdgeInsets.all(10.0),
                child: new Text(
                  widget.snapshot.data["content"],
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ],
          ),
        ));
  }
}
