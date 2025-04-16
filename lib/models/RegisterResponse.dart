class RegisterResponse {
  bool? success;
  int? code;
  String? message;
  Data? data;

  RegisterResponse({this.success, this.code, this.message, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? message;
  String? email;
  int? panelistId;
  String? firstName;
  int? countryId;
  String? userLocation;
  String? phoneNumber;

  Data(
      {this.message,
        this.email,
        this.panelistId,
        this.firstName,
        this.countryId,
        this.userLocation,
        this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    email = json['email'];
    panelistId = json['panelist_id'];
    firstName = json['first_name'];
    countryId = json['country_id'];
    userLocation = json['user_location'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['email'] = this.email;
    data['panelist_id'] = this.panelistId;
    data['first_name'] = this.firstName;
    data['country_id'] = this.countryId;
    data['user_location'] = this.userLocation;
    data['phone_number'] = this.phoneNumber;
    return data;
  }
}
