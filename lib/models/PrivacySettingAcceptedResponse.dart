class PrivacySettingAcceptedResponse {
  bool? success;
  int? code;
  String? message;
  PrivacyData? data;

  PrivacySettingAcceptedResponse(
      {this.success, this.code, this.message, this.data});

  PrivacySettingAcceptedResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? PrivacyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class PrivacyData {
  int? totalCount;
  UserPrivacyData? data;

  PrivacyData({this.totalCount, this.data});

  PrivacyData.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    data = json['data'] != null ? UserPrivacyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCount'] = totalCount;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserPrivacyData {
  int? privacyPolicyId;
  int? userPrivacyPolicyId;
  int? userId;
  String? acceptedOn;
  String? updatedOn;
  String? adminApprovalStatus;

  UserPrivacyData(
      {this.privacyPolicyId,
        this.userPrivacyPolicyId,
        this.userId,
        this.acceptedOn,
        this.updatedOn,
        this.adminApprovalStatus});

  UserPrivacyData.fromJson(Map<String, dynamic> json) {
    privacyPolicyId = json['privacy_policy_id'];
    userPrivacyPolicyId = json['user_privacy_policy_id'];
    userId = json['user_id'];
    acceptedOn = json['accepted_on'];
    updatedOn = json['updated_on'];
    adminApprovalStatus = json['admin_approval_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['privacy_policy_id'] = privacyPolicyId;
    data['user_privacy_policy_id'] = userPrivacyPolicyId;
    data['user_id'] = userId;
    data['accepted_on'] = acceptedOn;
    data['updated_on'] = updatedOn;
    data['admin_approval_status'] = adminApprovalStatus;
    return data;
  }
}
