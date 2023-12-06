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
        data!.add(LocationData.fromJson(v));
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

class LocationData {
  int? locationId;
  String? locationName;
  String? locationShortName;
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
      this.locationShortName,
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
    locationShortName = json['location_short_name'];
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['location_id'] = locationId;
    data['location_name'] = locationName;
    data['location_short_name'] = locationShortName;
    data['location_country_id'] = locationCountryId;
    data['location_state_id'] = locationStateId;
    data['location_district_id'] = locationDistrictId;
    data['location_city_id'] = locationCityId;
    data['location_address'] = locationAddress;
    data['location_created_at'] = locationCreatedAt;
    data['location_updated_at'] = locationUpdatedAt;
    data['location_created_by_id'] = locationCreatedById;
    data['location_updated_by_id'] = locationUpdatedById;
    data['location_status'] = locationStatus;
    return data;
  }
}
