class LocationModel {
  String? name;
  String? country;
  String? localtime;

//fills the Location variables.
  LocationModel(Map<String, dynamic> json) {
    name = json['name'];
    country = json['country'];
    localtime = json['localtime'];
  }
}
