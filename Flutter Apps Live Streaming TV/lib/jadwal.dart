import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HalJadwal extends StatefulWidget {
  @override
  _HalJadwalState createState() => _HalJadwalState();
}

class _HalJadwalState extends State<HalJadwal> {
  void initState() {
    super.initState();
    this.getData();
  }

  final String url = 'https://laravelbtv.000webhostapp.com/api/jadwal';
  List data;

  Future<String> getData() async {
    var res = await http
        .get(Uri.encodeFull(url), headers: {'accept': 'application/json'});

    setState(() {
      var content = json.decode(res.body);

      data = content['data'];
    });
    return 'success!';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Jadwal Siaran',
        home: Scaffold(
          //appbar
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 18.0,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            centerTitle: true,
            elevation: 5,
            backgroundColor: Colors.red[50],
            //  backgroundColor: Colors.white,
            title: Text(
              'Jadwal',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                  fontFamily: 'RobotoMon'),
            ),
          ),
          //appbar

          //bodybar
          body: Container(
            color: Colors.white10,
            child: ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(
                        top: 10.0, bottom: 15.0, left: 10.0, right: 10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      1.0,
                                      1.0,
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Column(children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(left: 10.0, top: 2.0),
                                child: ListTile(
                                  title: Text(
                                    data[index]['hari'],
                                    style: TextStyle(
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RobotoMon'),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 15.0),
                                child: ListTile(
                                  title: Text(
                                    data[index]['program_detail'],
                                    style: TextStyle(
                                        fontFamily: 'RobotoMon',
                                        color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ]),
                  );
                }),
          ),
        ));
  }
}
