import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/controller/ControllerProvider.dart';
import 'package:flutter_masoi/src/screen/page/listdie/component/listviewdie.dart';

class ListDie extends StatefulWidget {
  const ListDie({Key key}) : super(key: key);

  @override
  _ListDieState createState() => _ListDieState();
}

class _ListDieState extends State<ListDie> {
  ControllerProvider controllerProvider;
  @override
  Widget build(BuildContext context) {
    controllerProvider = ControllerProvider(context: context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
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
            Divider(
              thickness: 5,
              indent: 20,
              endIndent: 20,
            ),
            SingleChildScrollView(
              child: Container(
                width: size.width * 0.8,
                height: 500,
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    ListViewDie(),
                    ListViewDie(),
                    ListViewDie(),
                    ListViewDie(),
                    ListViewDie(),
                    ListViewDie(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: () {
                controllerProvider.changInitPageHome(1);
              },
              child: Container(
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
            ),
          ],
        ),
      ),
    );
  }
}
