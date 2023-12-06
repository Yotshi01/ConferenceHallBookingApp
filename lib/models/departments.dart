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
        data!.add(DepartmentData.fromJson(v));
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['department_id'] = departmentId;
    data['department_name'] = departmentName;
    data['department_code'] = departmentCode;
    data['department_created_by_id'] = departmentCreatedById;
    data['department_created_at'] = departmentCreatedAt;
    data['department_updated_by_id'] = departmentUpdatedById;
    data['department_updated_at'] = departmentUpdatedAt;
    data['department_status'] = departmentStatus;
    data['department_location_id'] = departmentLocationId;
    return data;
  }
}
