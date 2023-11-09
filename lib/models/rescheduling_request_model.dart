class ReschedulingRequestDetails {
  String? message;
  String? status;
  ReschedulingRequestData? data;

  ReschedulingRequestDetails({this.message, this.status, this.data});

  ReschedulingRequestDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? new ReschedulingRequestData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ReschedulingRequestData {
  int? requestBookingId;
  int? requestOrganizerId;
  int? requestRequesterId;
  String? requestReason;
  String? requestStatus;
  int? requestId;

  ReschedulingRequestData(
      {this.requestBookingId,
      this.requestOrganizerId,
      this.requestRequesterId,
      this.requestReason,
      this.requestStatus,
      this.requestId});

  ReschedulingRequestData.fromJson(Map<String, dynamic> json) {
    requestBookingId = json['request_booking_id'].toInt();
    requestOrganizerId = json['request_organizer_id'].toInt();
    requestRequesterId = json['request_requester_id'].toInt();
    requestReason = json['request_reason'];
    requestStatus = json['request_status'];
    requestId = json['request_id'].toInt();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_booking_id'] = this.requestBookingId;
    data['request_organizer_id'] = this.requestOrganizerId;
    data['request_requester_id'] = this.requestRequesterId;
    data['request_reason'] = this.requestReason;
    data['request_status'] = this.requestStatus;
    data['request_id'] = this.requestId;
    return data;
  }
}
