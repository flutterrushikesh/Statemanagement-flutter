class ErrorMessageModel {
  String? myMessage;

  ErrorMessageModel(Map<String, dynamic> json) {
    myMessage = json['message'];
  }
}
