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
        data!.add(BookingAssetRequirementData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['booking_id'] = bookingId;
    data['asset_requirement_id'] = assetRequirementId;
    data['created_at'] = createdAt;
    return data;
  }
}
