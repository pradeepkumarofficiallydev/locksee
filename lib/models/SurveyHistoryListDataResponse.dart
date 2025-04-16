class SurveyHistoryListDataResponse {
  bool? success;
  int? code;
  String? message;
  Data? data;

  SurveyHistoryListDataResponse(
      {this.success, this.code, this.message, this.data});

  SurveyHistoryListDataResponse.fromJson(Map<String, dynamic> json) {
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
  int? totalCount;
  String? skip;
  int? limit;
  List<Result>? result;

  Data({this.totalCount, this.skip, this.limit, this.result});

  Data.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    skip = json['skip'];
    limit = json['limit'];
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalCount'] = this.totalCount;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? surveyStatus;
  int? earnings;
  int? amount;
  String? status;
  int? listingCultureId;
  String? participatedOn;
  String? surveyId;
  String? surveyAbout;
  int? rewardEarned;
  String? date;

  Result(
      {this.surveyStatus,
        this.earnings,
        this.amount,
        this.status,
        this.listingCultureId,
        this.participatedOn,
        this.surveyId,
        this.surveyAbout,
        this.rewardEarned,
        this.date});

  Result.fromJson(Map<String, dynamic> json) {
    surveyStatus = json['survey_status'];
    earnings = json['earnings'];
    amount = json['amount'];
    status = json['status'];
    listingCultureId = json['listing_culture_id'];
    participatedOn = json['participated_on'];
    surveyId = json['survey_id'];
    surveyAbout = json['survey_about'];
    rewardEarned = json['reward_earned'];
    date = json['Date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['survey_status'] = this.surveyStatus;
    data['earnings'] = this.earnings;
    data['amount'] = this.amount;
    data['status'] = this.status;
    data['listing_culture_id'] = this.listingCultureId;
    data['participated_on'] = this.participatedOn;
    data['survey_id'] = this.surveyId;
    data['survey_about'] = this.surveyAbout;
    data['reward_earned'] = this.rewardEarned;
    data['Date'] = this.date;
    return data;
  }
}
