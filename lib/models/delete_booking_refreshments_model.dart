class DeleteBookingRefreshmentDetails {
  String? status;
  String? result;

  DeleteBookingRefreshmentDetails({this.status, this.result});

  DeleteBookingRefreshmentDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['result'] = result;
    return data;
  }
}
