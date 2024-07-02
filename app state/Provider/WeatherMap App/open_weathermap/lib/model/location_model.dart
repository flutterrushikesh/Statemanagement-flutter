class LocationModel {
  String? name;
  String? country;
  String? localtime;

  LocationModel(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    localtime = json['localtime'];
  }
}
