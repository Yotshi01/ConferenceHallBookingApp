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
  int? prebookingId;
  String? prebookingTitle;
  String? prebookingDate;
  int? prebookingLocationId;
  String? prebookingCreatedAt;
  String? prebookingUpdatedAt;
  int? prebookingCreatedById;
  int? prebookingUpdatedById;
  int? prebookingStatus;

  BlackoutDaysData(
      {this.prebookingId,
      this.prebookingTitle,
      this.prebookingDate,
      this.prebookingLocationId,
      this.prebookingCreatedAt,
      this.prebookingUpdatedAt,
      this.prebookingCreatedById,
      this.prebookingUpdatedById,
      this.prebookingStatus});

  BlackoutDaysData.fromJson(Map<String, dynamic> json) {
    prebookingId = json['prebooking_id'];
    prebookingTitle = json['prebooking_title'];
    prebookingDate = json['prebooking_date'];
    prebookingLocationId = json['prebooking_location_id'];
    prebookingCreatedAt = json['prebooking_created_at'];
    prebookingUpdatedAt = json['prebooking_updated_at'];
    prebookingCreatedById = json['prebooking_created_by_id'];
    prebookingUpdatedById = json['prebooking_updated_by_id'];
    prebookingStatus = json['prebooking_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prebooking_id'] = this.prebookingId;
    data['prebooking_title'] = this.prebookingTitle;
    data['prebooking_date'] = this.prebookingDate;
    data['prebooking_location_id'] = this.prebookingLocationId;
    data['prebooking_created_at'] = this.prebookingCreatedAt;
    data['prebooking_updated_at'] = this.prebookingUpdatedAt;
    data['prebooking_created_by_id'] = this.prebookingCreatedById;
    data['prebooking_updated_by_id'] = this.prebookingUpdatedById;
    data['prebooking_status'] = this.prebookingStatus;
    return data;
  }
}
