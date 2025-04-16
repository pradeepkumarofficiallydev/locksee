class GetPollQuestionAnswerResponse {
  bool? success;
  int? code;
  String? message;
  PollData? data;

  GetPollQuestionAnswerResponse({this.success, this.code, this.message, this.data});

  GetPollQuestionAnswerResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? PollData.fromJson(json['data']) : null;
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

class PollData {
  int? totalCount;
  List<PollQuestion>? data;

  PollData({this.totalCount, this.data});

  PollData.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data!.add(PollQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['totalCount'] = totalCount;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PollQuestion {
  int? pollQuestionId;
  String? questionInLocal;
  String? imageName;
  String? image;
  int? pollId;
  String? permaLink;
  int? pollType;
  List<Options>? options;

  PollQuestion({
    this.pollQuestionId,
    this.questionInLocal,
    this.imageName,
    this.image,
    this.pollId,
    this.permaLink,
    this.pollType,
    this.options,
  });

  PollQuestion.fromJson(Map<String, dynamic> json) {
    pollQuestionId = json['poll_question_id'];
    questionInLocal = json['question_in_local'];
    imageName = json['image_name'];
    image = json['image'];
    pollId = json['poll_id'];
    permaLink = json['perma_link'];
    pollType = json['poll_type'];
    if (json['options'] != null) {
      options = [];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['poll_question_id'] = pollQuestionId;
    data['question_in_local'] = questionInLocal;
    data['image_name'] = imageName;
    data['image'] = image;
    data['poll_id'] = pollId;
    data['perma_link'] = permaLink;
    data['poll_type'] = pollType;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  int? pollAnswerId;
  String? pollOptionInLocalLanguage;

  Options({this.pollAnswerId, this.pollOptionInLocalLanguage});

  Options.fromJson(Map<String, dynamic> json) {
    pollAnswerId = json['poll_answer_id'];
    pollOptionInLocalLanguage = json['poll_option_in_local_language'];
  }

  Map<String,
      dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['poll_answer_id'] = pollAnswerId;
    data['poll_option_in_local_language'] = pollOptionInLocalLanguage;
    return data;
  }
}
