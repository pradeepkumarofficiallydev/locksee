class SurveyPreferencesQuestionResponse {
  bool? success;
  dynamic? code;
  String? message;
  SurveyData? data;






  SurveyPreferencesQuestionResponse({this.success, this.code, this.message, this.data});

  SurveyPreferencesQuestionResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? SurveyData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['success'] = success;
    json['code'] = code;
    json['message'] = message;
    if (data != null) {
      json['data'] = data!.toJson();
    }
    return json;
  }
}



class SurveyData {
  dynamic? totalCount;
  List<SurveyQuestion>? questions;

  SurveyData({this.totalCount, this.questions});

  SurveyData.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['data'] != null) {
      questions = [];
      json['data'].forEach((v) {
        questions!.add(SurveyQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['totalCount'] = totalCount;
    if (questions != null) {
      json['data'] = questions!.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class SurveyQuestion {
  dynamic? questionId;
  String? questionType;
  String? question;
  String? subCategoryName;
  List<AnswerItem>? items;
  List<PrivacySelectedAns>? privacySelectedAns;
  String? isCheckbox;
  dynamic? emailConsentStatus;

  SurveyQuestion(
      {this.questionId,
        this.questionType,
        this.question,
        this.subCategoryName,
        this.items,
        this.privacySelectedAns,
        this.isCheckbox,
        this.emailConsentStatus});

  SurveyQuestion.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionType = json['question_type'];
    question = json['question'];
    subCategoryName = json['sub_category_name'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(AnswerItem.fromJson(v));
      });
    }
    if (json['privacy_selected_ans'] != null) {
      privacySelectedAns = [];
      json['privacy_selected_ans'].forEach((v) {
        privacySelectedAns!.add(PrivacySelectedAns.fromJson(v));
      });
    }
    isCheckbox = json['isCheckbox'];
    emailConsentStatus = json['email_consent_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['question_id'] = questionId;
    json['question_type'] = questionType;
    json['question'] = question;
    json['sub_category_name'] = subCategoryName;
    if (items != null) {
      json['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (privacySelectedAns != null) {
      json['privacy_selected_ans'] = privacySelectedAns!.map((v) => v.toJson()).toList();
    }
    json['isCheckbox'] = isCheckbox;
    json['email_consent_status'] = emailConsentStatus;
    return json;
  }
}

class AnswerItem {
  dynamic? questionAnswerId;
  dynamic? answer;
  dynamic? globalAnswerId;
  dynamic? gridSubquestionId;

  AnswerItem({this.questionAnswerId, this.answer, this.globalAnswerId, this.gridSubquestionId});

  AnswerItem.fromJson(Map<String, dynamic> json) {
    questionAnswerId = json['question_answer_id'];
    answer = json['answer'];
    globalAnswerId = json['global_answer_id'];
    gridSubquestionId = json['grid_subquestion_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = {};
    json['question_answer_id'] = questionAnswerId;
    json['answer'] = answer;
    json['global_answer_id'] = globalAnswerId;
    json['grid_subquestion_id'] = gridSubquestionId;
    return json;
  }
}


class PrivacySelectedAns {
  dynamic? questionAnswerId;
  dynamic? userId;
  dynamic? questionId;
  dynamic? gridSubquestionId;
  dynamic? answer;
  dynamic? otherAnswer;
  dynamic? answerType;
  dynamic? source;


  PrivacySelectedAns(
      {this.questionAnswerId,
        this.userId,
        this.questionId,
        this.gridSubquestionId,
        this.answer,
        this.otherAnswer,
        this.answerType,
        this.source});

  PrivacySelectedAns.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> json = {};
    json['question_answer_id'] = questionAnswerId;
    json['user_id'] = userId;
    json['question_id'] = questionId;
    json['grid_subquestion_id'] = gridSubquestionId;
    json['answer'] = answer;
    json['other_answer'] = otherAnswer;
    json['answer_type'] = answerType;
    json['source'] = source;
    return json;
  }
}
