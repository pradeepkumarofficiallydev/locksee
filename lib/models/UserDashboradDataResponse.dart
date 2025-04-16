class UserDashboradDataResponse {
  bool? success;
  int? code;
  String? message;
  Data? data;

  UserDashboradDataResponse({this.success, this.code, this.message, this.data});

  UserDashboradDataResponse.fromJson(Map<String, dynamic> json) {
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
  int? surveyQualified;
  int? rewardEarned;
  int? pointEarned;
  int? pointRedeemed;
  int? redeemableBalanceToday;
  int? rewardPointBalance;
  String? percentage;
  int? notificationCount;
  String? demoSurveyTaken;
  String? latestSurveys;

  Data(
      {this.surveyQualified,
        this.rewardEarned,
        this.pointEarned,
        this.pointRedeemed,
        this.redeemableBalanceToday,
        this.rewardPointBalance,
        this.percentage,
        this.notificationCount,
        this.demoSurveyTaken,
        this.latestSurveys});

  Data.fromJson(Map<String, dynamic> json) {
    surveyQualified = json['survey qualified'];
    rewardEarned = json['reward earned'];
    pointEarned = json['point earned'];
    pointRedeemed = json['point redeemed'];
    redeemableBalanceToday = json['Redeemable Balance today'];
    rewardPointBalance = json['Reward Point balance'];
    percentage = json['percentage'];
    notificationCount = json['notification_count'];
    demoSurveyTaken = json['demo_survey_taken'];
    latestSurveys = json['latest surveys'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['survey qualified'] = this.surveyQualified;
    data['reward earned'] = this.rewardEarned;
    data['point earned'] = this.pointEarned;
    data['point redeemed'] = this.pointRedeemed;
    data['Redeemable Balance today'] = this.redeemableBalanceToday;
    data['Reward Point balance'] = this.rewardPointBalance;
    data['percentage'] = this.percentage;
    data['notification_count'] = this.notificationCount;
    data['demo_survey_taken'] = this.demoSurveyTaken;
    data['latest surveys'] = this.latestSurveys;
    return data;
  }
}
