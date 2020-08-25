import 'package:flutter/material.dart';
import 'package:btv/streaming.dart';
import 'package:btv/jadwal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'beranda',
      home: HalAwal(),
    );
  }
}

class HalAwal extends StatefulWidget {
  @override
  _HalAwalState createState() => _HalAwalState();
}

class _HalAwalState extends State<HalAwal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        //banner
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Image.asset(
                      'images/dashboard.jpg',
                      height: 300,
                    ),
                  ),
                ),
                Container(
                  child: Column(children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 270.0, right: 50.0),
                      child: Text('Nonton BTV',
                          style: TextStyle(
                              color: Colors.lightBlue[900],
                              fontWeight: FontWeight.w100,
                              fontSize: 30.0)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0, left: 30.0),
                      child: Text('digenggaman kalian...',
                          style: TextStyle(
                              color: Colors.lightBlue[900],
                              fontWeight: FontWeight.w100,
                              fontSize: 25.0)),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 9.0, left: .0, right: 75),
                      child: Text('BTV satu yang beda',
                          style: TextStyle(
                              color: Colors.lightBlue[900],
                              fontWeight: FontWeight.w100,
                              fontSize: 15.0)),
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 470.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0))),
                    height: 305,
                  ),
                ),
                //banner
                //container icon bar
                Padding(
                  padding:
                      const EdgeInsets.only(top: 400.0, left: 13, right: 13),
                  child: Wrap(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 50.0,
                                    spreadRadius: 1.0,
                                    offset: Offset(
                                      10.0,
                                      10.0,
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0,
                                                left: 20,
                                                right: 20,
                                                bottom: 10),
                                            child: Column(
                                              children: <Widget>[
                                                Image.asset(
                                                  'images/tv1.png',
                                                  height: 45,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Text('Siaran Langsung',
                                                      style: TextStyle(
                                                          fontSize: 13.0)),
                                                )
                                              ],
                                            )),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        StreamingTV()));
                                      },
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Colors.white),
                                        child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0,
                                                left: 20,
                                                right: 20,
                                                bottom: 10),
                                            child: Column(
                                              children: <Widget>[
                                                Image.asset(
                                                  'images/jadwal.png',
                                                  height: 45,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 8.0),
                                                  child: Text(
                                                    'Jadwal Siaran',
                                                    style: TextStyle(
                                                        fontSize: 13.0),
                                                  ),
                                                )
                                              ],
                                            )),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        HalJadwal()));
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), //container icon bar
              ],
            ),
          ],
        ),
      ),
    );
  }
}
