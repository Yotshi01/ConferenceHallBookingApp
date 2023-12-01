class ReschedulingRequestResponse {
  String? status;
  String? message;
  List<ReschedulingRequestResponseData>? data;

  ReschedulingRequestResponse({this.status, this.message, this.data});

  ReschedulingRequestResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ReschedulingRequestResponseData>[];
      json['data'].forEach((v) {
        data!.add(new ReschedulingRequestResponseData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReschedulingRequestResponseData {
  int? requestId;
  int? requestBookingId;
  int? requestBookingUserId;
  int? requestRequesterId;
  String? requestReason;
  String? requestStatus;
  String? bookingRequestCreatedAt;

  ReschedulingRequestResponseData(
      {this.requestId,
      this.requestBookingId,
      this.requestBookingUserId,
      this.requestRequesterId,
      this.requestReason,
      this.requestStatus,
      this.bookingRequestCreatedAt});

  ReschedulingRequestResponseData.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    requestBookingId = json['request_booking_id'];
    requestBookingUserId = json['request_booking_user_id'];
    requestRequesterId = json['request_requester_id'];
    requestReason = json['request_reason'];
    requestStatus = json['request_status'];
    bookingRequestCreatedAt = json['booking_request_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.requestId;
    data['request_booking_id'] = this.requestBookingId;
    data['request_booking_user_id'] = this.requestBookingUserId;
    data['request_requester_id'] = this.requestRequesterId;
    data['request_reason'] = this.requestReason;
    data['request_status'] = this.requestStatus;
    data['booking_request_created_at'] = this.bookingRequestCreatedAt;
    return data;
  }
}
