class RewardsAllListDataResponse {
  bool? success;
  int? code;
  String? message;
  Data? data;

  RewardsAllListDataResponse(
      {this.success, this.code, this.message, this.data});

  RewardsAllListDataResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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
  dynamic? skip;
  dynamic? limit;
  dynamic? totalCount;
  List<RewardData>? data;

  Data({this.skip, this.limit, this.totalCount, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    skip = json['skip'];
    limit = json['limit'];
    totalCount = json['total_count'];
    if (json['data'] != null) {
      data = <RewardData>[];
      json['data'].forEach((v) {
        data!.add(RewardData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    data['total_count'] = this.totalCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RewardData {
  int? country;
  String? panelistStatus;
  int? remainingBalance;
  String? rewardType;
  int? createdOnYear;
  int? redemed;
  String? bonusType;
  String? createdOnn;
  String? adminApprovalStatus;
  String? rejectDate;
  String? reference;
  String? refer;
  String? createdOn;
  int? earn;
  String? subscriptionStatus;
  String? rewardStatus;



  RewardData(
      {this.country,
        this.panelistStatus,
        this.remainingBalance,
        this.rewardType,
        this.createdOnYear,
        this.redemed,
        this.bonusType,
        this.createdOnn,
        this.adminApprovalStatus,
        this.rejectDate,
        this.reference,
        this.refer,
        this.createdOn,
        this.earn,
        this.subscriptionStatus,
        this.rewardStatus});

  RewardData.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    panelistStatus = json['panelist_status'];
    remainingBalance = json['remaining_balance'];
    rewardType = json['reward_type'];
    createdOnYear = json['created_on_year'];
    redemed = json['redemed'];
    bonusType = json['bonus_type'];
    createdOnn = json['created_onn'];
    adminApprovalStatus = json['admin_approval_status'];
    rejectDate = json['reject_date'];
    reference = json['reference'];
    refer = json['refer'];
    createdOn = json['created_on'];
    earn = json['earn'];
    subscriptionStatus = json['subscription_status'];
    rewardStatus = json['reward_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country'] = this.country;
    data['panelist_status'] = this.panelistStatus;
    data['remaining_balance'] = this.remainingBalance;
    data['reward_type'] = this.rewardType;
    data['created_on_year'] = this.createdOnYear;
    data['redemed'] = this.redemed;
    data['bonus_type'] = this.bonusType;
    data['created_onn'] = this.createdOnn;
    data['admin_approval_status'] = this.adminApprovalStatus;
    data['reject_date'] = this.rejectDate;
    data['reference'] = this.reference;
    data['refer'] = this.refer;
    data['created_on'] = this.createdOn;
    data['earn'] = this.earn;
    data['subscription_status'] = this.subscriptionStatus;
    data['reward_status'] = this.rewardStatus;
    return data;
  }
}
