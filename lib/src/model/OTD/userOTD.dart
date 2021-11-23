class UserOTD {
  String id, name;
  bool qt, ss;
  int card;
  UserOTD({this.id, this.name, this.qt, this.ss, this.card});

  UserOTD.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'],
        qt = json['qt'],
        ss = json['ss'],
        card = json['card'];
}
