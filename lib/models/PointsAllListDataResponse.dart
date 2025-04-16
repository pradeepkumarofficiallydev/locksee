class PointsAllListDataResponse {
  bool? success;
  int? code;
  String? message;
  Data? data;

  PointsAllListDataResponse({this.success, this.code, this.message, this.data});

  PointsAllListDataResponse.fromJson(Map<String, dynamic> json) {
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
  int? totalcount;
  dynamic? skip;
  String? limit;
  List<FinalData>? finalData;

  Data({this.totalcount, this.skip, this.limit, this.finalData});

  Data.fromJson(Map<String, dynamic> json) {
    totalcount = json['totalcount'];
    skip = json['skip'];
    limit = json['limit'];
    if (json['final_data'] != null) {
      finalData = <FinalData>[];
      json['final_data'].forEach((v) {
        finalData!.add(new FinalData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalcount'] = this.totalcount;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    if (this.finalData != null) {
      data['final_data'] = this.finalData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}




class FinalData {
  String? pollId;
  int? pollIncentive;
  String? createdOn;
  int? yearCreatedOn;
  int? id;
  String? pollName;
  int? pointEarned;
  int? remainingBalance;

  FinalData(
      {this.pollId,
        this.pollIncentive,
        this.createdOn,
        this.yearCreatedOn,
        this.id,
        this.pollName,
        this.pointEarned,
        this.remainingBalance});

  FinalData.fromJson(Map<String, dynamic> json) {
    pollId = json['poll_id'];
    pollIncentive = json['poll_incentive'];
    createdOn = json['created_on'];
    yearCreatedOn = json['year_created_on'];
    id = json['id'];
    pollName = json['poll_name'];
    pointEarned = json['point_earned'];
    remainingBalance = json['remaining_balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poll_id'] = this.pollId;
    data['poll_incentive'] = this.pollIncentive;
    data['created_on'] = this.createdOn;
    data['year_created_on'] = this.yearCreatedOn;
    data['id'] = this.id;
    data['poll_name'] = this.pollName;
    data['point_earned'] = this.pointEarned;
    data['remaining_balance'] = this.remainingBalance;
    return data;
  }
}
