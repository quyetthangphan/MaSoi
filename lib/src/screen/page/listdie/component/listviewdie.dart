import 'package:flutter/material.dart';

class ListViewDie extends StatefulWidget {
  const ListViewDie({Key key}) : super(key: key);

  @override
  _ListViewDieState createState() => _ListViewDieState();
}

class _ListViewDieState extends State<ListViewDie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 350,
      margin: EdgeInsets.symmetric(vertical: 5),
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
