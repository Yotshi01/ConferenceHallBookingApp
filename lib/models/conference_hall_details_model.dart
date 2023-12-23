// class ConferenceHallDetails {
//   bool? status;
//   String? message;
//   List<ConferenceHallData>? data;

//   ConferenceHallDetails({this.status, this.message, this.data});

//   ConferenceHallDetails.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <ConferenceHallData>[];
//       json['data'].forEach((v) {
//         data!.add(ConferenceHallData.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['status'] = status;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class ConferenceHallData {
//   int? conferenceId;
//   String? conferenceName;
//   String? conferenceShortName;
//   int? conferenceLocationId;
//   String? conferenceAddress;
//   String? conferenceOther;
//   String? conferenceImg;
//   String? conferenceAboutRoom;
//   String? conferenceSeatingCapacity;
//   String? conferenceSeatingType;
//   String? conferenceWhiteboard;
//   String? conferenceAudioSystem;
//   String? conferenceLaptop;
//   String? conferenceMic;
//   String? conferenceCreatedAt;
//   String? conferenceUpdatedAt;
//   int? conferenceCreatedById;
//   int? conferenceUpdatedById;
//   int? conferenceStatus;

//   ConferenceHallData(
//       {this.conferenceId,
//       this.conferenceName,
//       this.conferenceShortName,
//       this.conferenceLocationId,
//       this.conferenceAddress,
//       this.conferenceOther,
//       this.conferenceImg,
//       this.conferenceAboutRoom,
//       this.conferenceSeatingCapacity,
//       this.conferenceSeatingType,
//       this.conferenceWhiteboard,
//       this.conferenceAudioSystem,
//       this.conferenceLaptop,
//       this.conferenceMic,
//       this.conferenceCreatedAt,
//       this.conferenceUpdatedAt,
//       this.conferenceCreatedById,
//       this.conferenceUpdatedById,
//       this.conferenceStatus});

//   ConferenceHallData.fromJson(Map<String, dynamic> json) {
//     conferenceId = json['conference_id'];
//     conferenceName = json['conference_name'];
//     conferenceShortName = json['conference_short_name'];
//     conferenceLocationId = json['conference_location_id'];
//     conferenceAddress = json['conference_address'];
//     conferenceOther = json['conference_other'];
//     conferenceImg = json['conference_img'];
//     conferenceAboutRoom = json['conference_about_room'];
//     conferenceSeatingCapacity = json['conference_seating_capacity'];
//     conferenceSeatingType = json['conference_seating_type'];
//     conferenceWhiteboard = json['conference_whiteboard'];
//     conferenceAudioSystem = json['conference_audio_system'];
//     conferenceLaptop = json['conference_laptop'];
//     conferenceMic = json['conference_mic'];
//     conferenceCreatedAt = json['conference_created_at'];
//     conferenceUpdatedAt = json['conference_updated_at'];
//     conferenceCreatedById = json['conference_created_by_id'];
//     conferenceUpdatedById = json['conference_updated_by_id'];
//     conferenceStatus = json['conference_status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = Map<String, dynamic>();
//     data['conference_id'] = conferenceId;
//     data['conference_name'] = conferenceName;
//     data['conference_short_name'] = conferenceShortName;
//     data['conference_location_id'] = conferenceLocationId;
//     data['conference_address'] = conferenceAddress;
//     data['conference_other'] = conferenceOther;
//     data['conference_img'] = conferenceImg;
//     data['conference_about_room'] = conferenceAboutRoom;
//     data['conference_seating_capacity'] = conferenceSeatingCapacity;
//     data['conference_seating_type'] = conferenceSeatingType;
//     data['conference_whiteboard'] = conferenceWhiteboard;
//     data['conference_audio_system'] = conferenceAudioSystem;
//     data['conference_laptop'] = conferenceLaptop;
//     data['conference_mic'] = conferenceMic;
//     data['conference_created_at'] = conferenceCreatedAt;
//     data['conference_updated_at'] = conferenceUpdatedAt;
//     data['conference_created_by_id'] = conferenceCreatedById;
//     data['conference_updated_by_Id'] = conferenceUpdatedById;
//     data['conference_status'] = conferenceStatus;
//     return data;
//   }
// }

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
  String? conferenceShortName;
  int? conferenceLocationId;
  String? conferenceAddress;
  String? conferenceOther;
  String? conferenceImg;
  String? conferenceAboutRoom;
  String? conferenceSeatingCapacity;
  String? conferenceSeatingType;
  String? conferenceWhiteboard;
  String? conferenceAudioSystem;
  String? conferenceLaptop;
  String? conferenceMic;
  String? conferenceCreatedAt;
  String? conferenceUpdatedAt;
  int? conferenceCreatedById;
  int? conferenceUpdatedById;
  int? conferenceStatus;

  ConferenceHallData(
      {this.conferenceId,
      this.conferenceName,
      this.conferenceShortName,
      this.conferenceLocationId,
      this.conferenceAddress,
      this.conferenceOther,
      this.conferenceImg,
      this.conferenceAboutRoom,
      this.conferenceSeatingCapacity,
      this.conferenceSeatingType,
      this.conferenceWhiteboard,
      this.conferenceAudioSystem,
      this.conferenceLaptop,
      this.conferenceMic,
      this.conferenceCreatedAt,
      this.conferenceUpdatedAt,
      this.conferenceCreatedById,
      this.conferenceUpdatedById,
      this.conferenceStatus});

  ConferenceHallData.fromJson(Map<String, dynamic> json) {
    conferenceId = json['conference_id'];
    conferenceName = json['conference_name'];
    conferenceShortName = json['conference_short_name'];
    conferenceLocationId = json['conference_location_id'];
    conferenceAddress = json['conference_address'];
    conferenceOther = json['conference_other'];
    conferenceImg = json['conference_img'];
    conferenceAboutRoom = json['conference_about_room'];
    conferenceSeatingCapacity = json['conference_seating_capacity'];
    conferenceSeatingType = json['conference_seating_type'];
    conferenceWhiteboard = json['conference_whiteboard'];
    conferenceAudioSystem = json['conference_audio_system'];
    conferenceLaptop = json['conference_laptop'];
    conferenceMic = json['conference_mic'];
    conferenceCreatedAt = json['conference_created_at'];
    conferenceUpdatedAt = json['conference_updated_at'];
    conferenceCreatedById = json['conference_created_by_id'];
    conferenceUpdatedById = json['conference_updated_by_id'];
    conferenceStatus = json['conference_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['conference_id'] = this.conferenceId;
    data['conference_name'] = this.conferenceName;
    data['conference_short_name'] = this.conferenceShortName;
    data['conference_location_id'] = this.conferenceLocationId;
    data['conference_address'] = this.conferenceAddress;
    data['conference_other'] = this.conferenceOther;
    data['conference_img'] = this.conferenceImg;
    data['conference_about_room'] = this.conferenceAboutRoom;
    data['conference_seating_capacity'] = this.conferenceSeatingCapacity;
    data['conference_seating_type'] = this.conferenceSeatingType;
    data['conference_whiteboard'] = this.conferenceWhiteboard;
    data['conference_audio_system'] = this.conferenceAudioSystem;
    data['conference_laptop'] = this.conferenceLaptop;
    data['conference_mic'] = this.conferenceMic;
    data['conference_created_at'] = this.conferenceCreatedAt;
    data['conference_updated_at'] = this.conferenceUpdatedAt;
    data['conference_created_by_id'] = this.conferenceCreatedById;
    data['conference_updated_by_id'] = this.conferenceUpdatedById;
    data['conference_status'] = this.conferenceStatus;
    return data;
  }
}
