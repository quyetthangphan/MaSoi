import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/model/ModelProvide.dart';
import 'package:provider/provider.dart';

class ControllerProvider {
  final BuildContext context;
  ControllerProvider({this.context});
  void changInitPageHome(int i) {
    Provider.of<ModelProvider>(context, listen: false).changeInitPage(i);
  }
}
