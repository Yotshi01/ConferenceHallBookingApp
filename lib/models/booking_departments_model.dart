class BookingDepartmentsResponse {
  String? message;
  String? status;
  List<BookingDepartmentsData>? data;

  BookingDepartmentsResponse({this.message, this.status, this.data});

  BookingDepartmentsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <BookingDepartmentsData>[];
      json['data'].forEach((v) {
        data!.add(BookingDepartmentsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingDepartmentsData {
  int? id;
  int? bookingId;
  int? departmentId;
  String? createdAt;

  BookingDepartmentsData(
      {this.id, this.bookingId, this.departmentId, this.createdAt});

  BookingDepartmentsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['booking_id'] = bookingId;
    data['department_id'] = departmentId;
    data['created_at'] = createdAt;
    return data;
  }
}
