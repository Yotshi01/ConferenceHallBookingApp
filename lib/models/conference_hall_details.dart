class ConferenceHallDetails {
  bool? status;
  String? message;
  List<ConferenceHallData>? data;

  ConferenceHallDetails({this.status, this.message, this.data});

  ConferenceHallDetails.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ConferenceHallData>[];
      json['data'].forEach((v) {
        data!.add(new ConferenceHallData.fromJson(v));
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

class ConferenceHallData {
  int? conferenceId;
  String? conferenceName;
  String? conferenceLocation;
  String? conferenceAddress;
  String? other;
  String? conferenceImg;
  String? aboutRoom;

  ConferenceHallData(
      {this.conferenceId,
      this.conferenceName,
      this.conferenceLocation,
      this.conferenceAddress,
      this.other,
      this.conferenceImg,
      this.aboutRoom});

  ConferenceHallData.fromJson(Map<String, dynamic> json) {
    conferenceId = json['conference_id'];
    conferenceName = json['conference_name'];
    conferenceLocation = json['conference_location'];
    conferenceAddress = json['conference_address'];
    other = json['other'];
    conferenceImg = json['conference_img'];
    aboutRoom = json['about_room'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conference_id'] = this.conferenceId;
    data['conference_name'] = this.conferenceName;
    data['conference_location'] = this.conferenceLocation;
    data['conference_address'] = this.conferenceAddress;
    data['other'] = this.other;
    data['conference_img'] = this.conferenceImg;
    data['about_room'] = this.aboutRoom;
    return data;
  }
}
