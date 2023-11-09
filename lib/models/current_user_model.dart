class CurrentUserData {
  int? id;
  String? name;
  String? userImg;
  String? email;
  String? emailVerifiedAt;
  int? userCreatedAt;
  int? userUpdatedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_img'] = this.userImg;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['user_created_at'] = this.userCreatedAt;
    data['user_updated_at'] = this.userUpdatedAt;
    data['user_created_by_id'] = this.userCreatedById;
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
