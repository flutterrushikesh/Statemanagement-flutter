class Condition {
  String? text;
  String? icon;
  int? code;

  Condition(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
}
