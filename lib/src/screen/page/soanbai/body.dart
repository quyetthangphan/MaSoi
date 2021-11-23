import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/controller/ControllerProvider.dart';
import 'package:flutter_masoi/src/model/ModelProvide.dart';
import 'package:flutter_masoi/src/screen/page/soanbai/component/listviewchonbaihorizontal.dart';
import 'package:flutter_masoi/src/screen/page/soanbai/component/listviewclickchonbai.dart';
import 'package:provider/provider.dart';

class CardChoose {
  int id;
  int count;
  CardChoose({this.id, this.count});
  Map<String, dynamic> toJson() => {
        'id': id,
        'count': count,
      };
}

class SoanBai extends StatefulWidget {
  const SoanBai({Key key}) : super(key: key);

  @override
  _SoanBaiState createState() => _SoanBaiState();
}

class _SoanBaiState extends State<SoanBai> {
  ControllerProvider controllerProvider;
  List<CardChoose> lCardChoose = [
    CardChoose(id: 0, count: 0),
    CardChoose(id: 1, count: 0),
    CardChoose(id: 2, count: 0),
    CardChoose(id: 3, count: 0),
    CardChoose(id: 4, count: 0),
    CardChoose(id: 5, count: 0),
    CardChoose(id: 6, count: 0),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controllerProvider = ControllerProvider(context: context);
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 50),
          height: size.height,
          width: size.width,
          alignment: Alignment.center,
          child: Container(
            height: size.height,
            width: size.width * 0.9,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    dynamic json =
                        jsonEncode(lCardChoose.map((e) => e.toJson()).toList());

                    Provider.of<ModelProvider>(context, listen: false)
                        .socket
                        .emit("chooseCard", json);
                  },
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(border: Border.all(width: 2)),
                      child: Icon(Icons.keyboard_arrow_left, size: 40),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                    height: 100,
                    width: size.width,
                    child: Consumer<ModelProvider>(
                      builder: (context, value, child) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: lCardChoose.length,
                          itemBuilder: (context, index) {
                            return lCardChoose[index].count != 0
                                ? GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        lCardChoose[index].count -= 1;
                                      });
                                    },
                                    child: ListViewChonBaiHorizontal(
                                        image: value.listCard[index].image,
                                        count: lCardChoose[index].count),
                                  )
                                : SizedBox();
                          },
                        );
                      },
                    )),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'tim kiem',
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: size.height * 0.5,
                  width: size.width * 0.9,
                  child: Consumer<ModelProvider>(
                    builder: (context, value, child) {
                      return ListView.builder(
                        itemCount: (value.listCard.length / 2).round(),
                        itemBuilder: (context, index) {
                          int check = value.listCard.length -
                              ((value.listCard.length / 2).round() + index + 1);
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    lCardChoose[index].count += 1;
                                  });
                                },
                                child: ListViewClickChonBai(
                                  name: value.listCard[index].name,
                                  title: value.listCard[index].title,
                                  image: value.listCard[index].image,
                                ),
                              ),
                              const SizedBox(width: 10),
                              check != -1
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          lCardChoose[
                                                  (value.listCard.length / 2)
                                                          .round() +
                                                      index]
                                              .count += 1;
                                        });
                                      },
                                      child: ListViewClickChonBai(
                                        name: value
                                            .listCard[
                                                (value.listCard.length / 2)
                                                        .round() +
                                                    index]
                                            .name,
                                        title: value
                                            .listCard[
                                                (value.listCard.length / 2)
                                                        .round() +
                                                    index]
                                            .title,
                                        image: value
                                            .listCard[
                                                (value.listCard.length / 2)
                                                        .round() +
                                                    index]
                                            .image,
                                      ),
                                    )
                                  : const SizedBox(width: 10),
                            ],
                          );
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
