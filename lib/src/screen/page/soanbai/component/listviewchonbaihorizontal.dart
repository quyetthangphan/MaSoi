import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/utils/colors.dart';

class ListViewChonBaiHorizontal extends StatelessWidget {
  final String image;
  final int count;
  const ListViewChonBaiHorizontal({
    Key key,
    this.image,
    this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 80,
      color: colorImage,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Image.asset(image),
          ),
          Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: 16,
                height: 16,
                color: Colors.white,
                child: Center(
                  child: Text('$count', style: TextStyle(fontSize: 12)),
                ),
              ))
        ],
      ),
    );
  }
}
