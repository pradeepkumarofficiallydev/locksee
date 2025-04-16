class PointsTagsResponse {
  bool? success;
  int? code;
  String? message;
  DataList? data;

  PointsTagsResponse({this.success, this.code, this.message, this.data});

  PointsTagsResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    data = json['data'] != null ? DataList.fromJson(json['data']) : null;
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

class DataList {
  int? totalCount;
  List<DataItem>? data;

  DataList({this.totalCount, this.data});

  DataList.fromJson(Map<String, dynamic> json) {
    totalCount = json['totalCount'];
    if (json['data'] != null) {
      data = <DataItem>[];
      json['data'].forEach((v) {
        data!.add(DataItem.fromJson(v));
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

class DataItem {
  int? listingCultureId;
  String? options;
  int? id;

  DataItem({this.listingCultureId, this.options, this.id});

  DataItem.fromJson(Map<String, dynamic> json) {
    listingCultureId = json['listing_culture_id'];
    options = json['options'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['listing_culture_id'] = listingCultureId;
    data['options'] = options;
    data['id'] = id;
    return data;
  }
}
