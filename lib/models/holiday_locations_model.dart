class HolidayLocationsDetails {
  bool? status;
  String? message;
  List<HolidayLocationsData>? data;

  HolidayLocationsDetails({this.status, this.message, this.data});

  HolidayLocationsDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <HolidayLocationsData>[];
      json['data'].forEach((v) {
        data!.add(new HolidayLocationsData.fromJson(v));
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

class HolidayLocationsData {
  int? id;
  int? holidayId;
  int? locationId;

  HolidayLocationsData({this.id, this.holidayId, this.locationId});

  HolidayLocationsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    holidayId = json['holiday_id'];
    locationId = json['location_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['holiday_id'] = this.holidayId;
    data['location_id'] = this.locationId;
    return data;
  }
}
