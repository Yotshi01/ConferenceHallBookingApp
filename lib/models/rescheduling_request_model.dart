class ReschedulingRequestDetails {
  String? message;
  String? status;
  ReschedulingRequestData? data;

  ReschedulingRequestDetails({this.message, this.status, this.data});

  ReschedulingRequestDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? ReschedulingRequestData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ReschedulingRequestData {
  int? requestBookingId;
  int? requestBookingUserId;
  int? requestRequesterId;
  String? requestReason;
  String? requestStatus;
  int? requestId;
  String? bookingRequestCreatedAt;

  ReschedulingRequestData(
      {this.requestBookingId,
      this.requestBookingUserId,
      this.requestRequesterId,
      this.requestReason,
      this.requestStatus,
      this.requestId,
      this.bookingRequestCreatedAt});

  ReschedulingRequestData.fromJson(Map<String, dynamic> json) {
    requestBookingId = json['request_booking_id'].toInt();
    requestBookingUserId = json['request_booking_user_id'].toInt();
    requestRequesterId = json['request_requester_id'].toInt();
    requestReason = json['request_reason'];
    requestStatus = json['request_status'];
    requestId = json['request_id'].toInt();
    bookingRequestCreatedAt = json['booking_request_created_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['request_booking_id'] = requestBookingId;
    data['request_booking_user_id'] = requestBookingUserId;
    data['request_requester_id'] = requestRequesterId;
    data['request_reason'] = requestReason;
    data['request_status'] = requestStatus;
    data['request_id'] = requestId;
    data['booking_request_created_at'] = bookingRequestCreatedAt;
    return data;
  }
}
