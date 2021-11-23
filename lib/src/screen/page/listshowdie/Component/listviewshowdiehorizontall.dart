import 'package:flutter/material.dart';

class ListViewShowDieHorizontal extends StatefulWidget {
  const ListViewShowDieHorizontal({Key key}) : super(key: key);

  @override
  _ListViewShowDieHorizontalState createState() =>
      _ListViewShowDieHorizontalState();
}

class _ListViewShowDieHorizontalState extends State<ListViewShowDieHorizontal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 350,
      margin: EdgeInsets.symmetric(horizontal: 10),
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
