class ResponseModel<T> {
  int? statusCode;
  String? message;
  T? result;

  ResponseModel({this.statusCode, this.message, this.result});

  @override
  String toString() {
    return 'ResponseModel{statusCode: $statusCode, statusMessage: $message,result: $result}';
  }
}
