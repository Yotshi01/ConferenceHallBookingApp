class CurrentUserData {
  int? id;
  String? name;
  Null? userImg;
  String? email;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  String? contactNumber;
  String? deptSelect;
  Null? userLocation;
  Null? userPic;
  String? userAddress;
  String? userrole;

  CurrentUserData(
      {this.id,
      this.name,
      this.userImg,
      this.email,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt,
      this.contactNumber,
      this.deptSelect,
      this.userLocation,
      this.userPic,
      this.userAddress,
      this.userrole});

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userImg = json['user_img'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    contactNumber = json['contact_number'];
    deptSelect = json['DeptSelect'];
    userLocation = json['user_location'];
    userPic = json['user_pic'];
    userAddress = json['user_address'];
    userrole = json['userrole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_img'] = this.userImg;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['contact_number'] = this.contactNumber;
    data['DeptSelect'] = this.deptSelect;
    data['user_location'] = this.userLocation;
    data['user_pic'] = this.userPic;
    data['user_address'] = this.userAddress;
    data['userrole'] = this.userrole;
    return data;
  }
}
