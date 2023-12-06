class UpdateBooking {
  String? message;
  String? status;
  String? data;

  UpdateBooking({this.message, this.status, this.data});

  UpdateBooking.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['data'] = this.data;
    return data;
  }
}
