class HolidayDetails {
  bool? status;
  String? message;
  List<HolidayData>? data;

  HolidayDetails({this.status, this.message, this.data});

  HolidayDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HolidayData>[];
      json['data'].forEach((v) {
        data!.add(new HolidayData.fromJson(v));
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

class HolidayData {
  String? holidayYear;
  String? holidayDate;
  String? holidayDay;
  String? holidayName;
  int? holidayId;
  int? holidayState;

  HolidayData(
      {this.holidayYear,
      this.holidayDate,
      this.holidayDay,
      this.holidayName,
      this.holidayId,
      this.holidayState});

  HolidayData.fromJson(Map<String, dynamic> json) {
    holidayYear = json['holiday_year'];
    holidayDate = json['holiday_date'];
    holidayDay = json['holiday_day'];
    holidayName = json['holiday_name'];
    holidayId = json['holiday_id'];
    holidayState = json['holiday_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holiday_year'] = this.holidayYear;
    data['holiday_date'] = this.holidayDate;
    data['holiday_day'] = this.holidayDay;
    data['holiday_name'] = this.holidayName;
    data['holiday_id'] = this.holidayId;
    data['holiday_state'] = this.holidayState;
    return data;
  }
}
