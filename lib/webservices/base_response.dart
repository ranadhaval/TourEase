class BaseResponse {
  String? resp;
  String? msg;

  BaseResponse({this.resp, this.msg});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    resp = json['resp'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resp'] = this.resp;
    data['msg'] = this.msg;
    return data;
  }
}
