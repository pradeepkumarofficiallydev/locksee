class UserEducationProfilesResponse {
  bool? success;
  int? code;
  String? message;
  EducationData? data;

  UserEducationProfilesResponse({this.success, this.code, this.message, this.data});

  UserEducationProfilesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? EducationData.fromJson(json['data']) : null;
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

class EducationData {
  List<EducationDetails>? data;

  EducationData({this.data});

  EducationData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <EducationDetails>[];
      json['data'].forEach((v) {
        data!.add(EducationDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EducationDetails {
  int? questionAnswerId;
  int? userId;
  int? questionId;
  int? gridSubquestionId;
  String? answer;
  Null? otherAnswer;
  Null? answerType;
  String? source;

  EducationDetails(
      {this.questionAnswerId,
        this.userId,
        this.questionId,
        this.gridSubquestionId,
        this.answer,
        this.otherAnswer,
        this.answerType,
        this.source});

  EducationDetails.fromJson(Map<String, dynamic> json) {
    questionAnswerId = json['question_answer_id'];
    userId = json['user_id'];
    questionId = json['question_id'];
    gridSubquestionId = json['grid_subquestion_id'];
    answer = json['answer'];
    otherAnswer = json['other_answer'];
    answerType = json['answer_type'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_answer_id'] = this.questionAnswerId;
    data['user_id'] = this.userId;
    data['question_id'] = this.questionId;
    data['grid_subquestion_id'] = this.gridSubquestionId;
    data['answer'] = this.answer;
    data['other_answer'] = this.otherAnswer;
    data['answer_type'] = this.answerType;
    data['source'] = this.source;
    return data;
  }
}
