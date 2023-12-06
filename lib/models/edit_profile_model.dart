class EditProfileData {
  String? message;
  String? status;
  bool? data;

  EditProfileData({this.message, this.status, this.data});

  EditProfileData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    data['data'] = this.data;
    return data;
  }
}
