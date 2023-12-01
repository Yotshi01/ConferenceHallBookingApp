class RefreshmentsAvailableDetails {
  bool? status;
  String? message;
  List<RefreshmentsAvailableData>? data;

  RefreshmentsAvailableDetails({this.status, this.message, this.data});

  RefreshmentsAvailableDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <RefreshmentsAvailableData>[];
      json['data'].forEach((v) {
        data!.add(new RefreshmentsAvailableData.fromJson(v));
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

class RefreshmentsAvailableData {
  int? refreshmentId;
  String? refreshmentName;
  String? refreshmentCreatedAt;
  String? refreshmentUpdatedBy;

  RefreshmentsAvailableData(
      {this.refreshmentId,
      this.refreshmentName,
      this.refreshmentCreatedAt,
      this.refreshmentUpdatedBy});

  RefreshmentsAvailableData.fromJson(Map<String, dynamic> json) {
    refreshmentId = json['refreshment_id'];
    refreshmentName = json['refreshment_name'];
    refreshmentCreatedAt = json['refreshment_created_at'];
    refreshmentUpdatedBy = json['refreshment_updated_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refreshment_id'] = this.refreshmentId;
    data['refreshment_name'] = this.refreshmentName;
    data['refreshment_created_at'] = this.refreshmentCreatedAt;
    data['refreshment_updated_by'] = this.refreshmentUpdatedBy;
    return data;
  }
}
