class DepartmentDetails {
  bool? status;
  String? message;
  List<DepartmentData>? data;

  DepartmentDetails({this.status, this.message, this.data});

  DepartmentDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DepartmentData>[];
      json['data'].forEach((v) {
        data!.add(new DepartmentData.fromJson(v));
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

class DepartmentData {
  int? departmentId;
  String? departmentName;
  String? departmentCode;
  int? departmentCreatedById;
  String? departmentCreatedAt;
  int? departmentUpdatedById;
  String? departmentUpdatedAt;
  int? departmentStatus;
  int? departmentLocationId;

  DepartmentData(
      {this.departmentId,
      this.departmentName,
      this.departmentCode,
      this.departmentCreatedById,
      this.departmentCreatedAt,
      this.departmentUpdatedById,
      this.departmentUpdatedAt,
      this.departmentStatus,
      this.departmentLocationId});

  DepartmentData.fromJson(Map<String, dynamic> json) {
    departmentId = json['department_id'];
    departmentName = json['department_name'];
    departmentCode = json['department_code'];
    departmentCreatedById = json['department_created_by_id'];
    departmentCreatedAt = json['department_created_at'];
    departmentUpdatedById = json['department_updated_by_id'];
    departmentUpdatedAt = json['department_updated_at'];
    departmentStatus = json['department_status'];
    departmentLocationId = json['department_location_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['department_id'] = this.departmentId;
    data['department_name'] = this.departmentName;
    data['department_code'] = this.departmentCode;
    data['department_created_by_id'] = this.departmentCreatedById;
    data['department_created_at'] = this.departmentCreatedAt;
    data['department_updated_by_id'] = this.departmentUpdatedById;
    data['department_updated_at'] = this.departmentUpdatedAt;
    data['department_status'] = this.departmentStatus;
    data['department_location_id'] = this.departmentLocationId;
    return data;
  }
}
