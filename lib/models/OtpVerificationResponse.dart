class OtpVerificationResponse {
  int? statusCode;
  String? message;
  Result? result;

  OtpVerificationResponse({this.statusCode, this.message, this.result});

  OtpVerificationResponse.fromJson(Map<String, dynamic> json) {
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
  String? token;
  User? user;

  Result({this.token, this.user});

  Result.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? sId;
  String? phoneNumber;
  Null? otp;
  Null? otpExpires;
  bool? isVerified;
  bool? onlineStatus;
  String? lastSeen;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? bio;
  String? dob;
  String? profilePicture;
  String? username;

  User(
      {this.sId,
        this.phoneNumber,
        this.otp,
        this.otpExpires,
        this.isVerified,
        this.onlineStatus,
        this.lastSeen,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.bio,
        this.dob,
        this.profilePicture,
        this.username});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    phoneNumber = json['phoneNumber'];
    otp = json['otp'];
    otpExpires = json['otpExpires'];
    isVerified = json['isVerified'];
    onlineStatus = json['onlineStatus'];
    lastSeen = json['lastSeen'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    bio = json['bio'];
    dob = json['dob'];
    profilePicture = json['profilePicture'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['phoneNumber'] = this.phoneNumber;
    data['otp'] = this.otp;
    data['otpExpires'] = this.otpExpires;
    data['isVerified'] = this.isVerified;
    data['onlineStatus'] = this.onlineStatus;
    data['lastSeen'] = this.lastSeen;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['bio'] = this.bio;
    data['dob'] = this.dob;
    data['profilePicture'] = this.profilePicture;
    data['username'] = this.username;
    return data;
  }
}
