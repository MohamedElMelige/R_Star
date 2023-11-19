class BannerModel {
  String? status;
  List<Data>? data;
  String? msg;
  List<String>? errors;

  BannerModel({this.status, this.data, this.msg, this.errors});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    msg = json['msg'];
    if (json['errors'] != null) {
      errors = <String>[];
      json['errors'].forEach((v) {
        errors!.add(v);
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['msg'] = this.msg;
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? title;
  String? description;
  String? status;
  String? type;
  String? place;
  String? duration;
  String? ordering;
  String? image;
  String? video;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.title,
        this.description,
        this.status,
        this.type,
        this.place,
        this.duration,
        this.ordering,
        this.image,
        this.video,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    type = json['type'];
    place = json['place'];
    duration = json['duration'];
    ordering = json['ordering'];
    image = json['image'];
    video = json['video'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['description'] = this.description;
    data['status'] = this.status;
    data['type'] = this.type;
    data['place'] = this.place;
    data['duration'] = this.duration;
    data['ordering'] = this.ordering;
    data['image'] = this.image;
    data['video'] = this.video;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}