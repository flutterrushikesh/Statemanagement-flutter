class ErrorMessageModel {
  String? myMessage;

//fills the ErroeMessageModel variables.
  ErrorMessageModel(Map<String, dynamic> json) {
    myMessage = json['message'];
  }
}
