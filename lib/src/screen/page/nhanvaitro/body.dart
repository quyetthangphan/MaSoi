import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/controller/ControllerProvider.dart';
import 'package:flutter_masoi/src/model/ModelProvide.dart';
import 'package:flutter_masoi/src/screen/page/nhanvaitro/component/listViewDanhSach.dart';
import 'package:provider/provider.dart';

class NhanVaiTro extends StatefulWidget {
  const NhanVaiTro({Key key}) : super(key: key);

  @override
  _NhanVaiTroState createState() => _NhanVaiTroState();
}

class _NhanVaiTroState extends State<NhanVaiTro> {
  ControllerProvider controllerProvider;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controllerProvider = ControllerProvider(context: context);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 50),
        width: size.width,
        height: size.height,
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              height: 50,
              width: size.width * 0.9,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      controllerProvider.changInitPageHome(0);
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
                  Spacer(
                    flex: 2,
                  ),
                  Text('Ma Sói',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w700)),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          controllerProvider.changInitPageHome(2);
                        },
                        child: Center(
                            child: Text(
                          'Soạn bài',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: size.width * 0.8,
              height: 500,
              child: Consumer<ModelProvider>(
                builder: (context, value, child) {
                  return ListView.builder(
                    itemCount: value.listUser.length,
                    itemBuilder: (context, index) {
                      return ListViewDanhSach(user: value.listUser[index]);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: size.width * 0.8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Provider.of<ModelProvider>(context, listen: false)
                          .socket
                          .emit("setQT");
                    },
                    child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.05,
                      child: Center(child: Text('Nhan quan tro')),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<ModelProvider>(context, listen: false)
                          .socket
                          .emit("ready");
                      //controllerProvider.changInitPageHome(3);
                    },
                    child: Container(
                      width: size.width * 0.3,
                      height: size.height * 0.05,
                      child: Center(child: Text('San sang')),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
