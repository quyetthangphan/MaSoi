import 'package:flutter/foundation.dart';
import 'package:flutter_masoi/src/model/OTD/cardOTD.dart';
import 'package:flutter_masoi/src/model/OTD/userOTD.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class ModelProvider extends ChangeNotifier {
  int initPage = 0;
  String nameLogin;
  IO.Socket socket;
  CardOTD cardIndex;
  List<CardOTD> card = [];

  List<CardOTD> listCard = [
    CardOTD(
      name: 'Sói',
      title: 'Mỗi đêm, bạn sẽ thức dậy và chọn ra một người để giết.',
      image: 'assets/image/werewolf.png',
    ),
    CardOTD(
      name: 'Dân làng',
      title: 'Nhiệm vụ của bạn là tìm ra sói để mọi người cùng thắng.',
      image: 'assets/image/people.png',
    ),
    CardOTD(
      name: 'Bảo vệ',
      title:
          'Mỗi đêm, bạn được phép chọn một người để bảo vệ họ, bạn cũng có thể tự bảo vệ mình và bạn không được phép bảo vệ 1 người 2 đêm liên tiếp',
      image: 'assets/image/guard.png',
    ),
    CardOTD(
      name: 'Già làng',
      title: 'Bạn có 2 mạng và vote của bạn tính là 2.',
      image: 'assets/image/old.png',
    ),
    CardOTD(
      name: 'Phù thuỷ',
      title: 'Trong một đêm bạn được gọi dậy để sử dụng.',
      image: 'assets/image/witch.png',
    ),
    CardOTD(
      name: 'Tiên tri',
      title:
          'Bạn có 2 bình thuốc, 1 là cứu sống một người bị sói giết, 2 là giết một ai đó, bạn chỉ được sử dụng 1 lần trong ván.',
      image: 'assets/image/scientist.png',
    ),
    CardOTD(
      name: 'Ngố',
      title:
          'Bạn là bên thứ 3, hãy tìm mọi cách để mọi người vote chết bạn thì bạn sẽ thắng.',
      image: 'assets/image/joker.png',
    )
  ];

  List<UserOTD> listUser = [];

  void changeInitPage(int i) {
    initPage = i;
    notifyListeners();
  }

  void changeNamePage(String name) {
    nameLogin = name;
    notifyListeners();
  }

  void changeListUser(List<UserOTD> list) {
    listUser = list;
    print(listUser[0].qt);
    notifyListeners();
  }

  void changeCardIndex(CardOTD card) {
    cardIndex = card;
    notifyListeners();
  }

  void init() {
    socket = IO.io(
        'http://servermasoi.herokuapp.com/',
        OptionBuilder().setTransports(['websocket']) // lưu ý vì nó quan trọng
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build());
    socket.on('connect', (_) {
      print('connect');
      //socket.emit('msg', 'test');
    });
    socket.on('msg', (data) => print('=======msg=====' + data));
    socket.on('joinroom', (data) {
      changeListUser((data as List).map((e) => UserOTD.fromJson(e)).toList());
      int count = 0;
      listUser.forEach((e) {
        if (!e.ss) {
          count++;
        }
      });
      if (count == 0) {
        UserOTD acc =
            listUser.firstWhere((element) => element.name == nameLogin);
        if (acc.qt) {
          changeInitPage(4);
        } else {
          changeInitPage(3);
        }
      }
    });
    socket.on('card', (data) {
      print(data);
      cardIndex = listCard[data];
    });
    socket.on('chooseCard', (data) {
      if (data) {
        changeInitPage(1);
      }
    });
    socket.on('disconnect', (_) => print('disconnect'));
  }
}
