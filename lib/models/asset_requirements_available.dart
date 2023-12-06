class AssetRequirementsAvailableDetails {
  bool? status;
  String? message;
  List<AssetRequirementsAvailableData>? data;

  AssetRequirementsAvailableDetails({this.status, this.message, this.data});

  AssetRequirementsAvailableDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AssetRequirementsAvailableData>[];
      json['data'].forEach((v) {
        data!.add(AssetRequirementsAvailableData.fromJson(v));
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

class AssetRequirementsAvailableData {
  int? assetRequirementId;
  String? assetRequirementName;
  int? assetRequirementStatus;
  String? assetRequirementCreatedAt;
  int? assetRequirementCreatedById;

  AssetRequirementsAvailableData(
      {this.assetRequirementId,
      this.assetRequirementName,
      this.assetRequirementStatus,
      this.assetRequirementCreatedAt,
      this.assetRequirementCreatedById});

  AssetRequirementsAvailableData.fromJson(Map<String, dynamic> json) {
    assetRequirementId = json['asset_requirement_id'];
    assetRequirementName = json['asset_requirement_name'];
    assetRequirementStatus = json['asset_requirement_status'];
    assetRequirementCreatedAt = json['asset_requirement_created_at'];
    assetRequirementCreatedById = json['asset_requirement_created_by_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['asset_requirement_id'] = assetRequirementId;
    data['asset_requirement_name'] = assetRequirementName;
    data['asset_requirement_status'] = assetRequirementStatus;
    data['asset_requirement_created_at'] = assetRequirementCreatedAt;
    data['asset_requirement_created_by_id'] = assetRequirementCreatedById;
    return data;
  }
}
