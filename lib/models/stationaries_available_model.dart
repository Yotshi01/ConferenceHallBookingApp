class StationariesAvailableDetails {
  bool? status;
  String? message;
  List<StationariesAvailableData>? data;

  StationariesAvailableDetails({this.status, this.message, this.data});

  StationariesAvailableDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <StationariesAvailableData>[];
      json['data'].forEach((v) {
        data!.add(new StationariesAvailableData.fromJson(v));
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

class StationariesAvailableData {
  int? stationaryId;
  String? stationaryName;
  String? stationaryCreatedAt;
  String? stationaryUpdatedBy;

  StationariesAvailableData(
      {this.stationaryId,
      this.stationaryName,
      this.stationaryCreatedAt,
      this.stationaryUpdatedBy});

  StationariesAvailableData.fromJson(Map<String, dynamic> json) {
    stationaryId = json['stationary_id'];
    stationaryName = json['stationary_name'];
    stationaryCreatedAt = json['stationary_created_at'];
    stationaryUpdatedBy = json['stationary_updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stationary_id'] = this.stationaryId;
    data['stationary_name'] = this.stationaryName;
    data['stationary_created_at'] = this.stationaryCreatedAt;
    data['stationary_updated_by'] = this.stationaryUpdatedBy;
    return data;
  }
}
