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
        data!.add(new BlackoutDaysData.fromJson(v));
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['blackout_date_id'] = this.blackoutDateId;
    data['blackout_date_title'] = this.blackoutDateTitle;
    data['blackout_date_date'] = this.blackoutDateDate;
    data['blackout_date_location_id'] = this.blackoutDateLocationId;
    data['blackout_date_created_at'] = this.blackoutDateCreatedAt;
    data['blackout_date_updated_at'] = this.blackoutDateUpdatedAt;
    data['blackout_date_created_by_id'] = this.blackoutDateCreatedById;
    data['blackout_date_updated_by_id'] = this.blackoutDateUpdatedById;
    data['blackout_date_status'] = this.blackoutDateStatus;
    return data;
  }
}
