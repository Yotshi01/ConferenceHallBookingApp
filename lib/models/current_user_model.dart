class CurrentUserData {
  int? id;
  String? name;
  String? userImg;
  String? email;
  String? emailVerifiedAt;
  String? firebaseToken;
  String? userCreatedAt;
  String? userUpdatedAt;
  int? userCreatedById;
  int? userUpdatedById;
  String? userContactNumber;
  int? userDepartmentId;
  int? userLocationId;
  String? userAddress;
  int? userrole;
  int? userCompanyId;
  int? userStatus;

  CurrentUserData(
      {this.id,
      this.name,
      this.userImg,
      this.email,
      this.emailVerifiedAt,
      this.firebaseToken,
      this.userCreatedAt,
      this.userUpdatedAt,
      this.userCreatedById,
      this.userUpdatedById,
      this.userContactNumber,
      this.userDepartmentId,
      this.userLocationId,
      this.userAddress,
      this.userrole,
      this.userCompanyId,
      this.userStatus});

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userImg = json['user_img'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    firebaseToken = json['firebase_token'];
    userCreatedAt = json['user_created_at'];
    userUpdatedAt = json['user_updated_at'];
    userCreatedById = json['user_created_by_id'];
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['user_img'] = userImg;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['firebase_token'] = firebaseToken;
    data['user_created_at'] = userCreatedAt;
    data['user_updated_at'] = userUpdatedAt;
    data['user_created_by_id'] = userCreatedById;
    data['user_updated_by_id'] = userUpdatedById;
    data['user_contact_number'] = userContactNumber;
    data['user_department_id'] = userDepartmentId;
    data['user_location_id'] = userLocationId;
    data['user_address'] = userAddress;
    data['userrole'] = userrole;
    data['user_company_id'] = userCompanyId;
    data['user_status'] = userStatus;
    return data;
  }
}
