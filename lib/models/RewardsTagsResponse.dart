class RewardsTagsResponse {
  bool? success;
  int? code;
  String? message;
  RewardsData? data; // Renamed class reference

  RewardsTagsResponse({this.success, this.code, this.message, this.data});

  RewardsTagsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? RewardsData.fromJson(json['data']) : null;
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

class RewardsData {
  int? skip;
  int? limit;
  List<CultureData>? data; // Correct reference to avoid recursion

  RewardsData({this.skip, this.limit, this.data});

  RewardsData.fromJson(Map<String, dynamic> json) {
    skip = json['skip'];
    limit = json['limit'];
    if (json['data'] != null) {
      data = <CultureData>[];
      json['data'].forEach((v) {
        data!.add(CultureData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['skip'] = skip;
    data['limit'] = limit;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CultureData {
  int? listingCultureId;
  String? options;

  CultureData({this.listingCultureId, this.options});

  CultureData.fromJson(Map<String, dynamic> json) {
    listingCultureId = json['listing_culture_id'];
    options = json['options'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['listing_culture_id'] = listingCultureId;
    data['options'] = options;
    return data;
  }
}
