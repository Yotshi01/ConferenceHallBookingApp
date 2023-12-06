class RequestResponseResponse {
  String? message;
  String? status;
  String? data;

  RequestResponseResponse({this.message, this.status, this.data});

  RequestResponseResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['data'] = data;
    return data;
  }
}
