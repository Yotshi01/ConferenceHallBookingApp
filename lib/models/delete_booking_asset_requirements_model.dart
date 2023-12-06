class DeleteBookingAssetRequirementDetails {
  String? status;
  String? result;

  DeleteBookingAssetRequirementDetails({this.status, this.result});

  DeleteBookingAssetRequirementDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['result'] = result;
    return data;
  }
}
