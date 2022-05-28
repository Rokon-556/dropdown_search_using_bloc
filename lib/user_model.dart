class StateModel {
  String? district;
  List<String>? thanas;

  StateModel({required this.district,required this.thanas});

  StateModel.fromJson(Map<String, dynamic> json) {
    district = json['district'];
    thanas = json['thana'].cast<String>();
  }
}
