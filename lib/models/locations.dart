class LocationDetails {
  bool? status;
  String? message;
  List<LocationData>? data;

  LocationDetails({this.status, this.message, this.data});

  LocationDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <LocationData>[];
      json['data'].forEach((v) {
        data!.add(new LocationData.fromJson(v));
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

class LocationData {
  int? locationId;
  String? locationName;
  int? locationCountryId;
  int? locationStateId;
  int? locationDistrictId;
  int? locationCityId;
  String? locationAddress;
  String? locationCreatedAt;
  String? locationUpdatedAt;
  int? locationCreatedById;
  int? locationUpdatedById;
  int? locationStatus;

  LocationData(
      {this.locationId,
      this.locationName,
      this.locationCountryId,
      this.locationStateId,
      this.locationDistrictId,
      this.locationCityId,
      this.locationAddress,
      this.locationCreatedAt,
      this.locationUpdatedAt,
      this.locationCreatedById,
      this.locationUpdatedById,
      this.locationStatus});

  LocationData.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    locationName = json['location_name'];
    locationCountryId = json['location_country_id'];
    locationStateId = json['location_state_id'];
    locationDistrictId = json['location_district_id'];
    locationCityId = json['location_city_id'];
    locationAddress = json['location_address'];
    locationCreatedAt = json['location_created_at'];
    locationUpdatedAt = json['location_updated_at'];
    locationCreatedById = json['location_created_by_id'];
    locationUpdatedById = json['location_updated_by_id'];
    locationStatus = json['location_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['location_name'] = this.locationName;
    data['location_country_id'] = this.locationCountryId;
    data['location_state_id'] = this.locationStateId;
    data['location_district_id'] = this.locationDistrictId;
    data['location_city_id'] = this.locationCityId;
    data['location_address'] = this.locationAddress;
    data['location_created_at'] = this.locationCreatedAt;
    data['location_updated_at'] = this.locationUpdatedAt;
    data['location_created_by_id'] = this.locationCreatedById;
    data['location_updated_by_id'] = this.locationUpdatedById;
    data['location_status'] = this.locationStatus;
    return data;
  }
}
