class GetEducationDetailsResponse {
  bool? success;
  int? code;
  String? message;
  EducationData? data;

  GetEducationDetailsResponse({this.success, this.code, this.message, this.data});

  GetEducationDetailsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? EducationData.fromJson(json['data']) : null;
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

class EducationData {
  int? totalCount;
  List<QuestionData>? questions;

  EducationData({this.totalCount, this.questions});

  EducationData.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['data'] != null) {
      questions = <QuestionData>[];
      json['data'].forEach((v) {
        questions!.add(QuestionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalCount'] = totalCount;
    if (questions != null) {
      data['data'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionData {
  int? questionId;
  List<Items>? items;

  QuestionData({this.questionId, this.items});

  QuestionData.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? questionAnswerId;
  String? answer;

  Items({this.questionAnswerId, this.answer});

  Items.fromJson(Map<String, dynamic> json) {
    questionAnswerId = json['question_answer_id'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_answer_id'] = questionAnswerId;
    data['answer'] = answer;
    return data;
  }
}
