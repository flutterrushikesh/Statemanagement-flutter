class ConditionModel {
  String? text;
  String? icon;
  int? code;

//fills the condition variables.
  ConditionModel(Map<String, dynamic> json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }
}
