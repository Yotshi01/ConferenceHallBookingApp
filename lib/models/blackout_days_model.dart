class BlackoutDaysDetails {
  bool? status;
  String? message;
  List<BlackoutDaysData>? data;

  BlackoutDaysDetails({this.status, this.message, this.data});

  BlackoutDaysDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BlackoutDaysData>[];
      json['data'].forEach((v) {
        data!.add(BlackoutDaysData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BlackoutDaysData {
  int? blackoutDateId;
  String? blackoutDateTitle;
  String? blackoutDateDate;
  int? blackoutDateLocationId;
  String? blackoutDateCreatedAt;
  String? blackoutDateUpdatedAt;
  int? blackoutDateCreatedById;
  int? blackoutDateUpdatedById;
  int? blackoutDateStatus;

  BlackoutDaysData(
      {this.blackoutDateId,
      this.blackoutDateTitle,
      this.blackoutDateDate,
      this.blackoutDateLocationId,
      this.blackoutDateCreatedAt,
      this.blackoutDateUpdatedAt,
      this.blackoutDateCreatedById,
      this.blackoutDateUpdatedById,
      this.blackoutDateStatus});

  BlackoutDaysData.fromJson(Map<String, dynamic> json) {
    blackoutDateId = json['blackout_date_id'];
    blackoutDateTitle = json['blackout_date_title'];
    blackoutDateDate = json['blackout_date_date'];
    blackoutDateLocationId = json['blackout_date_location_id'];
    blackoutDateCreatedAt = json['blackout_date_created_at'];
    blackoutDateUpdatedAt = json['blackout_date_updated_at'];
    blackoutDateCreatedById = json['blackout_date_created_by_id'];
    blackoutDateUpdatedById = json['blackout_date_updated_by_id'];
    blackoutDateStatus = json['blackout_date_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['blackout_date_id'] = blackoutDateId;
    data['blackout_date_title'] = blackoutDateTitle;
    data['blackout_date_date'] = blackoutDateDate;
    data['blackout_date_location_id'] = blackoutDateLocationId;
    data['blackout_date_created_at'] = blackoutDateCreatedAt;
    data['blackout_date_updated_at'] = blackoutDateUpdatedAt;
    data['blackout_date_created_by_id'] = blackoutDateCreatedById;
    data['blackout_date_updated_by_id'] = blackoutDateUpdatedById;
    data['blackout_date_status'] = blackoutDateStatus;
    return data;
  }
}
