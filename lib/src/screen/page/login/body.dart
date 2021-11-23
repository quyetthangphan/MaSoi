import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/controller/ControllerProvider.dart';
import 'package:flutter_masoi/src/model/ModelProvide.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  ControllerProvider controllerProvider;
  TextEditingController textEditingController = TextEditingController();
  ModelProvider model;
  @override
  void initState() {
    super.initState();
    model = Provider.of<ModelProvider>(context, listen: false);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controllerProvider = ControllerProvider(context: context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ma sói',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 100),
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nhap ten',
              ),
            ),
            SizedBox(height: 100),
            GestureDetector(
              onTap: () {
                model.changeNamePage(textEditingController.text);
                print(textEditingController.text);
                model.socket
                    .emit('joinroom', {"name": textEditingController.text});
                controllerProvider.changInitPageHome(1);
              },
              child: Container(
                height: 50,
                width: 120,
                child: Center(child: Text('Xác nhận')),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
