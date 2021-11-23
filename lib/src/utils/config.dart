import 'package:flutter/material.dart';
import 'package:flutter_masoi/src/screen/page/listchonbai/body.dart';
import 'package:flutter_masoi/src/screen/page/listdie/body.dart';
import 'package:flutter_masoi/src/screen/page/listshowdie/body.dart';
import 'package:flutter_masoi/src/screen/page/login/body.dart';
import 'package:flutter_masoi/src/screen/page/nhanvaitro/body.dart';
import 'package:flutter_masoi/src/screen/page/soanbai/body.dart';

class Config {
  static List<Widget> configPage = [
    Login(),
    NhanVaiTro(),
    SoanBai(),
    ListChonBai(),
    ListDie(),
    ListShowDie(),
  ];
}
