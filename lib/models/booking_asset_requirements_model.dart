class BookingAssetRequirementDetails {
  String? message;
  String? status;
  List<BookingAssetRequirementData>? data;

  BookingAssetRequirementDetails({this.message, this.status, this.data});

  BookingAssetRequirementDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <BookingAssetRequirementData>[];
      json['data'].forEach((v) {
        data!.add(new BookingAssetRequirementData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingAssetRequirementData {
  int? id;
  int? bookingId;
  int? assetRequirementId;
  String? createdAt;

  BookingAssetRequirementData(
      {this.id, this.bookingId, this.assetRequirementId, this.createdAt});

  BookingAssetRequirementData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    assetRequirementId = json['asset_requirement_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['asset_requirement_id'] = this.assetRequirementId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
