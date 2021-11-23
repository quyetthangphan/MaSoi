import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/model/OTD/userOTD.dart';

class ListViewDanhSach extends StatefulWidget {
  const ListViewDanhSach({Key key, this.user}) : super(key: key);
  final UserOTD user;
  @override
  _listViewDanhSachState createState() => _listViewDanhSachState();
}

class _listViewDanhSachState extends State<ListViewDanhSach> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          height: size.height * 0.07,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.user.name),
                  widget.user.qt ? Text('Quan tro') : SizedBox(),
                  widget.user.ss ? Text('San sang') : SizedBox(),
                ],
              ),
            ],
          ),
        ),
        Divider(
          height: 20,
          thickness: 5,
        ),
      ],
    );
  }
}
