import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/controller/ControllerProvider.dart';
import 'package:flutter_masoi/src/model/ModelProvide.dart';
import 'package:flutter_masoi/src/utils/colors.dart';
import 'package:flutter_masoi/src/utils/icon.dart';
import 'package:provider/provider.dart';

class ListChonBai extends StatefulWidget {
  String name;
  Image image;
  String title;
  ListChonBai({Key key, this.name, this.image, this.title}) : super(key: key);

  @override
  _ListChonBaiState createState() => _ListChonBaiState();
}

class _ListChonBaiState extends State<ListChonBai> {
  ControllerProvider controllerProvider;
  @override
  Widget build(BuildContext context) {
    controllerProvider = ControllerProvider(context: context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Consumer<ModelProvider>(
      builder: (context, value, child) {
        return value.cardIndex != null
            ? Container(
                padding: EdgeInsets.only(top: 50),
                height: size.height,
                width: size.width,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                      width: size.width * 0.9,
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          controllerProvider.changInitPageHome(1);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration:
                              BoxDecoration(border: Border.all(width: 2)),
                          child: Icon(Icons.keyboard_arrow_left, size: 40),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      height: 380,
                      width: 360,
                      color: colorImage,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                        child: Image.asset(
                          value.cardIndex.image,
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(value.cardIndex.name,
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w700)),
                    Container(
                      height: size.height * 0.15,
                      width: size.width * 0.7,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          value.cardIndex.title,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Center(child: Text('Xin Cho Trong Giay Lat'));
      },
    ));
  }
}
