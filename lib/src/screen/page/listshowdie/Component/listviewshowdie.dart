import 'package:flutter/material.dart';

class ListViewShowDie extends StatefulWidget {
  const ListViewShowDie({Key key}) : super(key: key);

  @override
  _ListViewShowDieState createState() => _ListViewShowDieState();
}

class _ListViewShowDieState extends State<ListViewShowDie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 350,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 2),
      ),
      child: Row(
        children: [
          Text(
            'Nguyen long ba',
            style: TextStyle(fontSize: 16),
          ),
          Spacer(),
          Text(
            'Nguoi soi',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
