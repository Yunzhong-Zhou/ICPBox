class AddressModel {
  String? name;
  String? address;
  String? beizhu;

  AddressModel({this.name, this.address, this.beizhu});

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    beizhu = json['beizhu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['beizhu'] = this.beizhu;
    return data;
  }
}