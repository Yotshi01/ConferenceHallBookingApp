class BookingDetails {
  bool? status;
  String? message;
  List<Data>? data;

  BookingDetails({this.status, this.message, this.data});

  BookingDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
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

class Data {
  int? bookingId;
  String? toDate;
  String? fromDate;
  String? strTime;
  String? endTime;
  String? meetingTitle;
  String? departmentName;
  String? locationName;
  String? conferenceName;
  String? meetingDes;
  String? otherDetails;

  Data(
      {this.bookingId,
      this.toDate,
      this.fromDate,
      this.strTime,
      this.endTime,
      this.meetingTitle,
      this.departmentName,
      this.locationName,
      this.conferenceName,
      this.meetingDes,
      this.otherDetails});

  Data.fromJson(Map<String, dynamic> json) {
    bookingId = json['booking_id'];
    toDate = json['to_date'];
    fromDate = json['from_date'];
    strTime = json['str_time'];
    endTime = json['end_time'];
    meetingTitle = json['meeting_title'];
    departmentName = json['department_name'];
    locationName = json['location_name'];
    conferenceName = json['conference_name'];
    meetingDes = json['meeting_des'];
    otherDetails = json['other_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['booking_id'] = this.bookingId;
    data['to_date'] = this.toDate;
    data['from_date'] = this.fromDate;
    data['str_time'] = this.strTime;
    data['end_time'] = this.endTime;
    data['meeting_title'] = this.meetingTitle;
    data['department_name'] = this.departmentName;
    data['location_name'] = this.locationName;
    data['conference_name'] = this.conferenceName;
    data['meeting_des'] = this.meetingDes;
    data['other_details'] = this.otherDetails;
    return data;
  }
}
