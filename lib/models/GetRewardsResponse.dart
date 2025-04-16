class GetRewardsResponse {
  bool? success;
  int? code;
  String? message;
  RewardList? data;

  GetRewardsResponse({this.success, this.code, this.message, this.data});

  GetRewardsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? RewardList.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class RewardList {
  int? skip;
  int? limit;
  int? totalCount;
  List<RewardItem>? data;

  RewardList({this.skip, this.limit, this.totalCount, this.data});

  RewardList.fromJson(Map<String, dynamic> json) {
    skip = json['skip'];
    limit = json['limit'];
    totalCount = json['total_count'];
    if (json['data'] != null) {
      data = <RewardItem>[];
      json['data'].forEach((v) {
        data!.add(RewardItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skip'] = skip;
    data['limit'] = limit;
    data['total_count'] = totalCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RewardItem {
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

  RewardItem({
    this.country,
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
    this.rewardStatus,
  });

  RewardItem.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country'] = country;
    data['panelist_status'] = panelistStatus;
    data['remaining_balance'] = remainingBalance;
    data['reward_type'] = rewardType;
    data['created_on_year'] = createdOnYear;
    data['redemed'] = redemed;
    data['bonus_type'] = bonusType;
    data['created_onn'] = createdOnn;
    data['admin_approval_status'] = adminApprovalStatus;
    data['reject_date'] = rejectDate;
    data['reference'] = reference;
    data['refer'] = refer;
    data['created_on'] = createdOn;
    data['earn'] = earn;
    data['subscription_status'] = subscriptionStatus;
    data['reward_status'] = rewardStatus;
    return data;
  }
}