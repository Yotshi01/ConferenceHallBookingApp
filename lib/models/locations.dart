class Locations {
  bool? status;
  String? message;
  List<LocationData>? data;

  Locations({this.status, this.message, this.data});

  Locations.fromJson(Map<String, dynamic> json) {
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
  String? country;
  String? state;
  String? district;
  String? city;
  String? address;

  LocationData(
      {this.locationId,
      this.locationName,
      this.country,
      this.state,
      this.district,
      this.city,
      this.address});

  LocationData.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    locationName = json['location_name'];
    country = json['country'];
    state = json['state'];
    district = json['district'];
    city = json['city'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['location_name'] = this.locationName;
    data['country'] = this.country;
    data['state'] = this.state;
    data['district'] = this.district;
    data['city'] = this.city;
    data['address'] = this.address;
    return data;
  }
}
