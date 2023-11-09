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
  int? holidayStatus;
  int? holidayRaipurOffice;
  int? holidayDurgPlant;
  int? holidayStatesExcept;
  int? holidayOnlyFor;
  int? holidayHyderabadPlant;
  String? holidayCreatedAt;
  String? holidayUpdatedAt;
  int? holidayCreatedById;
  int? holidayUpdatedById;

  HolidayData(
      {this.holidayYear,
      this.holidayDate,
      this.holidayDay,
      this.holidayName,
      this.holidayId,
      this.holidayStatus,
      this.holidayRaipurOffice,
      this.holidayDurgPlant,
      this.holidayStatesExcept,
      this.holidayOnlyFor,
      this.holidayHyderabadPlant,
      this.holidayCreatedAt,
      this.holidayUpdatedAt,
      this.holidayCreatedById,
      this.holidayUpdatedById});

  HolidayData.fromJson(Map<String, dynamic> json) {
    holidayYear = json['holiday_year'];
    holidayDate = json['holiday_date'];
    holidayDay = json['holiday_day'];
    holidayName = json['holiday_name'];
    holidayId = json['holiday_id'];
    holidayStatus = json['holiday_status'];
    holidayRaipurOffice = json['holiday_raipur_office'];
    holidayDurgPlant = json['holiday_durg_plant'];
    holidayStatesExcept = json['holiday_states_except'];
    holidayOnlyFor = json['holiday_only_for'];
    holidayHyderabadPlant = json['holiday_hyderabad_plant'];
    holidayCreatedAt = json['holiday_created_at'];
    holidayUpdatedAt = json['holiday_updated_at'];
    holidayCreatedById = json['holiday_created_by_id'];
    holidayUpdatedById = json['holiday_updated_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['holiday_year'] = this.holidayYear;
    data['holiday_date'] = this.holidayDate;
    data['holiday_day'] = this.holidayDay;
    data['holiday_name'] = this.holidayName;
    data['holiday_id'] = this.holidayId;
    data['holiday_status'] = this.holidayStatus;
    data['holiday_raipur_office'] = this.holidayRaipurOffice;
    data['holiday_durg_plant'] = this.holidayDurgPlant;
    data['holiday_states_except'] = this.holidayStatesExcept;
    data['holiday_only_for'] = this.holidayOnlyFor;
    data['holiday_hyderabad_plant'] = this.holidayHyderabadPlant;
    data['holiday_created_at'] = this.holidayCreatedAt;
    data['holiday_updated_at'] = this.holidayUpdatedAt;
    data['holiday_created_by_id'] = this.holidayCreatedById;
    data['holiday_updated_by_id'] = this.holidayUpdatedById;
    return data;
  }
}
