import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/model/ModelProvide.dart';
import 'package:flutter_masoi/src/utils/config.dart';
import 'package:provider/provider.dart';

class Index extends StatefulWidget {
  const Index({Key key}) : super(key: key);

  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  void initState() {
    Provider.of<ModelProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelProvider>(
      builder: (context, value, child) {
        return Config.configPage[value.initPage];
      },
    );
  }
}
