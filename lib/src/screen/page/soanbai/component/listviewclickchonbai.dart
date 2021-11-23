import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/utils/colors.dart';
import 'package:flutter_masoi/src/utils/icon.dart';

class ListViewClickChonBai extends StatelessWidget {
  final String name, title;
  final String image;
  const ListViewClickChonBai({Key key, this.name, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 190,
      width: size.width * 0.4,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        height: 190,
        width: size.width * 0.4,
        child: Container(
            height: 190,
            width: 150,
            color: colorImage,
            child: Column(
              children: [
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset(image),
                ),
                Text('$name',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ))
              ],
            )),
      ),
    );
  }
}
