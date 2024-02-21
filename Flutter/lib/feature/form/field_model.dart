class FieldModel {
  int? id;
  num? spendMoney, earnMoney;
  String? name;
  FieldModel({this.earnMoney, this.id, this.name, this.spendMoney});
  factory FieldModel.fromJson(Map<String, dynamic> json) {
    return FieldModel(
      id: json['id'],
      name: json['name'],
      spendMoney: json['money_spend'],
      earnMoney: json['price'],
    );
  }
}
