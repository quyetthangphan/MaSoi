import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/screen/page/listshowdie/Component/listviewshowdie.dart';
import 'package:flutter_masoi/src/screen/page/listshowdie/Component/listviewshowdiehorizontall.dart';

class ListShowDie extends StatefulWidget {
  const ListShowDie({Key key}) : super(key: key);

  @override
  _ListShowDieState createState() => _ListShowDieState();
}

class _ListShowDieState extends State<ListShowDie> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  width: size.width,
                  padding: EdgeInsets.only(top: 17, left: 20),
                  child: Text(
                    'Da chet',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: size.width,
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ListViewShowDieHorizontal(),
                  ListViewShowDieHorizontal(),
                  ListViewShowDieHorizontal(),
                  ListViewShowDieHorizontal(),
                  ListViewShowDieHorizontal(),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
              child: Container(
                width: size.width * 0.8,
                height: 500,
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    ListViewShowDie(),
                    ListViewShowDie(),
                    ListViewShowDie(),
                    ListViewShowDie(),
                    ListViewShowDie(),
                    ListViewShowDie(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              width: 120,
              decoration: BoxDecoration(border: Border.all(width: 2)),
              alignment: Alignment.center,
              child: Text('Ket thuc',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }
}
