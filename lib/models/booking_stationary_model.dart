class BookingStationaryDetails {
  String? status;
  String? message;
  List<BookingStationaryData>? data;

  BookingStationaryDetails({this.status, this.message, this.data});

  BookingStationaryDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <BookingStationaryData>[];
      json['data'].forEach((v) {
        data!.add(new BookingStationaryData.fromJson(v));
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

class BookingStationaryData {
  int? id;
  int? bookingId;
  int? stationaryId;
  String? bookingStationaryCreatedAt;

  BookingStationaryData(
      {this.id,
      this.bookingId,
      this.stationaryId,
      this.bookingStationaryCreatedAt});

  BookingStationaryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    stationaryId = json['stationary_id'];
    bookingStationaryCreatedAt = json['booking_stationary_created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['stationary_id'] = this.stationaryId;
    data['booking_stationary_created_at'] = this.bookingStationaryCreatedAt;
    return data;
  }
}
