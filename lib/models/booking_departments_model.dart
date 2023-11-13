class BookingDepartmentResponse {
  String? message;
  String? status;
  List<bool>? data;

  BookingDepartmentResponse({this.message, this.status, this.data});

  BookingDepartmentResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'].cast<bool>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    data['data'] = this.data;
    return data;
  }
}
