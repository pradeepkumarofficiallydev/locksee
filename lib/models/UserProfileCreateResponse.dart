class UserProfileCreateResponse {
  int? statusCode;
  String? message;
  Result? result;

  UserProfileCreateResponse({this.statusCode, this.message, this.result});

  UserProfileCreateResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? phoneNumber;
  Null? otp;
  Null? otpExpires;
  bool? isVerified;
  String? username;
  String? bio;
  String? dob;
  Null? profilePicture;
  bool? onlineStatus;
  String? sId;
  String? lastSeen;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Result(
      {this.phoneNumber,
        this.otp,
        this.otpExpires,
        this.isVerified,
        this.username,
        this.bio,
        this.dob,
        this.profilePicture,
        this.onlineStatus,
        this.sId,
        this.lastSeen,
        this.createdAt,
        this.updatedAt,
        this.iV});

  Result.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phoneNumber'];
    otp = json['otp'];
    otpExpires = json['otpExpires'];
    isVerified = json['isVerified'];
    username = json['username'];
    bio = json['bio'];
    dob = json['dob'];
    profilePicture = json['profilePicture'];
    onlineStatus = json['onlineStatus'];
    sId = json['_id'];
    lastSeen = json['lastSeen'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    data['otp'] = this.otp;
    data['otpExpires'] = this.otpExpires;
    data['isVerified'] = this.isVerified;
    data['username'] = this.username;
    data['bio'] = this.bio;
    data['dob'] = this.dob;
    data['profilePicture'] = this.profilePicture;
    data['onlineStatus'] = this.onlineStatus;
    data['_id'] = this.sId;
    data['lastSeen'] = this.lastSeen;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
