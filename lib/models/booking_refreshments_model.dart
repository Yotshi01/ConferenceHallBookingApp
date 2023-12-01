class BookingRefreshmentDetails {
  String? message;
  String? status;
  List<BookingRefreshmentData>? data;

  BookingRefreshmentDetails({this.message, this.status, this.data});

  BookingRefreshmentDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <BookingRefreshmentData>[];
      json['data'].forEach((v) {
        data!.add(new BookingRefreshmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BookingRefreshmentData {
  int? id;
  int? bookingId;
  int? refreshmentId;
  String? createdAt;

  BookingRefreshmentData(
      {this.id, this.bookingId, this.refreshmentId, this.createdAt});

  BookingRefreshmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    refreshmentId = json['refreshment_id'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['refreshment_id'] = this.refreshmentId;
    data['created_at'] = this.createdAt;
    return data;
  }
}
