class UsersApiResponse {
  String? status;
  String? message;
  List<UsersData>? data;

  UsersApiResponse({this.status, this.message, this.data});

  UsersApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <UsersData>[];
      json['data'].forEach((v) {
        data!.add(new UsersData.fromJson(v));
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

class UsersData {
  int? id;
  String? name;
  String? userImg;
  String? email;
  String? emailVerifiedAt;
  String? rememberToken;
  String? firebaseToken;
  String? userCreatedAt;
  String? userUpdatedAt;
  int? userUpdatedById;
  String? userContactNumber;
  int? userDepartmentId;
  int? userLocationId;
  String? userAddress;
  int? userrole;
  int? userCompanyId;
  int? userStatus;

  UsersData(
      {this.id,
      this.name,
      this.userImg,
      this.email,
      this.emailVerifiedAt,
      this.rememberToken,
      this.firebaseToken,
      this.userCreatedAt,
      this.userUpdatedAt,
      this.userUpdatedById,
      this.userContactNumber,
      this.userDepartmentId,
      this.userLocationId,
      this.userAddress,
      this.userrole,
      this.userCompanyId,
      this.userStatus});

  UsersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userImg = json['user_img'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    rememberToken = json['remember_token'];
    firebaseToken = json['firebase_token'];
    userCreatedAt = json['user_created_at'];
    userUpdatedAt = json['user_updated_at'];
    userUpdatedById = json['user_updated_by_id'];
    userContactNumber = json['user_contact_number'];
    userDepartmentId = json['user_department_id'];
    userLocationId = json['user_location_id'];
    userAddress = json['user_address'];
    userrole = json['userrole'];
    userCompanyId = json['user_company_id'];
    userStatus = json['user_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_img'] = this.userImg;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['remember_token'] = this.rememberToken;
    data['firebase_token'] = this.firebaseToken;
    data['user_created_at'] = this.userCreatedAt;
    data['user_updated_at'] = this.userUpdatedAt;
    data['user_updated_by_id'] = this.userUpdatedById;
    data['user_contact_number'] = this.userContactNumber;
    data['user_department_id'] = this.userDepartmentId;
    data['user_location_id'] = this.userLocationId;
    data['user_address'] = this.userAddress;
    data['userrole'] = this.userrole;
    data['user_company_id'] = this.userCompanyId;
    data['user_status'] = this.userStatus;
    return data;
  }
}
