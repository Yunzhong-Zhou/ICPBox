import 'information_model.dart';

class Information1List{
  final String? time;
  final InformationList? itmelist;

  Information1List({this.time, this.itmelist});

  factory Information1List.fromJson(String time,dynamic itmelist) {
    return Information1List(
      time: time,
      itmelist: itmelist,
    );
  }
}