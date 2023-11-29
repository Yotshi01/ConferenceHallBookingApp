class AddBookingData {
  String? message;
  String? status;
  AddBookingResponseData? data;

  AddBookingData({this.message, this.status, this.data});

  AddBookingData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? new AddBookingResponseData.fromJson(json['data'])
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

class AddBookingResponseData {
  int? bookingId;
  String? bookingDate;
  String? bookingStartTime;
  String? bookingEndTime;
  String? bookingMeetingTitle;
  int? bookingLocationId;
  int? bookingConferenceId;
  String? bookingMeetingDescription;
  String? bookingRequirementDetails;
  int? bookingStatus;
  int? bookingWithdrawById;
  String? bookingWithdrawCreatedAt;
  String? bookingWithdrawReason;
  String? bookingFeedback;
  String? bookingFeedbackCreatedAt;
  int? userId;
  String? bookingCreatedAt;
  String? bookingUpdatedAt;
  int? bookingCreatedById;
  int? bookingUpdatedById;
  String? bookingReportedBy;
  int? bookingNumberOfAttendees;

  AddBookingResponseData(
      {this.bookingId,
      this.bookingDate,
      this.bookingStartTime,
      this.bookingEndTime,
      this.bookingMeetingTitle,
      this.bookingLocationId,
      this.bookingConferenceId,
      this.bookingMeetingDescription,
      this.bookingRequirementDetails,
      this.bookingStatus,
      this.bookingWithdrawById,
      this.bookingWithdrawCreatedAt,
      this.bookingWithdrawReason,
      this.bookingFeedback,
      this.bookingFeedbackCreatedAt,
      this.userId,
      this.bookingCreatedAt,
      this.bookingUpdatedAt,
      this.bookingCreatedById,
      this.bookingUpdatedById,
      this.bookingReportedBy,
      this.bookingNumberOfAttendees});

  AddBookingResponseData.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    bookingDate = json['booking_date'];
    bookingStartTime = json['booking_start_time'];
    bookingEndTime = json['booking_end_time'];
    bookingMeetingTitle = json['booking_meeting_title'];
    bookingLocationId = json['booking_location_id'];
    bookingConferenceId = json['booking_conference_id'];
    bookingMeetingDescription = json['booking_meeting_description'];
    bookingRequirementDetails = json['booking_requirement_details'];
    bookingStatus = json['booking_status'];
    bookingWithdrawById = json['booking_withdraw_by_id'];
    bookingWithdrawCreatedAt = json['booking_withdraw_created_at'];
    bookingWithdrawReason = json['booking_withdraw_reason'];
    bookingFeedback = json['booking_feedback'];
    bookingFeedbackCreatedAt = json['booking_feedback_created_at'];
    userId = json['user_id'];
    bookingCreatedAt = json['booking_created_at'];
    bookingUpdatedAt = json['booking_updated_at'];
    bookingCreatedById = json['booking_created_by_id'];
    bookingUpdatedById = json['booking_updated_by_id'];
    bookingReportedBy = json['booking_reported_by'];
    bookingNumberOfAttendees = json['booking_number_of_attendees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['booking_date'] = this.bookingDate;
    data['booking_start_time'] = this.bookingStartTime;
    data['booking_end_time'] = this.bookingEndTime;
    data['booking_meeting_title'] = this.bookingMeetingTitle;
    data['booking_location_id'] = this.bookingLocationId;
    data['booking_conference_id'] = this.bookingConferenceId;
    data['booking_meeting_description'] = this.bookingMeetingDescription;
    data['booking_requirement_details'] = this.bookingRequirementDetails;
    data['booking_status'] = this.bookingStatus;
    data['booking_withdraw_by_id'] = this.bookingWithdrawById;
    data['booking_withdraw_created_at'] = this.bookingWithdrawCreatedAt;
    data['booking_withdraw_reason'] = this.bookingWithdrawReason;
    data['booking_feedback'] = this.bookingFeedback;
    data['booking_feedback_created_at'] = this.bookingFeedbackCreatedAt;
    data['user_id'] = this.userId;
    data['booking_created_at'] = this.bookingCreatedAt;
    data['booking_updated_at'] = this.bookingUpdatedAt;
    data['booking_created_by_id'] = this.bookingCreatedById;
    data['booking_updated_by_id'] = this.bookingUpdatedById;
    data['booking_reported_by'] = this.bookingReportedBy;
    data['booking_number_of_attendees'] = this.bookingNumberOfAttendees;
    return data;
  }
}
